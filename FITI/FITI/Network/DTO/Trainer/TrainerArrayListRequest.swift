//
//  TrainerRequestRequest.swift
//  FITI
//
//  Created by 홍준혁 on 2023/01/28.
//

struct TrainerArrayListRequest: Codable {
    var page: Int
    var size: Int
    var sort: [String]
    
    init(page: Int, size: Int, sort: [String]){
        self.page = page
        self.size = size
        self.sort = sort
    }
}
