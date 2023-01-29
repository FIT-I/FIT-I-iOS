//
//  HeartListModel.swift
//  FITI
//
//  Created by 홍준혁 on 2023/01/26.
//

// MARK: - Welcome
struct HeartListResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: [HeartList]
}

// MARK: - Result
struct HeartList: Codable {
    let trainerIdx: Int
    let trainerName, trainerProfile: String
    let trainerGrade: Double
    let trainerSchool, createdAt: String
}
