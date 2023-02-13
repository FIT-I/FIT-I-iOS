//
//  MyPageAPI.swift
//  FITI
//
//  Created by 홍준혁 on 2023/01/29.
//

import Foundation

import Moya
import UIKit

final class MyPageAPI {
    static let shared = MyPageAPI()
    private var myPageProvider = MoyaProvider<MyPageRouter>()
    
    private init() {}
    
    private(set) var myPageData: MyPageResponse?
    private(set) var locationSettingData: PetchLocationResponse?
    private(set) var heartListData: HeartListResponse?
    private(set) var withDrawData: WithDrawResponse?
    private(set) var patchPasswordData: PatchPasswordResponse?
    private(set) var changeProfile: ChangeProfileResponse?
    private(set) var announcementData: AnnouncementResponse?
    
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
    
    // 5. 비밀번호 변경 API
    func patchPasswordAPI(body:PatchPasswordRequest, completion: @escaping (PatchPasswordResponse?) -> Void){
        myPageProvider.request(.patchPassword(body)) { [self] (response) in
            switch response {
            case .success(let moyaResponse):
                do {
                    self.patchPasswordData = try moyaResponse.map(PatchPasswordResponse.self)
                    completion(patchPasswordData)
                } catch(let err) {
                    print(err.localizedDescription, 500)
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
    
    // 6. 사용자 프로필 수정 API
    func patchProfile(profile:String, completion: @escaping (ChangeProfileResponse?) -> Void){
        myPageProvider.request(.changeProfile(profile)) { [self] (response) in
            switch response {
            case .success(let moyaResponse):
                do {
                    self.changeProfile = try moyaResponse.map(ChangeProfileResponse.self)
                    completion(changeProfile)
                } catch(let err) {
                    print(err.localizedDescription, 500)
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
    
    // 7. 공지사항 불러오는 API
    func getAnnouncement(completion: @escaping (AnnouncementResponse?) -> Void){
        myPageProvider.request(.getAnnouncement) { [self] (response) in
            switch response {
            case .success(let moyaResponse):
                do {
                    self.announcementData = try moyaResponse.map(AnnouncementResponse.self)
                    completion(announcementData)
                } catch(let err) {
                    print(err.localizedDescription, 500)
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
}

