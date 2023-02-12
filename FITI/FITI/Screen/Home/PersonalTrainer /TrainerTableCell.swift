//
//  TrainerTabelCell.swift
//  FITI
//
//  Created by 홍준혁 on 2023/01/01.
//


import Foundation
import UIKit

import SnapKit
import Kingfisher

class TrainerTableCell: UITableViewCell {

    // MARK: - Properties
    
    var id = Int()
    static let identifier = "TrainerTableCell"
    
    // MARK: - UI Components
    
    private lazy var imgView : UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        view.snp.makeConstraints { make in
            make.height.equalTo(70)
            make.width.equalTo(70)
        }
        return view
    }()
    private lazy var name : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir-Black", size: 15.0)
        label.textColor = UIColor.black
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
    private lazy var purpose : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10.0)
        label.text = "개인PT"
        label.textColor = UIColor.black
        return label
    }()
    private lazy var distance : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10.0)
        label.text = "1Km"
        label.textColor = UIColor.customColor(.darkGray)
        return label
    }()
    private lazy var dot : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10.0)
        label.text = "."
        label.textColor = UIColor.customColor(.darkGray)
        return label
    }()
    private lazy var yellowStarIcon : UIImageView = {
        let image = UIImageView()
        image.image =  UIImage(systemName: "star")
        return image
    }()
    private lazy var grade : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10.0)
        label.textColor = UIColor.customColor(.darkGray)
        return label
    }()
    private lazy var school : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10.0)
        label.textColor = UIColor.customColor(.darkGray)
        return label
    }()
    private lazy var introTextView : UITextView = {
        let textView = UITextView()
        textView.textColor = UIColor.black
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.textContainer.maximumNumberOfLines = 2
        textView.font = UIFont.systemFont(ofSize: 10.0)
        return textView
    }()
    private lazy var price : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10.0)
        label.textColor = UIColor.black
        return label
    }()
    private lazy var time : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10.0)
        label.textColor = UIColor.customColor(.darkGray)
        return label
    }()
    private lazy var goldIcon : UIImageView = {
        let image = UIImageView()
        return image
    }()
    private lazy var rateStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [starIcon,grade])
        stackView.axis = .horizontal
        stackView.spacing = 3
        stackView.alignment = .center
        return stackView
    }()
    private lazy var gradeStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [rateStackView,school])
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.alignment = .leading
        return stackView
    }()
    private lazy var priceStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [price,time])
        stackView.axis = .horizontal
        stackView.spacing = 2
        stackView.alignment = .leading
        return stackView
    }()

    // MARK: - init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubviews(imgView,name,goldIcon,gradeStackView,introTextView,priceStackView)
        imgView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(23)
            make.leading.equalToSuperview()
        }
        name.snp.makeConstraints { make in
            make.top.equalTo(imgView.snp.top)
            make.leading.equalTo(imgView.snp.trailing).offset(24)
        }
        goldIcon.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(22)
            make.leading.equalTo(name.snp.trailing).offset(7)
        }
        gradeStackView.snp.makeConstraints { make in
            make.top.equalTo(name.snp.bottom).offset(5)
            make.leading.equalTo(imgView.snp.trailing).offset(24)
        }
        introTextView.snp.makeConstraints { make in
            make.top.equalTo(gradeStackView.snp.bottom).offset(5)
            make.leading.equalTo(imgView.snp.trailing).offset(24)
            make.trailing.equalToSuperview().offset(40)
        }
        priceStackView.snp.makeConstraints { make in
            make.top.equalTo(introTextView.snp.bottom).offset(5)
            make.leading.equalTo(imgView.snp.trailing).offset(24)
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been impl")
    }
}

// MARK: - Extension

extension TrainerTableCell {
    public func bindingTrainerList(model:Dto){
        id = model.id
        name.text = model.name
        grade.text = String(model.grade)
        introTextView.text = model.contents
        price.text = String(model.cost) + "원 /시간당"
        school.text = model.school
        // MARK: - FIX ME : 일단 더미 데이터
        if model.profile == "trainerProfile" {
            imgView.image = UIImage(named: "reviewerIcon.svg")
        }else {
            let url = URL(string: model.profile ?? "")
            imgView.kf.setImage(with: url)
        }
        switch model.levelName {
        case "gold":
            goldIcon.image = UIImage(named: "gold.svg")
        case "silver":
            goldIcon.image = UIImage(named: "silver.svg")
        case "bronze":
            goldIcon.image = UIImage(named: "bronze.svg")
        default:
            goldIcon.image = nil
        }
    }
}
