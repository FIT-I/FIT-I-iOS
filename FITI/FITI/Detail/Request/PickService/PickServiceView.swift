//
//  PickServiceView.swift
//  FITI
//
//  Created by 홍준혁 on 2023/01/05.
//

import UIKit
import SnapKit

class PickServiceView: UIView {

    var firstPickBtn : UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "emptyBox.svg"), for: .normal)
        return btn
    }()
    
    var secondPickBtn : UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "emptyBox.svg"), for: .normal)
        return btn
    }()
    
    var hourLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20.0)
        label.text = "1시간"
        label.textColor = UIColor.black
        return label
    }()
    
    var addLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20.0)
        label.text = "추가관리"
        label.textColor = UIColor.black
        return label
    }()
    
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
    
    lazy var firstLeftStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [firstPickBtn,hourLabel])
        stackView.axis = .horizontal
        stackView.spacing = 15
        stackView.alignment = .center
        return stackView
    }()
    
    lazy var firstStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [firstLeftStackView,hourPriceLabel])
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 157
        return stackView
    }()
    
    lazy var secondLeftStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [secondPickBtn,addLabel])
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 15
        return stackView
    }()
    
    lazy var secondStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [secondLeftStackView,addPriceLabel])
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 123
        return stackView
    }()
    
    lazy var globalStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [firstStackView,secondStackView])
        stackView.axis = .vertical
        stackView.alignment = .leading
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
        firstLeftStackView.addSubview(firstPickBtn)
        firstLeftStackView.addSubview(hourLabel)
        
        firstStackView.addSubview(firstLeftStackView)
        firstStackView.addSubview(hourPriceLabel)
        
        secondLeftStackView.addSubview(secondPickBtn)
        secondLeftStackView.addSubview(addLabel)
        
        secondStackView.addSubview(secondLeftStackView)
        secondStackView.addSubview(addPriceLabel)
        
        globalStackView.addSubview(firstStackView)
        globalStackView.addSubview(secondStackView)
        
        self.addSubview(globalStackView)
    }
    
    private func setConstraints(){
        globalStackView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
    }
}
