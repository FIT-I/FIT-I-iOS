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
    
    // MARK: - UI Components
    
    private lazy var introImage : UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "introIcon.svg")
        return imgView
    }()
    private lazy var introLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15.0)
        label.text = "소개 글"
        label.textColor = UIColor.black
        return label
    }()
    private lazy var introTopStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [introImage,introLabel])
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.alignment = .trailing
        return stackView
    }()
    private lazy var introLineView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.customColor(.gray)
        return view
    }()
    lazy var emptyIntroLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15.0)
        label.text = "작성된 소개 글이 없습니다."
        label.textColor = UIColor.customColor(.darkGray)
        return label
    }()
    lazy var introTextView : UITextView = {
        let textView = UITextView()
//        textView.backgroundColor = UIColor.customColor(.boxGray)
        textView.backgroundColor = .systemBackground
        textView.textColor = UIColor.customColor(.darkGray)
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.textContainer.maximumNumberOfLines = 5
        textView.textContainer.lineBreakMode = .byTruncatingTail
        textView.font = UIFont.systemFont(ofSize: 15.0)
        return textView
    }()
    lazy var textDetailBtn: UIButton = {
        let btn = UIButton()
//        btn.backgroundColor = UIColor.customColor(.boxGray)
        btn.backgroundColor = .systemBackground
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
        self.addSubviews(introTopStackView,
                         introLineView,
                         introTextView,
                         textDetailBtn,
                         emptyIntroLabel
        )
    }
    
    func setConstraints(){
        introTopStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(17)
            make.leading.equalToSuperview()
//            make.height.equalTo(30)
        }
        introLineView.snp.makeConstraints { make in
            make.top.equalTo(introTopStackView.snp.bottom).offset(10)
            make.height.equalTo(1)
//            make.leading.equalToSuperview().offset(18)
//            make.trailing.equalToSuperview().offset(-22)
            make.leading.trailing.equalToSuperview()
        }
        emptyIntroLabel.snp.makeConstraints { make in
            make.top.equalTo(introLineView.snp.bottom).offset(10)
            make.leading.equalTo(introLineView.snp.leading)
        }
        introTextView.snp.makeConstraints { make in
            make.top.equalTo(introLineView.snp.bottom).offset(10)
//            make.leading.equalToSuperview().offset(20)
//            make.trailing.equalToSuperview().offset(-20)
            make.leading.trailing.equalToSuperview()
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
