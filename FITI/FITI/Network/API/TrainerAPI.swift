//
//  TrainerAPI.swift
//  FITI
//
//  Created by 홍준혁 on 2023/01/29.
//

import Foundation

import Moya

final class TrainerAPI {
    static let shared = TrainerAPI()
    private var trainerProvider = MoyaProvider<TrainerRouter>()
    
    private init() { }
    
    private(set) var getFirstTrainerListData: TrainerListResponse?
    private(set) var getTrainerListData: TrainerListResponse?
    private(set) var getSpecificTrainerData: SpecificTrainerResponse?
    
    // 1. 처음 트레이너 목록 조회 API
    func getFirstTrainerListAPI(category:String,page:Int,size:Int,sort:[String],completion: @escaping (TrainerListResponse?) -> Void){
        let param = TrainerArrayListRequest(page: page, size: size, sort: sort)
        self.trainerProvider.request(.getFristTrainerList(category, param)){ [self] (response) in
            switch response {
                case .success(let moyaResponse):
                    do {
                        self.getFirstTrainerListData = try moyaResponse.map(TrainerListResponse.self)
                        completion(getFirstTrainerListData)
                    } catch(let err) {
                        print(err.localizedDescription, 500)
                    }
                case .failure(let err):
                    print(err.localizedDescription)
            }
        }
    }
    
    // 2. 트레이너 목록 조회 API
    func getTrainerListAPI(category:String,lastTrainerIdx:Int,page:Int,size:Int,sort:[String],completion: @escaping (TrainerListResponse?) -> Void){
        let param = TrainerArrayListRequest(page: page, size: size, sort: sort)
        self.trainerProvider.request(.getTrainerList(category, lastTrainerIdx, param)){ [self] (response) in
            switch response {
                case .success(let moyaResponse):
                    do {
                        self.getTrainerListData = try moyaResponse.map(TrainerListResponse.self)
                        completion(getTrainerListData)
                    } catch(let err) {
                        print(err.localizedDescription, 500)
                    }
                case .failure(let err):
                    print(err.localizedDescription)
            }
        }
    }
    
    // 3. 특정 트레이너 정보 조회 API
    func getSpecificTrainerAPI(trainerIdx:Int,completion: @escaping (SpecificTrainerResponse?) -> Void){
        self.trainerProvider.request(.getSpecificTrainer(trainerIdx)){ [self] (response) in
            switch response {
                case .success(let moyaResponse):
                    do {
                        self.getSpecificTrainerData = try moyaResponse.map(SpecificTrainerResponse.self)
                        completion(getSpecificTrainerData)
                    } catch(let err) {
                        print(err.localizedDescription, 500)
                    }
                case .failure(let err):
                    print(err.localizedDescription)
            }
        }
    }
}
