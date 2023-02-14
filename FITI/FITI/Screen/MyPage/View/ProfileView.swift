//
//  Profile.swift
//  FITI
//
//  Created by 홍준혁 on 2023/01/07.
//

import Foundation
import UIKit
import SnapKit

class ProfileView : UIView {
    
    var reviewerImage : UIImageView = {
        let imgView = UIImageView()
        return imgView
    }()

    var name : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir-Black", size: 25.0)
        label.textColor = UIColor.customColor(.blue)
        return label
    }()
    
    var userId : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15.0)
        label.textColor = UIColor.customColor(.darkGray)
        return label
    }()
    
    lazy var leftStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [name,userId])
        stackView.axis = .vertical
        stackView.spacing = 1
        stackView.alignment = .leading
        return stackView
    }()
    
    lazy var midLeftStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [reviewerImage,leftStackView])
        stackView.axis = .horizontal
        stackView.spacing = 20
        stackView.alignment = .center
        return stackView
    }()
    
    var fixProfileBtn : UIButton = {
        let btn = UIButton()
        btn.setTitle("프로필 수정", for: .normal)
        btn.setTitleColor(UIColor.customColor(.darkGray), for: .normal)
        btn.titleLabel?.font = UIFont(name: "Avenir-Black", size: 12.0)
        btn.backgroundColor = .systemBackground
        return btn
    }()
    
    lazy var midStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [midLeftStackView,fixProfileBtn])
        stackView.axis = .horizontal
        stackView.spacing = 5
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
        self.addSubview(midStackView)
    }
    
    private func setConstraints(){
        midStackView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
    }
    
}
