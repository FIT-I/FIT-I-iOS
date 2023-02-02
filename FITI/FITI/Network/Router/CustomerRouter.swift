//
//  CustomerServices.swift
//  FITI
//
//  Created by 홍준혁 on 2023/01/26.
//

import Moya
import Foundation
import Realm

enum CustomerRouter {
    case addHeart(_ trainerIndex: Int)
    case deleteHeart(_ trainerIndex: Int)
    case requestTrain(_ trainerIndex: Int, _ body: RequestMatchingRequest)
}

extension CustomerRouter: TargetType, AccessTokenAuthorizable {
    
    
    var baseURL: URL {
        return URL(string: BaseURL.BURL)!
    }
    
    var path: String {
        switch self {
        case .addHeart(let trainerIndex):
            return "/api/customer/\(trainerIndex)"
        case .deleteHeart(let trainerIndex):
            return "/api/customer/\(trainerIndex)"
        case .requestTrain(let trainerIndex, _):
            return "/api/customer/matching/\(trainerIndex)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .addHeart, .requestTrain:
            return .post
        case .deleteHeart:
            return .delete
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .addHeart, .deleteHeart:
            return .requestPlain
        case .requestTrain(_, let body):
            return .requestJSONEncodable(body)
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
    
    var authorizationType: AuthorizationType? {
        switch self {
        default:
            return .bearer
        }
    }
}

