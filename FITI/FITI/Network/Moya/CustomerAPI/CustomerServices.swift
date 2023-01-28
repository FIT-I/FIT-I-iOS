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
    case writeReview(_ param: WriteReviewRequest)
    case requestTrain(_ trainerIndex: Int, _ param: RequestTrainerRequest)
    case fixProfile(_ profile:String)
    case notificationSetting(_ notIdx:Int)
    case locationSetting(_ location:String)
    case getFristTrainerList(_ category:String, _ pageable: TrainerArrayListRequest)
    case getTrainerList(_ category:String, _ lastTrainerIdx:Int, _ pageable: TrainerArrayListRequest)
    case getHeartList
}

extension CustomerServices: TargetType, AccessTokenAuthorizable {
    
    
    var baseURL: URL {
        return URL(string: BaseURL.BURL)!
    }
    
    var path: String {
        switch self {
        case .addHeart(let trainerIndex):
            return "/api/customer/\(trainerIndex)"
        case .writeReview:
            return "/api/customer/review"
        case .requestTrain(let trainerIndex, _):
            return "/api/customer/matching/\(trainerIndex)"
        case .fixProfile(let profile):
            return "/api/customer/profile/\(profile)"
        case .notificationSetting(let notIdx):
            return "/api/customer/notification/\(notIdx)"
        case .locationSetting(let location):
            return "/api/customer/location/\(location)"
        case .getFristTrainerList:
            return "/api/customer/trainer-list"
        case .getTrainerList:
            return "/api/customer/trainer-list"
        case .getHeartList:
            return "/api/customer/wish"
            
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .addHeart, .writeReview, .requestTrain:
            return .post
        case .fixProfile, .notificationSetting, .locationSetting:
            return .patch
        case .getFristTrainerList, .getTrainerList, .getHeartList:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .addHeart:
            return .requestPlain
        case .writeReview(let param):
            return .requestJSONEncodable(param)
        case .requestTrain(_, let param):
            return .requestJSONEncodable(param)
        case .fixProfile:
            return .requestPlain
        case .notificationSetting:
            return .requestPlain
        case .locationSetting:
            return .requestPlain
        case .getFristTrainerList(let category, let pageable):
            return .requestParameters(parameters: ["category":category,"page":pageable.page,"size":pageable.size,"sort":pageable.sort], encoding: URLEncoding.queryString)
        case .getTrainerList(let category, let lastTrainerIdx, let pageable):
            return .requestParameters(parameters: ["category":category,"lastTrainerIdx":lastTrainerIdx,"page":pageable.page,"size":pageable.size,"sort":pageable.sort], encoding: URLEncoding.queryString)
        case .getHeartList:
            return .requestPlain
        }
    }
    
    var authorizationType: AuthorizationType? {
        switch self {
        default:
            return .bearer
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
}

