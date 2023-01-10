//
//  PickServicePrice.swift
//  FITI
//
//  Created by 홍준혁 on 2023/01/10.
//

import Foundation
import UIKit
import SnapKit

class PickServicePrice : UIView {
    var hourPriceLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20.0)
        label.text = "20,000원"
        label.textColor = UIColor.black
        return label
    }()

    var addPriceLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20.0)
        label.text = "+10,000원"
        label.textColor = UIColor.black
        return label
    }()
    
    lazy var globalStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [hourPriceLabel,addPriceLabel])
        stackView.axis = .vertical
        stackView.alignment = .trailing
        stackView.spacing = 23
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
    
    private func setConstraints(){
        globalStackView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
    }
    
}
