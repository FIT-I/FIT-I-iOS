//
//  PatchPasswordResponse.swift
//  FITI
//
//  Created by 홍준혁 on 2023/02/06.
//

import Foundation

struct PatchPasswordResponse: Codable {
    let isSuccess: Bool
    let code: Int
    var message: String? = nil
    var result: String? = nil
}
