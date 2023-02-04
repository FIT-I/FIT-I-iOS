//
//  BottomTableView.swift
//  FITI
//
//  Created by 홍준혁 on 2023/01/08.
//

import Foundation
import UIKit
import SnapKit

class BottomBtnView : UIView {
    
    lazy var heartListBtn : UIButton = {
        let btn = UIButton()
        btn.snp.makeConstraints { make in
            make.height.equalTo(22)
        }
        btn.backgroundColor = .systemBackground
        btn.setImage(UIImage(named: "rightBtn"), for: .normal)
        return btn
    }()
    
    lazy var writeReviewBtn : UIButton = {
        let btn = UIButton()
        btn.snp.makeConstraints { make in
            make.height.equalTo(22)
        }
        btn.backgroundColor = .systemBackground
        btn.setImage(UIImage(named: "rightBtn"), for: .normal)
        return btn
    }()
    
    lazy var userLocationBtn : UIButton = {
        let btn = UIButton()
        btn.snp.makeConstraints { make in
            make.height.equalTo(22)
        }
        btn.backgroundColor = .systemBackground
        btn.setImage(UIImage(named: "rightBtn"), for: .normal)
        return btn
    }()
    
    lazy var petchPasswordBtn : UIButton = {
        let btn = UIButton()
        btn.snp.makeConstraints { make in
            make.height.equalTo(22)
        }
        btn.backgroundColor = .systemBackground
        btn.setImage(UIImage(named: "rightBtn"), for: .normal)
        return btn
    }()
    
    lazy var noticeBtn : UIButton = {
        let btn = UIButton()
        btn.snp.makeConstraints { make in
            make.height.equalTo(22)
        }
        btn.backgroundColor = .systemBackground
        btn.setImage(UIImage(named: "rightBtn"), for: .normal)
        return btn
    }()
    
    lazy var clauseBtn : UIButton = {
        let btn = UIButton()
        btn.snp.makeConstraints { make in
            make.height.equalTo(22)
        }
        btn.backgroundColor = .systemBackground
        btn.setImage(UIImage(named: "rightBtn"), for: .normal)
        return btn
    }()
    
    lazy var globalStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [heartListBtn,writeReviewBtn,userLocationBtn,petchPasswordBtn,noticeBtn,clauseBtn])
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
