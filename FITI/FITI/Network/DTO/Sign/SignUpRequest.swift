//
//  SignUpService.swift
//  FITI
//
//  Created by 홍준혁 on 2023/01/24.
//

struct SignUpRequest: Codable {
    var name: String
    var email: String
    var password: String
    var profileImage: String
    
    init(_ name: String, _ email: String, _ password: String, _ profileImage: String) {
        self.name = name
        self.email = email
        self.password = password
        self.profileImage = profileImage
    }
}
