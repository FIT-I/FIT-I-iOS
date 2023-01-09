//
//  BottomInfoView.swift
//  FITI
//
//  Created by 홍준혁 on 2023/01/09.
//

import Foundation
import UIKit
import SnapKit

class BottomInfoView : UIView {
    var title : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir-Black", size: 15.0)
        label.text = "기본정보"
        label.textColor = UIColor.customColor(.blue)
        return label
    }()
    var phoneNumberTitle : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15.0)
        label.text = "휴대폰 번호"
        label.textColor = UIColor.customColor(.blue)
        return label
    }()
    var userPhoneNumber : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15.0)
        label.text = "010-1294-5678"
        label.textColor = UIColor.customColor(.blue)
        return label
    }()
    var emailLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15.0)
        label.text = "이메일 주소"
        label.textColor = UIColor.customColor(.blue)
        return label
    }()
    var userEmail : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15.0)
        label.text = "skydh@naver.com"
        label.textColor = UIColor.customColor(.blue)
        return label
    }()

    lazy var phoneNumStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [phoneNumberTitle,userPhoneNumber])
        stackView.axis = .vertical
        stackView.spacing = 7
        stackView.alignment = .leading
        return stackView
    }()
    
    lazy var emailStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [emailLabel,userEmail])
        stackView.axis = .vertical
        stackView.spacing = 7
        stackView.alignment = .leading
        return stackView
    }()
    
    lazy var globalStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [title,emailStackView])
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.alignment = .leading
        return stackView
    }()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
       
    override init(frame: CGRect) {
        super .init(frame: .zero)
        setViewHierarchy()
        setConstraints()
    }
    
    private func setViewHierarchy() {
        self.addSubview(globalStackView)
    }
    
    private func setConstraints() {
        globalStackView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
    }
    
}
