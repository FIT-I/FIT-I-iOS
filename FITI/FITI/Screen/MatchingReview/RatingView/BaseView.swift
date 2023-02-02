//
//  BaseView.swift
//  FITI
//
//  Created by 여진홍 on 2023/02/01.
//

import UIKit

class BaseView: UIView {
    override init(frame: CGRect){
        super.init(frame: frame)
        
        configure()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {}
    func bind() {}
    
}

