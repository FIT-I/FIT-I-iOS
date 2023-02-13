//
//  TokenResponse.swift
//  FITI
//
//  Created by 홍준혁 on 2023/02/13.
//

import Foundation

// MARK: - Welcome
struct TokenResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    var result: ReToken? = nil
}

// MARK: - Result
struct ReToken: Codable {
    let accessToken, refreshToken: String
}
