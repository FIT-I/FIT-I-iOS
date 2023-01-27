//
//  MyPageServices.swift
//  FITI
//
//  Created by 홍준혁 on 2023/01/27.
//

import Moya
import Foundation

enum MyPageServices {
    case getMyPage
}

extension MyPageServices: TargetType, AccessTokenAuthorizable {
    var baseURL: URL {
        return URL(string: BaseURL.BURL)!
    }
    
    var path: String {
        switch self {
        case .getMyPage:
            return "/api/communal/mypage"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getMyPage:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getMyPage:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        default:
            let realm = RealmService()
            let token = realm.getToken()
            return ["Content-Type":"application/json",
                    "Authorization": "Bearer \(token)"]
        }
    }
    
    var authorizationType: Moya.AuthorizationType? {
        switch self {
        default:
            return .bearer
        }
    }
    
    
}
