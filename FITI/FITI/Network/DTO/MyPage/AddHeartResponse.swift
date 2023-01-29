//
//  AddHeartResponse.swift
//  FITI
//
//  Created by 홍준혁 on 2023/01/29.
//

import Foundation

// MARK: - Welcome
struct AddHeartResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message, result: String
}
