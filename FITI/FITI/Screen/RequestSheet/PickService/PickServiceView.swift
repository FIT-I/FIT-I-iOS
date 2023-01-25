//
//  PickServiceView.swift
//  FITI
//
//  Created by 홍준혁 on 2023/01/05.
//

import UIKit
import SnapKit

class PickServiceView: UIView {

    var isFirstPickBtnTouched : Bool = false
    var isSecondPickBtnTouched : Bool = false
    
    var firstPickBtn : UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "emptyBox.svg"), for: .normal)
        btn.addTarget(self, action: #selector(hourBtnClicked), for: .touchUpInside)
        return btn
    }()
    
    var secondPickBtn : UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "emptyBox.svg"), for: .normal)
        btn.addTarget(self, action: #selector(addBtnClicked), for: .touchUpInside)
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
    

    
    lazy var firstLeftStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [firstPickBtn,hourLabel])
        stackView.axis = .horizontal
        stackView.spacing = 15
        stackView.alignment = .center
        return stackView
    }()
    
    lazy var secondLeftStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [secondPickBtn,addLabel])
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 15
        return stackView
    }()
    
    lazy var globalStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [firstLeftStackView,secondLeftStackView])
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
        self.addSubview(globalStackView)
    }
    
    private func setConstraints(){
        globalStackView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
    }
    
    @objc func hourBtnClicked(sender: UIBarButtonItem) {
        if isFirstPickBtnTouched == false {
            firstPickBtn.setImage(UIImage(named: "fillBox.svg"), for: .normal)
            isFirstPickBtnTouched = true
            
        }else {
            firstPickBtn.setImage(UIImage(named: "emptyBox.svg"), for: .normal)
            isFirstPickBtnTouched = false
        }
    }
    @objc func addBtnClicked(sender: UIBarButtonItem) {
        if isSecondPickBtnTouched == false {
            secondPickBtn.setImage(UIImage(named: "fillBox.svg"), for: .normal)
            isSecondPickBtnTouched = true
        }else {
            secondPickBtn.setImage(UIImage(named: "emptyBox.svg"), for: .normal)
            isSecondPickBtnTouched = false
        }
    }
}
