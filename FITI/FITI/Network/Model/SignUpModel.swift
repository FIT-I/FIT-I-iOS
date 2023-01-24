//
//  SignUpModel.swift
//  FITI
//
//  Created by 홍준혁 on 2023/01/24.
//

// MARK: - SignupModel
struct SignUpModel: Codable {
    let name:String
    let email:String
    let password:String
}

// MARK: - SignupResponse
struct SignUpResponse: Codable {
    let isSuccess:Bool
    let code:Int
    let message:String
    let success:String
}