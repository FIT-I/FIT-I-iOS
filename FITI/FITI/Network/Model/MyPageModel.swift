//
//  MyPageModel.swift
//  FITI
//
//  Created by 홍준혁 on 2023/01/27.
//

import Foundation
// MARK: - Welcome
struct MyPageResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: User
}

// MARK: - Result
struct User: Codable {
    let userIdx: Int
    let userName, profile, email, location: String
}
