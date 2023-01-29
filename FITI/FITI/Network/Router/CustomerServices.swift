//
//  CustomerServices.swift
//  FITI
//
//  Created by 홍준혁 on 2023/01/26.
//

import Moya
import Foundation
import Realm

enum CustomerServices {
    case addHeart(_ trainerIndex: Int)
    case requestTrain(_ trainerIndex: Int, _ param: RequestTrainerRequest)
}

extension CustomerServices: TargetType, AccessTokenAuthorizable {
    
    
    var baseURL: URL {
        return URL(string: BaseURL.BURL)!
    }
    
    var path: String {
        switch self {
        case .addHeart(let trainerIndex):
            return "/api/customer/\(trainerIndex)"
        case .requestTrain(let trainerIndex, _):
            return "/api/customer/matching/\(trainerIndex)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .addHeart, .requestTrain:
            return .post
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .addHeart:
            return .requestPlain
        case .requestTrain(_, let param):
            return .requestJSONEncodable(param)
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

