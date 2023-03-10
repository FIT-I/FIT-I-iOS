//
//  MoyaLoggerPlugin.swift
//  FITI
//
//  Created by νμ€ν on 2023/02/13.
//

import Foundation
import Moya

final class MoyaLoggerPlugin: PluginType {
    
    static let shared = MoyaLoggerPlugin()
    let realm = RealmService()
    
    // π₯ Request κ° μ μ‘λκΈ° μ .
    func willSend(_ request: RequestType, target: TargetType) {
        guard let httpRequest = request.request else {
            print("--> μ ν¨νμ§ μμ μμ²­")
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

    // π₯ Response λ₯Ό λ°μ ν.
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

        var log = "------------------- λ€νΈμν¬ ν΅μ  μ±κ³΅(isFromError: \(isFromError)) -------------------"
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

        // π₯ 401 μΈ κ²½μ° λ¦¬νλ μ¬ ν ν° + μ‘μΈμ€ ν ν° μ κ°μ§κ³  κ°±μ  μλ.
        switch statusCode {
        case 401:
            let tokenRequest = TokenRequest(accessToken: self.realm.getToken(), refreshToken: self.realm.getRefreshToken())
            // π₯ ν ν° κ°±μ  μλ²ν΅μ  λ©μλ.
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
        var log = "λ€νΈμν¬ μ€λ₯"
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

// π₯ Network.
extension MoyaLoggerPlugin {
    func userTokenReissueWithAPI(request: TokenRequest){
        SignAPI.shared.refreshTokenAPI(request: request) { response in
            if response?.code == 406 {
                // π₯ λ‘κ·ΈμΈλ·°λ‘ νλ©΄μ ν. μ‘μΈμ€ ν ν°, λ¦¬νλ μ¬ ν ν°, userID μ­μ .
                self.cleanData()
                print("406 - λ¦¬νλ μ¬ ν ν° λ§λ£")
            }else {
                if response?.isSuccess == true {
                    self.realm.addToken(accessToken: response?.result?.accessToken ?? "", refreshToken: response?.result?.refreshToken ?? "")
                    print("userTokenReissueWithAPI - success")
                }else {
                    print("λ²κ·Έ")
                }
            }
        }
    }
}
