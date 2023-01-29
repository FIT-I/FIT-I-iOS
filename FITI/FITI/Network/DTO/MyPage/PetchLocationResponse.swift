//
//  petchLocationMode.swift
//  FITI
//
//  Created by 홍준혁 on 2023/01/26.
//

import Foundation

// MARK: - Welcome
struct PetchLocationResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message, result: String
}
