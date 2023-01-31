//
//  ReviewTableViewCell.swift
//  FITI
//
//  Created by 홍준혁 on 2023/01/04.
//

import UIKit

class ReviewTableCell: UITableViewCell {
    
    // MARK: - Properties
    
    static let identifier = "ReviewTabelCell"
    
    // MARK: - UI Components
    
    private lazy var reviewerImage : UIImageView = {
        let imgView = UIImageView()
        imgView.snp.makeConstraints { make in
            make.width.equalTo(15)
            make.height.equalTo(25)
        }
        return imgView
    }()
    private lazy var name : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12.0)
        label.textColor = UIColor.black
        return label
    }()
    private lazy var date : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10.0)
        label.textColor = UIColor.customColor(.darkGray)
        return label
    }()
    private lazy var starIcon : UIImageView = {
        let image = UIImageView()
        image.snp.makeConstraints { make in
            make.height.width.equalTo(10)
        }
        image.image = UIImage(named: "star.svg")
        return image
    }()
    private lazy var grade : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10.0)
        label.textColor = UIColor.customColor(.darkGray)
        return label
    }()
    private lazy var rateStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [starIcon,grade])
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.alignment = .center
        return stackView
    }()
    private lazy var dateStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [date,rateStackView])
        stackView.axis = .horizontal
        stackView.spacing = 12
        stackView.alignment = .leading
        return stackView
    }()
    private lazy var nameStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [name,dateStackView])
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.alignment = .leading
        return stackView
    }()
    private lazy var topStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [reviewerImage,nameStackView])
        stackView.axis = .horizontal
        stackView.spacing = 15
        stackView.alignment = .leading
        return stackView
    }()
    private lazy var reviewTextView : UITextView = {
        let textView = UITextView()
        textView.textColor = UIColor.black
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.backgroundColor = .systemBackground
        textView.font = UIFont.systemFont(ofSize: 12.0)
        return textView
    }()
    private lazy var globalStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [topStackView,reviewTextView])
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.alignment = .leading
        return stackView
    }()
    
    // MARK: - init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(self.globalStackView)
        globalStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().offset(-10)
            make.leading.trailing.equalToSuperview()
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been impl")
    }
}

// MARK: - Extension

extension ReviewTableCell {
    public func reviewTableBnding(model:ReviewDto){
        name.text = model.name
        date.text = model.createdAt
        grade.text = String(model.grade)
        reviewTextView.text = model.contents
        switch model.profile {
        case "profile1":
            reviewerImage.image = UIImage(named:"profile1")
            return
        case "profile2":
            reviewerImage.image = UIImage(named:"profile2")
            return
        case "profile3":
            reviewerImage.image = UIImage(named:"profile3")
            return
        case "profile4":
            reviewerImage.image = UIImage(named:"profile4")
            return
        case "profile5":
            reviewerImage.image = UIImage(named:"profile5")
            return
        case "profile6":
            reviewerImage.image = UIImage(named:"profile6")
            return
        default:
            reviewerImage.image = UIImage(named:"profile1")
            return
        }
    }
}
