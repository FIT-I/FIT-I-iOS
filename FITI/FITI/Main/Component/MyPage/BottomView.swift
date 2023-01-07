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
    
    var heartList : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir-Black", size: 12.0)
        label.text = "찜 목록"
        label.snp.makeConstraints { make in
            make.width.equalTo(90)
        }
        label.textColor = UIColor.customColor(.blue)
        return label
    }()
    
    var userLocation : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir-Black", size: 12.0)
        label.text = "자기 위치 설정"
        label.snp.makeConstraints { make in
            make.width.equalTo(90)
        }
        label.textColor = UIColor.customColor(.blue)
        return label
    }()
    
    var notice : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir-Black", size: 12.0)
        label.text = "공지사항"
        label.snp.makeConstraints { make in
            make.width.equalTo(90)
        }
        label.textColor = UIColor.customColor(.blue)
        return label
    }()
    
    var clause : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir-Black", size: 12.0)
        label.text = "이용약관"
        label.snp.makeConstraints { make in
            make.width.equalTo(90)
        }
        label.textColor = UIColor.customColor(.blue)
        return label
    }()

    var heartListBtn : UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .systemBackground
        btn.setImage(UIImage(named: "rightBtn"), for: .normal)
        return btn
    }()
    
    var userLocationBtn : UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .systemBackground
        btn.setImage(UIImage(named: "rightBtn"), for: .normal)
        return btn
    }()
    
    var noticeBtn : UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .systemBackground
        btn.setImage(UIImage(named: "rightBtn"), for: .normal)
        return btn
    }()
    
    var clauseBtn : UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .systemBackground
        btn.setImage(UIImage(named: "rightBtn"), for: .normal)
        return btn
    }()
    
    lazy var heartStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [heartList,heartListBtn])
        stackView.axis = .horizontal
        stackView.spacing = 250
        stackView.alignment = .center
        return stackView
    }()
    
    lazy var userLocationStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [userLocation,userLocationBtn])
        stackView.axis = .horizontal
        stackView.spacing = 250
        stackView.alignment = .center
        return stackView
    }()
    
    lazy var noticeStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [notice,noticeBtn])
        stackView.axis = .horizontal
        stackView.spacing = 250
        stackView.alignment = .center
        return stackView
    }()
    
    lazy var clauseStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [clause,clauseBtn])
        stackView.axis = .horizontal
        stackView.spacing = 250
        stackView.alignment = .center
        return stackView
    }()
    
    lazy var globalStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [heartStackView,userLocationStackView,noticeStackView,clauseStackView])
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
