//
//  BottomStackView.swift
//  FITI
//
//  Created by 홍준혁 on 2023/01/07.
//

import Foundation
import SnapKit
import UIKit

class BottomView : UIView {
    
    private lazy var heartList : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15.0)
        label.text = "찜 목록"
        label.snp.makeConstraints { make in
            make.width.equalTo(60)
            make.height.equalTo(22)
        }
        label.textColor = UIColor.customColor(.blue)
        return label
    }()
    
    private lazy var writeReview : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15.0)
        label.text = "매칭 내역 보기 / 후기 작성란"
        label.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(22)
        }
        label.textColor = UIColor.customColor(.blue)
        return label
    }()

    private lazy var userLocation : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15.0)
        label.text = "매칭 위치 설정"
        label.snp.makeConstraints { make in
            make.width.equalTo(90)
            make.height.equalTo(22)
        }
        label.textColor = UIColor.customColor(.blue)
        return label
    }()
    
    private lazy var petchPassword : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15.0)
        label.text = "비밀번호 재설정"
        label.snp.makeConstraints { make in
            make.width.equalTo(120)
            make.height.equalTo(22)
        }
        label.textColor = UIColor.customColor(.blue)
        return label
    }()
    
    var notice : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15.0)
        label.text = "공지사항"
        label.snp.makeConstraints { make in
            make.width.equalTo(60)
            make.height.equalTo(22)
        }
        label.textColor = UIColor.customColor(.blue)
        return label
    }()
    
    var clause : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15.0)
        label.text = "이용약관"
        label.snp.makeConstraints { make in
            make.width.equalTo(60)
            make.height.equalTo(22)
        }
        label.textColor = UIColor.customColor(.blue)
        return label
    }()
    
    lazy var globalStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [heartList,writeReview,userLocation,petchPassword,notice,clause])
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
        self.backgroundColor = .systemBackground
        self.addSubview(globalStackView)
    }
    
    private func setConstraints() {
        globalStackView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
    }
}
