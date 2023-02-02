//
//  SpecificTrainerResponse.swift
//  FITI
//
//  Created by 홍준혁 on 2023/01/29.
//

import Foundation

//// MARK: - SpecificTrainerResponse
//struct SpecificTrainerResponse: Codable {
//    let isSuccess: Bool
//    let code: Int
//    let message: String
//    var result: Trainer? = nil
//}
//
//// MARK: - Trainer
//struct Trainer: Codable {
//    var name: String? = nil
//    var profile: String? = nil
//    var levelName: String? = nil
//    var background: String? = nil
//    var school: String? = nil
//    var grade: Double = 0
//    var cost: Int = 0
//    var intro: String? = nil
//    var service: String? = nil
//    var reviewDto: [ReviewDto]? = nil
//    var imageList: [String]? = nil
//    init(){}
//}
//

// MARK: - SpecificTrainerResponse
struct SpecificTrainerResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: Trainer
}

// MARK: - Trainer
struct Trainer: Codable {
    var profile: String? = nil
    var background: String? = nil
    var name: String? = nil
    var levelName: String? = nil
    var school: String? = nil
    var grade: Double = 0
    var cost: String? = ""
    var intro: String? = nil
    var service: String? = nil
    var reviewDto: [ReviewDto]? = nil
    var imageList: [String]? = nil
    var matchingState: Bool? = nil
    var category: String? = nil
    init(){}
//    enum CodingKeys: String, CodingKey {
//        case name, profile, background, levelName, school, grade, cost, intro, service, reviewDto, imageList
//        case matchingState = "matching_state"
//        case category
//    }
}

// MARK: - ReviewDto
struct ReviewDto: Codable {
    let name: String
    var profile: String? = nil
    let grade: Double
    let createdAt: String
    var contents: String? = nil
}
