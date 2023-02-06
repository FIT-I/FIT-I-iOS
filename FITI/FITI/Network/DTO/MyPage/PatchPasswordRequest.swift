//
//  PatchPasswordRequest.swift
//  FITI
//
//  Created by 홍준혁 on 2023/02/06.
//

import Foundation

struct PatchPasswordRequest: Codable {
    var password: String? = nil
    var accessToken: String? = nil
    var refreshToken: String? = nil
}
