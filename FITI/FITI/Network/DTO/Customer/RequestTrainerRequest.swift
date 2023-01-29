//
//  RequestTrainerRequest.swift
//  FITI
//
//  Created by 홍준혁 on 2023/01/26.
//

struct RequestTrainerRequest: Codable {
    var startAt: String
    var finishAt: String
    var type: String
    
    init(startAt: String, finishAt: String, type: String) {
        self.startAt = startAt
        self.finishAt = finishAt
        self.type = type
    }
}
