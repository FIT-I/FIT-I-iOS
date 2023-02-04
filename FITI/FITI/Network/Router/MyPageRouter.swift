//
//  MyPageServices.swift
//  FITI
//
//  Created by 홍준혁 on 2023/01/27.
//

import Moya
import Foundation

enum MyPageRouter {
    case getMyPage
    case writeReview(_ param: WriteReviewRequest)
    case locationSetting(_ location:String)
    case fixProfile(_ profile:String)
    case notificationSetting(_ notIdx:Int)
    case getHeartList
    case withDraw
}

extension MyPageRouter: TargetType, AccessTokenAuthorizable {
    var baseURL: URL {
        return URL(string: BaseURL.BURL)!
    }
    
    var path: String {
        switch self {
        case .getMyPage:
            return "/api/communal/mypage"
        case .locationSetting(let location):
            return "/api/communal/location/\(location)"
        case .writeReview:
            return "/api/customer/review"
        case .fixProfile(let profile):
            return "/api/customer/profile/\(profile)"
        case .notificationSetting(let notIdx):
            return "/api/customer/notification/\(notIdx)"
        case .getHeartList:
            return "/api/customer/wish"
        case .withDraw:
            return "/api/accounts/close"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getMyPage, .getHeartList:
            return .get
        case .writeReview:
            return .post
        case .locationSetting, .fixProfile, .notificationSetting, .withDraw:
            return .patch
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getMyPage, .locationSetting, .notificationSetting, .fixProfile, .getHeartList, .withDraw:
            return .requestPlain
        case .writeReview(let param):
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
    
    var authorizationType: Moya.AuthorizationType? {
        switch self {
        default:
            return .bearer
        }
    }
}
