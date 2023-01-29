//
//  SignService.swift
//  FITI
//
//  Created by 홍준혁 on 2023/01/24.
//

import Moya
import Foundation

enum SignRouter {
    case signUp(param: SignUpRequest)
    case signIn(param: SignInRequest)
}

extension SignRouter: TargetType {
  public var baseURL: URL {
      return URL(string: BaseURL.BURL)!
  }
  
  var path: String {
    switch self {
    case .signUp:
        return "/api/accounts/customer"
    case .signIn:
        return "/api/accounts/login"
    }
  }
  
  var method: Moya.Method {
    switch self {
    case .signUp,
         .signIn:
      return .post
    }
  }
  
  var task: Task {
    switch self {
    case .signUp(let param):
        return .requestJSONEncodable(param)
    case .signIn(let param):
        return .requestJSONEncodable(param)
    }
  }

  var headers: [String: String]? {
    switch self {
    default:
      return ["Content-Type": "application/json"]
    }
  }
}
