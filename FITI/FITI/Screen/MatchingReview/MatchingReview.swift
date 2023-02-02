//
//  MatchingReview.swift
//  FITI
//
//  Created by 여진홍 on 2023/02/01.
//

import Foundation
import UIKit
import SnapKit

class MatchingReview: UIView {

    private lazy var starReview: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15.0)
        label.text = "별점"
        label.textColor = UIColor.customColor(.blue)
        return label
    }()
    
    lazy var rateView: RateView = {
        let view = RateView()

        return view
    }()
    
    private lazy var upLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.customColor(.gray)
        view.snp.makeConstraints { make in
            make.height.equalTo(1)
        }
        return view
    }()
    
    private lazy var matchingReview: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15.0)
        label.text = "매칭 후기"
        label.textColor = UIColor.customColor(.blue)
        return label
    }()
    
    private lazy var underLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.customColor(.gray)
        view.snp.makeConstraints { make in
            make.height.equalTo(1)
        }
        return view
    }()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(frame: CGRect) {
        super .init(frame: .zero)
    
        setViewHierarchy()
        setConstraints()
    }
    
    func setViewHierarchy() {
        self.addSubview(starReview)
        self.addSubview(upLineView)
        self.addSubview(rateView)
        self.addSubview(matchingReview)
        self.addSubview(underLineView)
    }
    
    func setConstraints() {
        starReview.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(30)
            make.leading.equalToSuperview().offset(22)
        }
        
        rateView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(27)
            make.leading.equalToSuperview().offset(165)
        }
        
        upLineView.snp.makeConstraints { make in
            make.top.equalTo(starReview.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(21)
            make.trailing.equalToSuperview().offset(-21)
        }
        
        matchingReview.snp.makeConstraints { make in
            make.top.equalTo(upLineView.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(22)
        }
        
        underLineView.snp.makeConstraints { make in
            make.top.equalTo(matchingReview.snp.bottom).offset(5)
            make.leading.equalToSuperview().offset(22)
            make.trailing.equalToSuperview().offset(-20)
        }
    }
    
}


