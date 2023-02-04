//
//  BaseView.swift
//  FITI
//
//  Created by 홍준혁 on 2023/02/04.
//

import Foundation
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
