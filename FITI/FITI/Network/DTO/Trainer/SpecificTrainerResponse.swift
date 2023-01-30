//
//  SpecificTrainerResponse.swift
//  FITI
//
//  Created by 홍준혁 on 2023/01/29.
//

import Foundation

// MARK: - SpecificTrainerResponse
struct SpecificTrainerResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    var result: Trainer? = nil
    init(){
        isSuccess = false
        code = 0
        message = ""
    }
}

// MARK: - Result
struct Trainer: Codable {
    let name, profile,levelName: String
    var background: String? = nil
    let school: String
    let grade: Double
    let cost: Int
    let intro, service: String
    let reviewDto: [ReviewDto]
    var imageList: [String]
}

// MARK: - ReviewDto
struct ReviewDto: Codable {
    let name: String
    var profile: String? = nil
    let grade: Double
    var createdAt: String? = nil
    let contents: String
}
