//
//  WriteReview.swift
//  FITI
//
//  Created by 홍준혁 on 2023/01/26.
//

struct WriteReviewRequest: Codable {
    var trainerIdx: Int
    var grade: Int
    var contents: String
    
    init(trainerIdx: Int, grade: Int, contents: String) {
        self.trainerIdx = trainerIdx
        self.grade = grade
        self.contents = contents
    }
}
