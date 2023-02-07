//
//  ReportResponse.swift
//  FITI
//
//  Created by 홍준혁 on 2023/02/07.
//

import Foundation

// MARK: - ReportResponse
struct ReportResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message, result: String
}
