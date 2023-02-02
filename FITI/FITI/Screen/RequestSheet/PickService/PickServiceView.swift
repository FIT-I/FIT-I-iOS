//
//  PickServiceView.swift
//  FITI
//
//  Created by 홍준혁 on 2023/01/05.
//

import UIKit
import SnapKit

class PickServiceView: UIView {
    
    // MARK: - Properties

    var isFirstPickBtnTouched : Bool = false
    
    // MARK: - UI Components
    
    private lazy var firstPickBtn : UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "emptyBox.svg"), for: .normal)
        btn.addTarget(self, action: #selector(hourBtnClicked), for: .touchUpInside)
        return btn
    }()
    private lazy var hourLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20.0)
        label.text = "1시간"
        label.textColor = UIColor.black
        return label
    }()
    private lazy var firstLeftStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [firstPickBtn,hourLabel])
        stackView.axis = .horizontal
        stackView.spacing = 15
        stackView.alignment = .center
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
        self.addSubview(firstLeftStackView)
    }
    
    private func setConstraints(){
        firstLeftStackView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
    }
    
    // MARK: - @objc
    
    @objc func hourBtnClicked(sender: UIBarButtonItem) {
        if isFirstPickBtnTouched == false {
            firstPickBtn.setImage(UIImage(named: "fillBox.svg"), for: .normal)
            isFirstPickBtnTouched = true
        }else {
            firstPickBtn.setImage(UIImage(named: "emptyBox.svg"), for: .normal)
            isFirstPickBtnTouched = false
        }
    }
}
