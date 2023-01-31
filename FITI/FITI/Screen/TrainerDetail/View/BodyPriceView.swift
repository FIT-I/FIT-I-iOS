//
//  bodyView.swift
//  FITI
//
//  Created by 홍준혁 on 2023/01/10.
//

import Foundation
import UIKit
import SnapKit

class BodyPriceView : UIView {
    
    // MARK: - UI Components
    
    private lazy var priceImage : UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "priceIcon.svg")
        return imgView
    }()
    private lazy var priceLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15.0)
        label.text = "관리 비용"
        label.textColor = UIColor.black
        return label
    }()
    private lazy var priceLineView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.customColor(.gray)
        view.snp.makeConstraints { make in
            make.height.equalTo(1)
        }
        return view
    }()
    private lazy var timeLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15.0)
        label.text = "1시간"
        label.textColor = UIColor.customColor(.darkGray)
        return label
    }()
    lazy var priceForTimeLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12.0)
        label.textColor = UIColor.customColor(.darkGray)
        return label
    }()
    private lazy var wonLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12.0)
        label.textColor = UIColor.customColor(.darkGray)
        label.text = "원"
        return label
    }()
    private lazy var priceTopStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [priceImage,priceLabel])
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.alignment = .trailing
        return stackView
    }()
    private lazy var priceRightStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [priceForTimeLabel,wonLabel])
        stackView.axis = .horizontal
        stackView.spacing = 2
        stackView.alignment = .trailing
        return stackView
    }()
    
    // MARK: - init
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    override init(frame: CGRect) {
        super .init(frame: .zero)
        setViewHierarchy()
        setConstraints()
    }
    
    // MARK: - Func
    
    private func setViewHierarchy() {
        self.addSubview(priceTopStackView)
        self.addSubview(priceLineView)
        self.addSubview(timeLabel)
        self.addSubview(priceRightStackView)
    }
    private func setConstraints(){
        priceTopStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(17)
            make.leading.equalToSuperview().offset(20)
        }
        priceLineView.snp.makeConstraints { make in
            make.top.equalTo(priceTopStackView.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(18)
            make.trailing.equalToSuperview().offset(-22)
        }
        timeLabel.snp.makeConstraints { make in
            make.top.equalTo(priceLineView.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(20)
        }
        priceRightStackView.snp.makeConstraints { make in
            make.top.equalTo(priceLineView.snp.bottom).offset(10)
            make.trailing.equalToSuperview().offset(-20)
        }
    }
}
