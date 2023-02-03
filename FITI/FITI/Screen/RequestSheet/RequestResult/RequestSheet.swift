//
//  RequestSheet.swift
//  FITI
//
//  Created by 홍준혁 on 2023/01/07.
//

import Foundation
import UIKit

import SnapKit

class RequestSheet : UIView {
    
    private lazy var requsetIcon : UIImageView = {
        let image = UIImageView()
        image.image =  UIImage(named: "pickService.svg")
        return image
    }()
    private lazy var titleLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir-Black", size: 15.0)
        label.text = "서비스 종류"
        label.textColor = UIColor.customColor(.blue)
        return label
    }()
    private lazy var hourLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15.0)
        label.text = "1시간"
        label.textColor = UIColor.customColor(.blue)
        return label
    }()
    lazy var hourPriceLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15.0)
        label.textColor = UIColor.customColor(.blue)
        return label
    }()
    private lazy var totalLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15.0)
        label.text = "총 금액"
        label.textColor = UIColor.customColor(.blue)
        return label
    }()
    lazy var totalPriceLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir-Black", size: 15.0)
        label.textColor = UIColor.customColor(.blue)
        return label
    }()
    private lazy var meetingDateLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15.0)
        label.text = "매칭 날짜"
        label.textColor = UIColor.customColor(.blue)
        return label
    }()
    // MARK: - FIX ME
    lazy var meetingStartDate : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir-Black", size: 15.0)
        label.textColor = UIColor.customColor(.blue)
        return label
    }()
    lazy var toText : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir-Black", size: 15.0)
        label.text = "~"
        label.textColor = UIColor.customColor(.blue)
        return label
    }()
    lazy var meetingEndDate : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir-Black", size: 15.0)
        label.textColor = UIColor.customColor(.blue)
        return label
    }()
    private lazy var meetingDate : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [meetingStartDate,toText,meetingEndDate])
        stackView.axis = .horizontal
        stackView.alignment = .leading
        stackView.spacing = 2
        return stackView
    }()
    lazy var pickUpLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15.0)
        label.text = "픽업 형태"
        label.textColor = UIColor.customColor(.blue)
        return label
    }()
    lazy var pickUp : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir-Black", size: 15.0)
        label.textColor = UIColor.customColor(.blue)
        return label
    }()
    private lazy var lineView0 : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.customColor(.gray)
        view.snp.makeConstraints { make in
            make.height.equalTo(1)
        }
        return view
    }()
    private lazy var lineView1 : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.customColor(.gray)
        view.snp.makeConstraints { make in
            make.height.equalTo(1)
        }
        return view
    }()
    private lazy var lineView2 : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.customColor(.gray)
        view.snp.makeConstraints { make in
            make.height.equalTo(1)
        }
        return view
    }()
    private lazy var lineView3 : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.customColor(.gray)
        view.snp.makeConstraints { make in
            make.height.equalTo(1)
        }
        return view
    }()
    private lazy var topStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [requsetIcon,titleLabel])
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 8
        return stackView
    }()
    
    // MARK: - init
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
       
    override init(frame: CGRect) {
        super .init(frame: .zero)
        setViewHierarchy()
        setConstraints()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.backgroundColor = UIColor.customColor(.boxGray)
        self.layer.cornerRadius = 8
    }
    
    func setViewHierarchy(){
        self.addSubviews(topStackView,
                         lineView0,
                         hourLabel,
                         hourPriceLabel,
                         lineView1,
                         totalLabel,
                         totalPriceLabel,
                         lineView2,
                         meetingDateLabel,
                         meetingDate,
                         lineView3,
                         pickUpLabel,
                         pickUp
        )
    }
    
    func setConstraints(){
        
        topStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(40)
            make.leading.equalToSuperview().offset(18)
        }
        lineView0.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(6)
            make.leading.equalToSuperview().offset(18)
            make.trailing.equalToSuperview().offset(-22)
        }
        hourLabel.snp.makeConstraints { make in
            make.top.equalTo(lineView0.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(18)
        }
        hourPriceLabel.snp.makeConstraints { make in
            make.top.equalTo(lineView0.snp.bottom).offset(20)
            make.trailing.equalToSuperview().offset(-18)
        }
        lineView1.snp.makeConstraints { make in
            make.top.equalTo(hourLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(18)
            make.trailing.equalToSuperview().offset(-22)
        }
        totalLabel.snp.makeConstraints { make in
            make.top.equalTo(lineView1.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(18)
        }
        totalPriceLabel.snp.makeConstraints { make in
            make.top.equalTo(lineView1.snp.bottom).offset(20)
            make.trailing.equalToSuperview().offset(-18)
        }
        lineView2.snp.makeConstraints { make in
            make.top.equalTo(totalLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(18)
            make.trailing.equalToSuperview().offset(-22)
        }
        meetingDateLabel.snp.makeConstraints { make in
            make.top.equalTo(lineView2.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(18)
        }
        meetingDate.snp.makeConstraints { make in
            make.top.equalTo(lineView2.snp.bottom).offset(20)
            make.trailing.equalToSuperview().offset(-18)
        }
        lineView3.snp.makeConstraints { make in
            make.top.equalTo(meetingDateLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(18)
            make.trailing.equalToSuperview().offset(-22)
        }
        pickUpLabel.snp.makeConstraints { make in
            make.top.equalTo(lineView3.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(18)
        }
        pickUp.snp.makeConstraints { make in
            make.top.equalTo(lineView3.snp.bottom).offset(20)
            make.trailing.equalToSuperview().offset(-18)
        }
        
    }
    
}
