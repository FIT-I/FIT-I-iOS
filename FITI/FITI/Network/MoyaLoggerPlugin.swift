//
//  MoyaLoggerPlugin.swift
//  FITI
//
//  Created by 홍준혁 on 2023/02/13.
//

import Foundation
import Moya

final class MoyaLoggerPlugin: PluginType {
    
    static let shared = MoyaLoggerPlugin()
    let realm = RealmService()
    
    // 🔥 Request 가 전송되기 전.
    func willSend(_ request: RequestType, target: TargetType) {
        guard let httpRequest = request.request else {
            print("--> 유효하지 않은 요청")
            return
        }
        let url = httpRequest.description
        let method = httpRequest.httpMethod ?? "unknown method"
        var log = "----------------------------------------------------\n[\(method)] \(url)\n----------------------------------------------------\n"
        log.append("API: \(target)\n")
        if let headers = httpRequest.allHTTPHeaderFields, !headers.isEmpty {
            log.append("header: \(headers)\n")
        }
        if let body = httpRequest.httpBody, let bodyString = String(bytes: body, encoding: String.Encoding.utf8) {
            log.append("\(bodyString)\n")
        }
        log.append("------------------- END \(method) --------------------------")
        print(log)
    }

    // 🔥 Response 를 받은 후.
//    func didReceive(_ result: Result<Response, MoyaError>, target: TargetType) {
//        switch result {
//        case let .success(response):
//            onSuceed(response, target: target, isFromError: false)
//        case let .failure(error):
//            onFail(error, target: target)
//        }
//    }

    func onSuceed(_ response: Response, target: TargetType, isFromError: Bool) {
        let request = response.request
        let url = request?.url?.absoluteString ?? "nil"
        let statusCode = response.statusCode

        var log = "------------------- 네트워크 통신 성공(isFromError: \(isFromError)) -------------------"
        log.append("\n[\(statusCode)] \(url)\n----------------------------------------------------\n")
        log.append("API: \(target)\n")
        response.response?.allHeaderFields.forEach {
            log.append("\($0): \($1)\n")
        }
        if let reString = String(bytes: response.data, encoding: String.Encoding.utf8) {
            log.append("\(reString)\n")
        }
        log.append("------------------- END HTTP (\(response.data.count)-byte body) -------------------")
        print(log)

        // 🔥 401 인 경우 리프레쉬 토큰 + 액세스 토큰 을 가지고 갱신 시도.
        switch statusCode {
        case 401:
            let tokenRequest = TokenRequest(accessToken: self.realm.getToken(), refreshToken: self.realm.getRefreshToken())
            // 🔥 토큰 갱신 서버통신 메서드.
            userTokenReissueWithAPI(request: tokenRequest)
        default:
            return
        }
    }

    func onFail(_ error: MoyaError, target: TargetType) {
        if let response = error.response {
            onSuceed(response, target: target, isFromError: true)
            return
        }
        var log = "네트워크 오류"
        log.append("<-- \(error.errorCode) \(target)\n")
        log.append("\(error.failureReason ?? error.errorDescription ?? "unknown error")\n")
        log.append("<-- END HTTP")
        print(log)
    }
    
    func cleanData(){
        try! realm.localRealm?.write {
            realm.localRealm?.deleteAll()
        }
        TrainerDetailViewController.isHeartFull = false
        TrainerDetailViewController.trainerHeartList = .init()
        HomeViewController.trainerList = .init()
        DietTrainerViewController.trainerList = .init()
        FoodTrainerViewController.trainerList = .init()
        RehabilitationTrainerViewController.trainerList = .init()
        FriendTrainerViewController.trainerList = .init()
        BodyReviewView.previewReviewData = .init()
        RequestResultViewController.meetingSheet = .init()
        CommunityViewController.matchingList = .init()
        RequestSheetViewController.requestSheetData = .init()
        RequestSheetViewController.trainerIndex = Int()
        MatchViewController.successMatchList = .init()
        HeartListViewController.heartList = .init()
    }
}

// 🔥 Network.
extension MoyaLoggerPlugin {
    func userTokenReissueWithAPI(request: TokenRequest){
        SignAPI.shared.refreshTokenAPI(request: request) { response in
            if response?.code == 406 {
                // 🔥 로그인뷰로 화면전환. 액세스 토큰, 리프레쉬 토큰, userID 삭제.
                self.cleanData()
                print("406 - 리프레쉬 토큰 만료")
            }else {
                if response?.isSuccess == true {
                    self.realm.addToken(accessToken: response?.result?.accessToken ?? "", refreshToken: response?.result?.refreshToken ?? "")
                    print("userTokenReissueWithAPI - success")
                }else {
                    print("버그")
                }
            }
        }
    }
}
