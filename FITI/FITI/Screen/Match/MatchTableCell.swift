//
//  MatchTableCell.swift
//  FITI
//
//  Created by 홍준혁 on 2023/02/04.
//

import Foundation
import UIKit
import SnapKit

class MatchTableCell: UITableViewCell {
    
    // MARK: - Properties
    
    static let identifier = "MatchTableCell"
    public var trainerId = Int()
    
    // MARK: - UI Components
    
    private lazy var reviewerImage : UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "reviewerIcon.svg")
        imgView.snp.makeConstraints { make in
            make.height.width.equalTo(40)
        }
        return imgView
    }()
    private lazy var name : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15.0)
        label.textColor = UIColor.black
        return label
    }()
    private lazy var date : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12.0)
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
        label.font = UIFont.systemFont(ofSize: 12.0)
        label.textColor = UIColor.customColor(.darkGray)
        return label
    }()
    private lazy var school : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12.0)
        label.textColor = UIColor.customColor(.darkGray)
        return label
    }()
    private lazy var kakaoLink : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12.0)
        label.textColor = UIColor.customColor(.darkGray)
        return label
    }()
    private lazy var rateStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [starIcon,grade,school])
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.alignment = .center
        return stackView
    }()
    private lazy var nameStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [name,rateStackView,kakaoLink])
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.alignment = .leading
        return stackView
    }()
    private lazy var globalStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [reviewerImage,nameStackView])
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.alignment = .top
        return stackView
    }()
    
    // MARK: - init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(self.globalStackView)
        self.contentView.addSubview(self.date)
        globalStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().offset(-10)
            make.leading.equalToSuperview()
        }
        date.snp.makeConstraints { make in
//            make.centerY.equalTo(globalStackView)
            make.top.equalTo(name)
            make.trailing.equalToSuperview().offset(-10)
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been impl")
    }
}

// MARK: - Extension

extension MatchTableCell {
    public func bindingMatchingRequestList(model:SuccessMatchSheet){
        name.text = model.trainerName
        date.text = model.createdAt.substring(from: 0, to: 9)
        grade.text = String(model.trainerGrade)
        school.text = model.trainerSchool
        trainerId = model.trainerId
        // MARK: - FIX ME
        kakaoLink.text = model.openChatLink ?? "https://open.kakao.com/o/szgx3A2e"
//        if model.profile == "trainerProfile" {
//            reviewerImage.image = UIImage(named: "reviewerIcon.svg")
//        }else {
//            let url = URL(string: model.profile)
//            reviewerImage.kf.setImage(with: url)
//        }
    }
}
