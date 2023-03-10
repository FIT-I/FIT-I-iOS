//
//  SignInModel.swift
//  FITI
//
//  Created by 홍준혁 on 2023/01/24.
//

// MARK: - SignInResponse
struct SignInResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    var result: Result? = nil
}

// MARK: - Result
struct Result: Codable {
    let accessToken, refreshToken: String
}

