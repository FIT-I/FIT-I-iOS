//
//  BookReviewTableViewCell.swift
//  FITI
//
//  Created by 홍준혁 on 2023/01/11.
//

import UIKit
import Foundation
import SnapKit
import Then

class PreviewReviewTableCell: UITableViewCell {
    
    // MARK: - Properties
    
    static let identifier = "PreviewReviewTableCell"
    
    // MARK: - UI Components
    
    var reviewerImage : UIImageView = {
        let imgView = UIImageView()
        imgView.snp.makeConstraints { make in
            make.width.equalTo(20)
            make.height.equalTo(30)
        }
        return imgView
    }()
    var name : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12.0)
        label.textColor = UIColor.black
        return label
    }()
    var date : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10.0)
        label.textColor = UIColor.customColor(.darkGray)
        return label
    }()
    var starIcon : UIImageView = {
        let image = UIImageView()
        image.snp.makeConstraints { make in
            make.height.width.equalTo(10)
        }
        image.image = UIImage(named: "star.svg")
        return image
    }()
    var grade : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10.0)
        label.textColor = UIColor.customColor(.darkGray)
        return label
    }()
    lazy var rateStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [starIcon,grade])
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.alignment = .center
        return stackView
    }()
    lazy var dateStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [date,rateStackView])
        stackView.axis = .horizontal
        stackView.spacing = 12
        stackView.alignment = .leading
        return stackView
    }()
    lazy var nameStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [name,dateStackView])
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.alignment = .leading
        return stackView
    }()
    lazy var topStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [reviewerImage,nameStackView])
        stackView.axis = .horizontal
        stackView.backgroundColor = UIColor.customColor(.boxGray)
        stackView.spacing = 8
        stackView.alignment = .leading
        stackView.snp.makeConstraints { make in
            make.height.equalTo(30)
        }
        return stackView
    }()
    var reviewTextView : UITextView = {
        let textView = UITextView()
        textView.textColor = UIColor.black
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.backgroundColor = UIColor.customColor(.boxGray)
        textView.textContainer.maximumNumberOfLines = 2
        textView.textContainer.lineBreakMode = .byTruncatingTail
        textView.font = UIFont.systemFont(ofSize: 12.0)
        textView.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        return textView
    }()
    lazy var globalStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [topStackView,reviewTextView])
        stackView.axis = .vertical
        stackView.backgroundColor = UIColor.customColor(.boxGray)
        stackView.alignment = .leading
        return stackView
    }()
    
    // MARK: - init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(self.globalStackView)
        self.backgroundColor = UIColor.customColor(.boxGray)
        globalStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview()
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been impl")
    }
}

// MARK: - Extension

extension PreviewReviewTableCell {
    func dataBind(model: ReviewDto) {
        name.text = model.name
        date.text = model.createdAt
        grade.text = String(model.grade)
        reviewTextView.text = model.contents
        switch model.profile {
        case "customerProfile1":
            reviewerImage.image = UIImage(named:"profile1")
            return
        case "customerProfile2":
            reviewerImage.image = UIImage(named:"profile2")
            return
        case "customerProfile3":
            reviewerImage.image = UIImage(named:"profile3")
            return
        case "customerProfile4":
            reviewerImage.image = UIImage(named:"profile4")
            return
        case "customerProfile5":
            reviewerImage.image = UIImage(named:"profile5")
            return
        case "customerProfile6":
            reviewerImage.image = UIImage(named:"profile6")
            return
        default:
            reviewerImage.image = UIImage(named:"profile1")
            return
        }
    }
}
