//
//  BodyReviewView.swift
//  FITI
//
//  Created by 홍준혁 on 2023/01/10.
//

import Foundation
import UIKit
import SnapKit

class BodyReviewView : UIView {
    // 후기 뷰
    var reviewView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.customColor(.boxGray)
        view.layer.borderColor = UIColor.customColor(.boxGray).cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 8
        return view
    }()
    
    var reviewImage : UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "reviewIcon.svg")
        return imgView
    }()
    
    var reviewLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15.0)
        label.text = "후기 5건"
        label.textColor = UIColor.black
        return label
    }()
    
    var starIcon : UIImageView = {
        let image = UIImageView()
        image.snp.makeConstraints { make in
            make.height.width.equalTo(13)
        }
        image.image = UIImage(named: "star.svg")
        return image
    }()
    
    var gradeLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15.0)
        label.text = "평균 4.3"
        label.textColor = UIColor.customColor(.darkGray)
        return label
    }()
    
    lazy var reviewGradeLabel : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [starIcon,gradeLabel])
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.alignment = .center
        return stackView
    }()
    
    var bodyReviewLineView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.customColor(.gray)
        view.snp.makeConstraints { make in
            make.height.equalTo(1)
        }
        return view
    }()
    
    var reviewDetailBtn : UIButton = {
        let btn = UIButton()
        btn.snp.makeConstraints { make in
            make.height.equalTo(16)
            make.width.equalTo(12)
        }
        btn.backgroundColor = UIColor.customColor(.boxGray)
        btn.setImage(UIImage(named: "rightBtn"), for: .normal)
//        btn.addTarget(self, action: #selector(moveToReviewTableView), for: .touchUpInside)
        return btn
    }()
    
    // 리뷰 테이블 뷰
    private lazy var reviewTableView : UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = UIColor.customColor(.boxGray)
        tableView.separatorStyle = .none
        tableView.isScrollEnabled = false
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    lazy var reviewTopLeftStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [reviewImage,reviewLabel])
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.alignment = .trailing
        return stackView
    }()
    
    lazy var reviewTopRightStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [reviewGradeLabel,reviewDetailBtn])
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.alignment = .center
        return stackView
    }()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
       
    override init(frame: CGRect) {
        super .init(frame: .zero)

        setViewHierarchy()
        setConstraints()
        register()
    }
    
    func setViewHierarchy(){
        self.addSubview(reviewTopLeftStackView)
//        self.addSubview(reviewDetailBtn)
        self.addSubview(reviewTopRightStackView)
        self.addSubview(bodyReviewLineView)
        self.addSubview(reviewTableView)
    }
    
    func setConstraints(){
        
        reviewTopLeftStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(17)
            make.leading.equalToSuperview().offset(20)
        }
        reviewTopRightStackView.snp.makeConstraints { make in
//            make.top.equalToSuperview().offset(-17)
            make.bottom.equalTo(reviewTopLeftStackView.snp.bottom)
            make.trailing.equalToSuperview().offset(-20)
        }
        bodyReviewLineView.snp.makeConstraints { make in
            make.top.equalTo(reviewTopLeftStackView.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-22)
        }
        reviewTableView.snp.makeConstraints { make in
            make.top.equalTo(bodyReviewLineView.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-22)
            make.height.equalTo(270)
        }
    }
}


extension BodyReviewView {
    //MARK: - register
    
    private func register() {
        reviewTableView.register(PreviewReviewTableCell.self,
                                 forCellReuseIdentifier: PreviewReviewTableCell.identifier
        )
    }
    
    
}

//MARK: - ReviewTableView Delegate
extension BodyReviewView : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reviewDummy.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let reviewCell = tableView.dequeueReusableCell(withIdentifier: PreviewReviewTableCell.identifier, for: indexPath) as? PreviewReviewTableCell else { return UITableViewCell() }
        
        reviewCell.dataBind(model: reviewDummy[indexPath.row])
        reviewCell.selectionStyle = .none
        return reviewCell
    }
}


extension BodyReviewView : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}
