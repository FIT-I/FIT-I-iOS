//
//  TrainerRouter.swift
//  FITI
//
//  Created by 홍준혁 on 2023/01/29.
//

import Foundation
import Moya
import Realm

enum TrainerRouter {
    case getFristTrainerList(_ category:String, _ pageable: TrainerArrayListRequest)
    case getTrainerList(_ category:String, _ lastTrainerIdx:Int, _ pageable: TrainerArrayListRequest)
}

extension TrainerRouter: TargetType, AccessTokenAuthorizable {
    var baseURL: URL {
        return URL(string: BaseURL.BURL)!
    }
    
    var path: String {
        switch self {
        case .getFristTrainerList:
            return "/api/customer/trainer-list"
        case .getTrainerList:
            return "/api/customer/trainer-list"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getFristTrainerList, .getTrainerList:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getFristTrainerList(let category, let pageable):
            return .requestParameters(parameters: ["category":category,"page":pageable.page,"size":pageable.size,"sort":pageable.sort], encoding: URLEncoding.queryString)
        case .getTrainerList(let category, let lastTrainerIdx, let pageable):
            return .requestParameters(parameters: ["category":category,"lastTrainerIdx":lastTrainerIdx,"page":pageable.page,"size":pageable.size,"sort":pageable.sort], encoding: URLEncoding.queryString)
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
