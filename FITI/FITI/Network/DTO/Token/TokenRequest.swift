//
//  TokenRequest.swift
//  FITI
//
//  Created by 홍준혁 on 2023/02/13.
//

import Foundation

// MARK: - TokenRequest
struct TokenRequest: Codable {
    let accessToken, refreshToken: String
    init(accessToken: String, refreshToken: String) {
        self.accessToken = accessToken
        self.refreshToken = refreshToken
    }
}
