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
    case sendEmail(param: String)
    case getPassword(param: String)
    case refreshToken(request: TokenRequest)
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
    case .sendEmail(let param):
        return "/api/accounts/email/\(param)"
    case .getPassword(let param):
        return "/api/accounts/password/\(param)"
    case .refreshToken:
        return "/api/accounts/reissue"
    }
  }
  
  var method: Moya.Method {
    switch self {
    case .signUp, .signIn, .refreshToken:
      return .post
    case .sendEmail, .getPassword:
        return .get
    }
  }
  
  var task: Task {
    switch self {
    case .signUp(let param):
        return .requestJSONEncodable(param)
    case .signIn(let param):
        return .requestJSONEncodable(param)
    case .sendEmail:
        return .requestPlain
    case .getPassword:
        return .requestPlain
    case .refreshToken(request: let request):
        return .requestJSONEncodable(request)
    }
  }

  var headers: [String: String]? {
    switch self {
    default:
      return ["Content-Type": "application/json"]
    }
  }
}
