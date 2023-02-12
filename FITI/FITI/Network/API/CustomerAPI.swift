//
//  CustomerAPI.swift
//  FITI
//
//  Created by 홍준혁 on 2023/01/29.
//

import Foundation

import Moya

final class CustomerAPI {
    static let shared = CustomerAPI()
    private var customerProvider = MoyaProvider<CustomerRouter>()
    
    private init() { }
    
    private(set) var addHeartData: AddHeartResponse?
    private(set) var deleteHeartData: DeleteHeartResponse?
    private(set) var requestMatchingData: RequestMatchingResponse?
    private(set) var matchListData: MatchingListResponse?
    private(set) var getRequestData: MatchSheetResponse?
    private(set) var getSuccessMatchListData: SuccessMatchResponse?
    private(set) var postReviewData: WriteReviewResponse?
    
    // 1. 트레이너 찜 등록 API
    func postAddHeartAPI(trainerIndex:Int, completion: @escaping (AddHeartResponse?) -> Void){
        self.customerProvider.request(.addHeart(trainerIndex)) { [self] (response) in
            switch response {
            case .success(let moyaResponse):
                do {
                    self.addHeartData = try moyaResponse.map(AddHeartResponse.self)
                    completion(addHeartData)
                } catch(let err) {
                    print(err.localizedDescription, 500)
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
    
    // 2. 트레이너 찜 취소 API
    func deleteHeartAPI(trainerIndex:Int, completion: @escaping (DeleteHeartResponse?) -> Void){
        self.customerProvider.request(.deleteHeart(trainerIndex)) { [self] (response) in
            switch response {
            case .success(let moyaResponse):
                do {
                    self.deleteHeartData = try moyaResponse.map(DeleteHeartResponse.self)
                    completion(deleteHeartData)
                } catch(let err) {
                    print(err.localizedDescription, 500)
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
    
    // 3. 트레이너 매칭 요청 API
    func requestMatchAPI(trainerIndex:Int, body:RequestMatchingRequest ,completion: @escaping (RequestMatchingResponse?) -> Void){
        self.customerProvider.request(.requestTrain(trainerIndex, body)) { [self] (response) in
            switch response {
            case .success(let moyaResponse):
                do {
                    self.requestMatchingData = try moyaResponse.map(RequestMatchingResponse.self)
                    completion(requestMatchingData)
                } catch(let err) {
                    print(err.localizedDescription, 500)
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
    
    // 4. 매칭 목록 조회 API
    func getMatchingListAPI(completion: @escaping (MatchingListResponse?) -> Void){
        self.customerProvider.request(.getMatchingList) { [self] (response) in
            switch response {
            case .success(let moyaResponse):
                do {
                    self.matchListData = try moyaResponse.map(MatchingListResponse.self)
                    completion(matchListData)
                } catch(let err) {
                    print(err.localizedDescription, 500)
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
    
    // 5. 특정 매칭 요청서 조회 API
    func getMatchingSheetAPI(matchingIndex:Int, completion: @escaping (MatchSheetResponse?) -> Void) {
        self.customerProvider.request(.getMatchSheet(matchingIndex)){ [self] (response) in
            switch response {
            case .success(let moyaResponse):
                do {
                    self.getRequestData = try moyaResponse.map(MatchSheetResponse.self)
                    completion(getRequestData)
                } catch(let err) {
                    print(err.localizedDescription, 500)
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
    
    // 6. 매칭 수락된 매칭 내역 조회 API
    func getSuccessMatchingListAPI(completion: @escaping (SuccessMatchResponse?) -> Void){
        self.customerProvider.request(.getSuccessMatchList){ [self] (response) in
            switch response {
            case .success(let moyaResponse):
                do {
                    self.getSuccessMatchListData = try moyaResponse.map(SuccessMatchResponse.self)
                    completion(getSuccessMatchListData)
                } catch(let err) {
                    print(err.localizedDescription, 500)
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
    
    // 7. 리뷰 작성 API
    func postReviewAPI(body:WriteReviewRequest, completion: @escaping (WriteReviewResponse?) -> Void){
        self.customerProvider.request(.postReview(body)) { [self] (response) in
            switch response {
            case .success(let moyaResponse):
                do {
                    self.postReviewData = try moyaResponse.map(WriteReviewResponse.self)
                    completion(postReviewData)
                } catch(let err) {
                    print(err.localizedDescription, 500)
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
}
