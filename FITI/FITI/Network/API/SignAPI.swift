//
//  SignAPI.swift
//  FITI
//
//  Created by 홍준혁 on 2023/01/29.
//

import Foundation

import Moya
import UIKit

final class SignAPI {
    static let shared = SignAPI()
    private var signProvider = MoyaProvider<SignRouter>()
    let realm = RealmService()
    
    private init() { }
    
    private(set) var signInData: SignInResponse?
    private(set) var signUpData: SignUpResponse?
    private(set) var sendEmailData: SendEmailResponse?
    private(set) var getPasswordData: FindPasswordResponse?
    private(set) var refreshTokenData: TokenResponse?

    // 1. 로그인 API
    func postSignInAPI(email:String, password:String, completion: @escaping (SignInResponse?) -> Void){
        let param = SignInRequest.init(email,password)
        signProvider.request(.signIn(param: param)) { [self] (response) in
            switch response {
            case .success(let moyaResponse):
                do {
                    self.signInData = try moyaResponse.map(SignInResponse.self)
                    completion(signInData)
                } catch(let err) {
                    // MARK: - 여기로 401이 들어오나?
                    if moyaResponse.statusCode == 401 || moyaResponse.statusCode == 406 {
                        let oldToken = TokenRequest(accessToken: self.realm.getToken(), refreshToken: self.realm.getRefreshToken())
                        MoyaLoggerPlugin.shared.userTokenReissueWithAPI(request: oldToken)
                    }
                    print(err.localizedDescription, 500)
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
    
    // 2. 회원가입 API
    func postSignUpAPI(name:String,email:String, password:String, profileImage:String, completion: @escaping (SignUpResponse?) -> Void){
        let param = SignUpRequest.init(name, email, password, profileImage)
        signProvider.request(.signUp(param: param)){ [self] (response) in
            switch response {
            case .success(let moyaResponse):
                do {
                    self.signUpData = try moyaResponse.map(SignUpResponse.self)
                    completion(signUpData)
                } catch(let err) {
                    // MARK: - 여기로 401이 들어오나?
                    if moyaResponse.statusCode == 401 || moyaResponse.statusCode == 406 {
                        let oldToken = TokenRequest(accessToken: self.realm.getToken(), refreshToken: self.realm.getRefreshToken())
                        MoyaLoggerPlugin.shared.userTokenReissueWithAPI(request: oldToken)
                    }
                    print(err.localizedDescription, 500)
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
    
    // 3. 인증 메일 전송 API (비밀번호 찾기 1차)
    func sendEmailAPI(email:String, completion: @escaping (SendEmailResponse?) -> Void){
        signProvider.request(.sendEmail(param: email)){ [self] (response) in
            switch response {
            case .success(let moyaResponse):
                do {
                    self.sendEmailData = try moyaResponse.map(SendEmailResponse.self)
                    completion(sendEmailData)
                } catch(let err) {
                    // MARK: - 여기로 401이 들어오나?
                    if moyaResponse.statusCode == 401 || moyaResponse.statusCode == 406 {
                        let oldToken = TokenRequest(accessToken: self.realm.getToken(), refreshToken: self.realm.getRefreshToken())
                        MoyaLoggerPlugin.shared.userTokenReissueWithAPI(request: oldToken)
                    }
                    print(err.localizedDescription, 500)
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
    
    // 4. 계정 비밀번호 조회 API (비밀번호 찾기 2차)
    func getPasswordAPI(email:String, completion: @escaping (FindPasswordResponse?) -> Void){
        signProvider.request(.getPassword(param: email)){ [self] (response) in
            switch response {
            case .success(let moyaResponse):
                do {
                    self.getPasswordData = try moyaResponse.map(FindPasswordResponse.self)
                    completion(getPasswordData)
                } catch(let err) {
                    // MARK: - 여기로 401이 들어오나?
                    if moyaResponse.statusCode == 401 || moyaResponse.statusCode == 406 {
                        let oldToken = TokenRequest(accessToken: self.realm.getToken(), refreshToken: self.realm.getRefreshToken())
                        MoyaLoggerPlugin.shared.userTokenReissueWithAPI(request: oldToken)
                    }
                    print(err.localizedDescription, 500)
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
    
    // 5. 토큰 리프레쉬 API
    func refreshTokenAPI(request:TokenRequest, completion: @escaping (TokenResponse?) -> Void){
        signProvider.request(.refreshToken(request: request)) { [self] (response) in
            switch response {
            case .success(let moyaResponse):
                do {
                    self.refreshTokenData = try moyaResponse.map(TokenResponse.self)
                    completion(refreshTokenData)
                } catch(let err) {
                    // MARK: - 여기로 401이 들어오나?
                    if moyaResponse.statusCode == 401 || moyaResponse.statusCode == 406 {
                        let oldToken = TokenRequest(accessToken: self.realm.getToken(), refreshToken: self.realm.getRefreshToken())
                        MoyaLoggerPlugin.shared.userTokenReissueWithAPI(request: oldToken)
                    }
                    print(err.localizedDescription, 500)
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
}
