//
//  RequestSheet.swift
//  FITI
//
//  Created by 홍준혁 on 2023/01/07.
//

import Foundation
import SnapKit
import UIKit

class RequestSheet : UIView {
    
    var titleLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir-Black", size: 15.0)
        label.text = "서비스 종류"
        label.textColor = UIColor.customColor(.blue)
        return label
    }()
    
    var hourLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15.0)
        label.text = "1시간"
        label.textColor = UIColor.customColor(.blue)
        return label
    }()
    
    var hourPriceLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15.0)
        label.text = "20,000원"
        label.textColor = UIColor.customColor(.blue)
        return label
    }()
    
    var addServiceLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15.0)
        label.text = "추가관리"
        label.textColor = UIColor.customColor(.blue)
        return label
    }()
    
    var addPriceLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15.0)
        label.text = "10,000원"
        label.textColor = UIColor.customColor(.blue)
        return label
    }()
    
    var totalLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15.0)
        label.text = "총 금액"
        label.textColor = UIColor.customColor(.blue)
        return label
    }()
    
    var totalPriceLabel : UILabel = {
        let label = UILabel()
//        label.font = UIFont.systemFont(ofSize: 15.0)
        label.font = UIFont(name: "Avenir-Black", size: 15.0)
        label.text = "30,000원"
        label.textColor = UIColor.customColor(.blue)
        return label
    }()
    
    var meetingDateLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15.0)
        label.text = "매칭 날짜"
        label.textColor = UIColor.customColor(.blue)
        return label
    }()
    
    var meetingDate : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir-Black", size: 15.0)
        label.text = "23.1.18~23.1.25 (8일)"
        label.textColor = UIColor.customColor(.blue)
        return label
    }()
    
    var pickUpLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15.0)
        label.text = "픽업 형태"
        label.textColor = UIColor.customColor(.blue)
        return label
    }()
    
    var pickUp : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir-Black", size: 15.0)
        label.text = "제가 매칭 상대의 주소로 갈게요."
        label.textColor = UIColor.customColor(.blue)
        return label
    }()
    
    var lineView1 : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.customColor(.gray)
        view.snp.makeConstraints { make in
            make.height.equalTo(2)
            // 이렇게 줘도 될까..?
            make.width.equalTo(309)
        }
        return view
    }()
    
    var lineView2 : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.customColor(.gray)
        view.snp.makeConstraints { make in
            make.height.equalTo(2)
            // 이렇게 줘도 될까..?
            make.width.equalTo(309)
        }
        return view
    }()
    
    var lineView3 : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.customColor(.gray)
        view.snp.makeConstraints { make in
            make.height.equalTo(2)
            // 이렇게 줘도 될까..?
            make.width.equalTo(309)
        }
        return view
    }()
    
    lazy var hourStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [hourLabel,hourPriceLabel])
        stackView.axis = .horizontal
        stackView.spacing = 215
        return stackView
    }()
    
    lazy var addStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [addServiceLabel,addPriceLabel])
        stackView.axis = .horizontal
        stackView.spacing = 198
        return stackView
    }()
    
    lazy var priceStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [hourStackView,addStackView])
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.alignment = .leading
        return stackView
    }()
    
    lazy var totalPriceStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [totalLabel,totalPriceLabel])
        stackView.axis = .horizontal
        stackView.spacing = 203
        stackView.alignment = .leading
        return stackView
    }()
    
    lazy var meetingDateStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [meetingDateLabel,meetingDate])
        stackView.axis = .horizontal
        stackView.spacing = 103
        stackView.alignment = .leading
        return stackView
    }()
    
    lazy var pickUpStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [pickUpLabel,pickUp])
        stackView.axis = .horizontal
        stackView.spacing = 60
        stackView.alignment = .leading
        return stackView
    }()
    
    lazy var globalStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel,priceStackView,lineView1,totalPriceStackView,lineView2,meetingDateStackView,lineView3,pickUpStackView])
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
       
    override init(frame: CGRect) {
        super .init(frame: .zero)
        // 배경색
        self.backgroundColor = UIColor.customColor(.boxGray)
        
        setViewHierarchy()
        setConstraints()
    }
    
    func setViewHierarchy(){
        self.addSubview(globalStackView)
    }
    
    func setConstraints(){
        globalStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(36)
            make.bottom.equalToSuperview().offset(-26)
            make.leading.equalToSuperview().offset(18)
            make.trailing.equalToSuperview().offset(-22)
        }
    }
    
}
