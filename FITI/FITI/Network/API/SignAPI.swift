//
//  SignAPI.swift
//  FITI
//
//  Created by 홍준혁 on 2023/01/29.
//

import Foundation

import Moya

final class SignAPI {
    static let shared = SignAPI()
    private var signProvider = MoyaProvider<SignRouter>()
    
    private init() { }
    
    private(set) var signInData: SignInResponse?
    private(set) var signUpData: SignUpResponse?

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
                        print(err.localizedDescription, 500)
                    }
                case .failure(let err):
                    print(err.localizedDescription)
            }
        }
    }
}
