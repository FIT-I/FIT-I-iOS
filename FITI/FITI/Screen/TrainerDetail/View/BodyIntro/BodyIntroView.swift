//
//  BodyIntroView.swift
//  FITI
//
//  Created by 홍준혁 on 2023/01/10.
//

import Foundation
import SnapKit
import UIKit

class BodyIntroView : UIView {
    var introImage : UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "introIcon.svg")
        return imgView
    }()
    
    var introLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15.0)
        label.text = "소개 글"
        label.textColor = UIColor.black
        return label
    }()
    
    lazy var introTopStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [introImage,introLabel])
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.alignment = .trailing
        return stackView
    }()
    
    var introLineView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.customColor(.gray)
        view.snp.makeConstraints { make in
            make.height.equalTo(1)
        }
        return view
    }()
    
    var introTextView : UITextView = {
        let textView = UITextView()
        textView.backgroundColor = UIColor.customColor(.boxGray)
        textView.textColor = UIColor.customColor(.darkGray)
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.textContainer.maximumNumberOfLines = 2
        textView.textContainer.lineBreakMode = .byTruncatingTail
        textView.font = UIFont.systemFont(ofSize: 15.0)
        return textView
    }()
    
    var textDetailBtn: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = UIColor.customColor(.boxGray)
        btn.setImage(UIImage(named: "chevron.compact.down.svg"), for: .normal)
        return btn
    }()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
       
    override init(frame: CGRect) {
        super .init(frame: .zero)

        setViewHierarchy()
        setConstraints()
    }
    
    func setViewHierarchy(){
        self.addSubview(introTopStackView)
        self.addSubview(introLineView)
        self.addSubview(introTextView)
        self.addSubview(textDetailBtn)
    }
    
    func setConstraints(){
        introTopStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(17)
            make.leading.equalToSuperview().offset(20)
            make.height.equalTo(30)
        }
        introLineView.snp.makeConstraints { make in
            make.top.equalTo(introTopStackView.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(18)
            make.trailing.equalToSuperview().offset(-22)
        }
        introTextView.snp.makeConstraints { make in
            make.top.equalTo(introLineView.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        textDetailBtn.snp.makeConstraints { make in
            make.top.equalTo(introTextView.snp.bottom)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(20)
            make.bottom.equalToSuperview().offset(-5)
        }
    }
}
