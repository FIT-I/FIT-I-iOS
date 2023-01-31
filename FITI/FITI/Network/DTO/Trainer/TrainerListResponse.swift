//
//  TrainerListModel.swift
//  FITI
//
//  Created by 홍준혁 on 2023/01/28.
//

import Foundation

// MARK: - Welcome
struct TrainerListResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: ListData
}

// MARK: - Result
struct ListData: Codable {
    let numberOfElements: Int
    let hasNext: Bool
    let dto: [Dto]
}

// MARK: - Dto
struct Dto: Codable {
    let id: Int
    let name, profile, levelName, school: String
    let grade: Double
    let certificateNum: Int
    var contents: String? = nil
    let cost: Int
}
