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
    
    // 1. 트레이너 찜 등록 API
    func postAddHeartAPI(trainerIndex:Int, completion: @escaping (AddHeartResponse?) -> Void){
        customerProvider.request(.addHeart(trainerIndex)) { [self] (response) in
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
        customerProvider.request(.deleteHeart(trainerIndex)) { [self] (response) in
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
}
