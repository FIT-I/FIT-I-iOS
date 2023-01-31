//
//  HeadView.swift
//  FITI
//
//  Created by 홍준혁 on 2023/01/10.
//

import Foundation
import SnapKit
import UIKit

class HeadView : UIView {
    
    // MARK: - UI Components
    
    lazy var reviewerImage : UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "reviewerIcon.svg")
        return imgView
    }()
    lazy var name : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir-Black", size: 15.0)
        label.textColor = UIColor.black
        return label
    }()
    lazy var goldIcon : UIImageView = {
        let image = UIImageView()
        return image
    }()
    private lazy var starIcon : UIImageView = {
        let image = UIImageView()
        image.snp.makeConstraints { make in
            make.height.width.equalTo(10)
        }
        image.image = UIImage(named: "star.svg")
        return image
    }()
    lazy var grade : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10.0)
        label.textColor = UIColor.customColor(.darkGray)
        return label
    }()
    private lazy var rateStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [starIcon,grade])
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.alignment = .center
        return stackView
    }()
    lazy var school : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10.0)
        label.textColor = UIColor.customColor(.darkGray)
        return label
    }()
    private lazy var nameStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [name,goldIcon])
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.alignment = .trailing
        return stackView
    }()
    private lazy var gradeStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [rateStackView,school])
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.alignment = .leading
        return stackView
    }()
    private lazy var globalStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [nameStackView,gradeStackView])
        stackView.axis = .vertical
        stackView.spacing = 6
        stackView.alignment = .leading
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
    
    func setViewHierarchy(){
        self.addSubview(reviewerImage)
        self.addSubview(globalStackView)
    }
    func setConstraints(){
        reviewerImage.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(30)
            make.height.width.equalTo(70)
        }
        globalStackView.snp.makeConstraints { make in
            make.top.equalTo(reviewerImage.snp.bottom).offset(15)
            make.leading.equalToSuperview().offset(30)
            make.trailing.bottom.equalToSuperview()
        }
    }
}
