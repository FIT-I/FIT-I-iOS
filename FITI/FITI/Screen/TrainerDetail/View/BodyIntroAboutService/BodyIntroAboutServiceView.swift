//
//  BodyIntroAboutService.swift
//  FITI
//
//  Created by 홍준혁 on 2023/01/10.
//

import Foundation
import SnapKit
import UIKit

class BodyIntroAboutServiceView : UIView {
    
    // MARK: - UI Components
    
    private lazy var introServiceImage : UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "newspaper.svg")
        return imgView
    }()
    private lazy var introServiceLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15.0)
        label.text = "서비스 상세 설명"
        label.textColor = UIColor.black
        return label
    }()
    private lazy var introServiceTopStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [introServiceImage,introServiceLabel])
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.alignment = .trailing
        return stackView
    }()
    private lazy var introServiceLineView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.customColor(.gray)
        return view
    }()
    lazy var introServiceTextView : UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.backgroundColor = UIColor.customColor(.boxGray)
        textView.textColor = UIColor.customColor(.darkGray)
        textView.textContainer.maximumNumberOfLines = 2
        textView.textContainer.lineBreakMode = .byTruncatingTail
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.font = UIFont.systemFont(ofSize: 15.0)
        return textView
    }()
    lazy var textDetailBtn: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = UIColor.customColor(.boxGray)
        btn.setImage(UIImage(named: "chevron.compact.down.svg"), for: .normal)
        return btn
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
    
    func setViewHierarchy(){
        self.addSubview(introServiceTopStackView)
        self.addSubview(introServiceLineView)
        self.addSubview(introServiceTextView)
        self.addSubview(textDetailBtn)
    }
    
    func setConstraints(){
        introServiceTopStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(17)
            make.leading.equalToSuperview().offset(20)
            make.height.equalTo(30)
        }
        introServiceLineView.snp.makeConstraints { make in
            make.top.equalTo(introServiceTopStackView.snp.bottom).offset(10)
            make.height.equalTo(1)
            make.leading.equalToSuperview().offset(18)
            make.trailing.equalToSuperview().offset(-22)
        }
        introServiceTextView.snp.makeConstraints { make in
            make.top.equalTo(introServiceLineView.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        textDetailBtn.snp.makeConstraints { make in
            make.top.equalTo(introServiceTextView.snp.bottom)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(20)
            make.bottom.equalToSuperview().offset(-5)
        }
    }
}
