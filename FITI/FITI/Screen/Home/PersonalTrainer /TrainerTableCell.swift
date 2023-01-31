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
    
    private let imgView : UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        view.image = UIImage(named: "reviewerIcon.svg")
        view.snp.makeConstraints { make in
            make.height.equalTo(70)
            make.width.equalTo(70)
        }
        return view
    }()
    var name : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir-Black", size: 15.0)
        label.text = "김동현"
        label.textColor = UIColor.black
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
    var purpose : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10.0)
        label.text = "개인PT"
        label.textColor = UIColor.black
        return label
    }()
    var distance : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10.0)
        label.text = "1Km"
        label.textColor = UIColor.customColor(.darkGray)
        return label
    }()
    private let dot : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10.0)
        label.text = "."
        label.textColor = UIColor.customColor(.darkGray)
        return label
    }()
    var yellowStarIcon : UIImageView = {
        let image = UIImageView()
        image.image =  UIImage(systemName: "star")
        return image
    }()
    var grade : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10.0)
        label.text = "4.3"
        label.textColor = UIColor.customColor(.darkGray)
        return label
    }()
    var school : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10.0)
        label.text = "숭실대학교"
        label.textColor = UIColor.customColor(.darkGray)
        return label
    }()
    var introTextView : UITextView = {
        let textView = UITextView()
        textView.textColor = UIColor.black
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.font = UIFont.systemFont(ofSize: 10.0)
        return textView
    }()
    var price : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10.0)
        label.text = "20,000원"
        label.textColor = UIColor.black
        return label
    }()
    let time : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10.0)
        label.text = "원 /1시간"
        label.textColor = UIColor.customColor(.darkGray)
        
        return label
    }()
    var goldIcon : UIImageView = {
        let image = UIImageView()
        return image
    }()
    lazy var rateStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [starIcon,grade])
        stackView.axis = .horizontal
        stackView.spacing = 3
        stackView.alignment = .center
        return stackView
    }()
//    lazy var nameStackView : UIStackView = {
//        let stackView = UIStackView(arrangedSubviews: [name])
//        stackView.axis = .horizontal
//        stackView.spacing = 8
//        stackView.alignment = .lastBaseline
//        return stackView
//    }()
    lazy var gradeStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [rateStackView,school])
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.alignment = .leading
        return stackView
    }()
    lazy var priceStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [price,time])
        stackView.axis = .horizontal
        stackView.spacing = 2
        stackView.alignment = .leading
        return stackView
    }()
    lazy var rightStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [gradeStackView,introTextView,priceStackView])
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.alignment = .leading
        return stackView
    }()
    lazy var globalStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [imgView,rightStackView])
        stackView.axis = .horizontal
        stackView.spacing = 15
        stackView.alignment = .fill
        return stackView
    }()

    // MARK: - init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubviews(imgView,name,goldIcon,rightStackView)
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
        rightStackView.snp.makeConstraints { make in
            make.top.equalTo(name.snp.bottom).offset(5)
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
        price.text = String(model.cost)
        school.text = model.school
        // MARK: - FIX ME : 일단 더미 데이터
        if model.profile == "trainerProfile" {
            imgView.image = UIImage(named: "reviewerIcon.svg")
        }else {
            let url = URL(string: model.profile)
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
