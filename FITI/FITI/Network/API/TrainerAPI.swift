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
    let realm = RealmService()
    
    private init() { }
    
    private(set) var getFirstTrainerListData: TrainerListResponse?
    private(set) var getTrainerListData: TrainerListResponse?
    private(set) var getSpecificTrainerData: SpecificTrainerResponse?
    private(set) var getReportData: ReportResponse?
    
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
                    // MARK: - 여기로 401이 들어오나?
                    if moyaResponse.statusCode == 401 || moyaResponse.statusCode == 406 {
                        let oldToken = TokenRequest(accessToken: self.realm.getToken(), refreshToken: self.realm.getRefreshToken())
                        MoyaLoggerPlugin.shared.userTokenReissueWithAPI(request: oldToken)
                    }
                    print("트레이너 목록조회"+err.localizedDescription, 500)
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
                    // MARK: - 여기로 401이 들어오나?
                    if moyaResponse.statusCode == 401 || moyaResponse.statusCode == 406 {
                        let oldToken = TokenRequest(accessToken: self.realm.getToken(), refreshToken: self.realm.getRefreshToken())
                        MoyaLoggerPlugin.shared.userTokenReissueWithAPI(request: oldToken)
                    }
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
                    // MARK: - 여기로 401이 들어오나?
                    if moyaResponse.statusCode == 401 || moyaResponse.statusCode == 406 {
                        let oldToken = TokenRequest(accessToken: self.realm.getToken(), refreshToken: self.realm.getRefreshToken())
                        MoyaLoggerPlugin.shared.userTokenReissueWithAPI(request: oldToken)
                    }
                    print(err.localizedDescription, 500)
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }

    // 4. 특정 트레이너 신고 API
    func reportTrainerAPI(body:ReportRequest, completion: @escaping (ReportResponse?) -> Void){
        self.trainerProvider.request(.postReport(body)){ [self] (response) in
            switch response {
            case .success(let moyaResponse):
                do {
                    self.getReportData = try moyaResponse.map(ReportResponse.self)
                    completion(getReportData)
                } catch(let err) {
                    // MARK: - 여기로 401이 들어오나?
                    if moyaResponse.statusCode == 401 || moyaResponse.statusCode == 406 {
                        let oldToken = TokenRequest(accessToken: self.realm.getToken(), refreshToken: self.realm.getRefreshToken())
                        MoyaLoggerPlugin.shared.userTokenReissueWithAPI(request: oldToken)
                    }
                    print(err.localizedDescription, 500)
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
}
