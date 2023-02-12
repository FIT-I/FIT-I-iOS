//
//  ChangeProfileResponse.swift
//  FITI
//
//  Created by 홍준혁 on 2023/02/13.
//

import Foundation

struct ChangeProfileResponse: Codable {
    let isSuccess: Bool
    let code: Int
    var message: String? = nil
    var result: String? = nil
}
