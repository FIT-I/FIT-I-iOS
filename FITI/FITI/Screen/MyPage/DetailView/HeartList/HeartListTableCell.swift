//
//  HeartListTableCell.swift
//  FITI
//
//  Created by 홍준혁 on 2023/01/29.
//

import Foundation
import UIKit

import SnapKit
import Kingfisher

class HeartListTableCell: UITableViewCell {
    
    // MARK: - Properties
    
    static let identifier = "HeartListTableCell"
    var trainerIdx = Int()
    
    // MARK: - UI Components
    
    var reviewerImage : UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "reviewerIcon.svg")
        imgView.snp.makeConstraints { make in
            make.height.width.equalTo(40)
        }
        return imgView
    }()
    var name : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15.0)
        label.text = "홍준혁"
        label.textColor = UIColor.black
        return label
    }()
    var date : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12.0)
        label.text = "2022.12.2"
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
        label.font = UIFont.systemFont(ofSize: 12.0)
        label.text = "4.3"
        label.textColor = UIColor.customColor(.darkGray)
        return label
    }()
    var school : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12.0)
        label.text = "숭실대학교"
        label.textColor = UIColor.customColor(.darkGray)
        return label
    }()
    private lazy var rateStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [starIcon,grade,school,date])
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.alignment = .center
        return stackView
    }()
    private lazy var nameStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [name,rateStackView])
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.alignment = .leading
        return stackView
    }()
    private lazy var globalStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [reviewerImage,nameStackView])
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.alignment = .center
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
        print(globalStackView)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been impl")
    }
}

//MARK: - Extension

extension HeartListTableCell {
    public func bindingHeartList(model:HeartList){
        trainerIdx = model.trainerIdx
        name.text = model.trainerName
        grade.text = String(model.trainerGrade)
        school.text = model.trainerSchool
        date.text = model.createdAt
        // MARK: - FIX ME : 일단 더미 데이터
        if model.trainerProfile == "trainerProfile" {
            reviewerImage.image = UIImage(named: "reviewerIcon.svg")
        }else{
            let url = URL(string: model.trainerProfile)
            reviewerImage.kf.setImage(with: url)
        }
    }
}

