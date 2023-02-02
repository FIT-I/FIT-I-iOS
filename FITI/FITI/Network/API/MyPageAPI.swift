//
//  MyPageAPI.swift
//  FITI
//
//  Created by 홍준혁 on 2023/01/29.
//

import Foundation

import Moya

final class MyPageAPI {
    static let shared = MyPageAPI()
    private var myPageProvider = MoyaProvider<MyPageRouter>()
    
    private init() { }
    
    private(set) var myPageData: MyPageResponse?
    private(set) var locationSettingData: PetchLocationResponse?
    private(set) var heartListData: HeartListResponse?
    private(set) var withDrawData: WithDrawResponse?
    
    // 1. 마이페이지 조회 API
    func getMyPageDataAPI(completion: @escaping (MyPageResponse?) -> Void){
        myPageProvider.request(.getMyPage) { [self] (response) in
            switch response {
            case .success(let moyaResponse):
                do {
                    print(moyaResponse.statusCode)
                    self.myPageData = try moyaResponse.map(MyPageResponse.self)
                    completion(myPageData)
                } catch(let err) {
                    print(err.localizedDescription, 500)
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
    
    // 2. 매칭 위치 설정 API
    func postLoctionAPI(location:String, completion: @escaping (PetchLocationResponse?) -> Void){
        myPageProvider.request(.locationSetting(location)) { [self] (response) in
            switch response {
            case .success(let moyaResponse):
                do {
                    self.locationSettingData = try moyaResponse.map(PetchLocationResponse.self)
                    completion(locationSettingData)
                } catch(let err) {
                    print(err.localizedDescription, 500)
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
    
    // 3. 찜 목록 조회 API
    func getHeartListAPI(completion: @escaping (HeartListResponse?) -> Void){
        myPageProvider.request(.getHeartList) { [self] (response) in
            switch response {
            case .success(let moyaResponse):
                do {
                    self.heartListData = try moyaResponse.map(HeartListResponse.self)
                    completion(heartListData)
                } catch(let err) {
                    print(err.localizedDescription, 500)
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
    
    // 4. 회원탈퇴 API
    func withDrawAPI(completion: @escaping (WithDrawResponse?) -> Void){
        myPageProvider.request(.withDraw) { [self] (response) in
            switch response {
            case .success(let moyaResponse):
                do {
                    self.withDrawData = try moyaResponse.map(WithDrawResponse.self)
                    completion(withDrawData)
                } catch(let err) {
                    print(err.localizedDescription, 500)
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
}

