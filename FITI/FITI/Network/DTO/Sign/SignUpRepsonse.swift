//
//  SignUpModel.swift
//  FITI
//
//  Created by 홍준혁 on 2023/01/24.
//

// MARK: - Welcome
struct SignUpResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    var result: String? = nil
}
