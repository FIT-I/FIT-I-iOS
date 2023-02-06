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
    case getMatchingList
    case getMatchSheet(_ matchingIndex: Int)
    case getSuccessMatchList
    case postReview(_ body: WriteReviewRequest)
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
        case .getMatchingList:
            return "/api/matching/customer"
        case .getMatchSheet(let matchingIndex):
            return "/api/matching/\(matchingIndex)"
        case .getSuccessMatchList:
            return "/api/chat/entered"
        case .postReview:
            return "/api/customer/review"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .addHeart, .requestTrain, .postReview:
            return .post
        case .deleteHeart:
            return .delete
        case .getMatchingList, .getMatchSheet, .getSuccessMatchList:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .addHeart, .deleteHeart, .getMatchingList, .getMatchSheet, .getSuccessMatchList:
            return .requestPlain
        case .requestTrain(_, let body):
            return .requestJSONEncodable(body)
        case .postReview(let body):
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

