//
//  BookReviewTableViewCell.swift
//  FITI
//
//  Created by 홍준혁 on 2023/01/11.
//

import Foundation
import UIKit
import SnapKit
import Then

class BookReviewTableViewCell: UITableViewCell {
    
    static let identifier = "BookReviewTableViewCell"
    
    var image = UIImageView()
    var name = UILabel().then {
        $0.font = .systemFont(ofSize: 12, weight: .regular)
        $0.textColor = UIColor.gray
    }
    var date = UILabel().then {
        $0.font = .systemFont(ofSize: 12, weight: .regular)
        $0.textColor = UIColor.gray
    }
    var content = UILabel().then {
        $0.font = .systemFont(ofSize: 12, weight: .regular)
        $0.textColor = UIColor.gray
    }
    let divider1 = UILabel().then {
        $0.text = "|"
        $0.font = .systemFont(ofSize: 12, weight: .regular)
        $0.textColor = UIColor.gray
    }
    let divider2 = UILabel().then {
        $0.text = "|"
        $0.font = .systemFont(ofSize: 12, weight: .regular)
        $0.textColor = UIColor.gray
    }
    let report = UILabel().then {
        $0.text = "신고"
        $0.font = .systemFont(ofSize: 12, weight: .regular)
        $0.textColor = UIColor.gray
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BookReviewTableViewCell {
    func setLayout() {
        
        contentView.addSubviews(image, name, date, content, divider1, divider2, report)
        
        image.snp.makeConstraints {
            $0.top.equalToSuperview().offset(15)
            $0.leading.equalToSuperview().offset(22.5)
            $0.height.width.equalTo(32)
        }
        name.snp.makeConstraints {
            $0.centerY.equalTo(image)
            $0.leading.equalTo(image.snp.trailing).offset(4)
        }
        divider1.snp.makeConstraints {
            $0.centerY.equalTo(name)
            $0.leading.equalTo(name.snp.trailing).offset(5)
        }
        date.snp.makeConstraints {
            $0.centerY.equalTo(name)
            $0.leading.equalTo(divider1.snp.trailing).offset(5)
        }
        divider2.snp.makeConstraints {
            $0.centerY.equalTo(name)
            $0.leading.equalTo(date.snp.trailing).offset(5)
        }
        report.snp.makeConstraints {
            $0.centerY.equalTo(name)
            $0.leading.equalTo(divider2.snp.trailing).offset(5)
        }
        content.snp.makeConstraints {
            $0.leading.equalTo(image)
            $0.top.equalTo(image.snp.bottom).offset(4)
        }
    }
    
    func dataBind(model: ReviewModel) {
        image.image = model.image
        name.text = model.name
        date.text = model.date
        content.text = model.content
    }
}
