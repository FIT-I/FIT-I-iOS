//
//  RequestMatching.swift
//  FITI
//
//  Created by 홍준혁 on 2023/02/02.
//

import Foundation

struct RequestMatchingRequest: Codable {
    var startAt: String = ""
    var finishAt: String = ""
    var type: String = ""
}
