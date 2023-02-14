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
    
    // MARK: - Properties
    
    static var previewReviewData = [ReviewDto]()
    
    // MARK: - UI Components
    
    var reviewView : UIView = {
        let view = UIView()
//        view.backgroundColor = UIColor.customColor(.boxGray)
        view.backgroundColor = .systemBackground
//        view.layer.borderColor = UIColor.customColor(.boxGray).cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 8
        return view
    }()
    private lazy var reviewImage : UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "reviewIcon.svg")
        return imgView
    }()
    private lazy var emptyReviewLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15.0)
        label.text = "작성된 후기가 없습니다."
        label.textColor = UIColor.customColor(.gray)
        return label
    }()
    private lazy var review : UILabel = {
        let label = UILabel()
        label.text = "후기"
        label.font = UIFont.systemFont(ofSize: 15.0)
        label.textColor = UIColor.black
        return label
    }()
    lazy var reviewLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15.0)
        label.textColor = UIColor.black
        return label
    }()
    private lazy var reviewText : UILabel = {
        let label = UILabel()
        label.text = "건"
        label.font = UIFont.systemFont(ofSize: 15.0)
        label.textColor = UIColor.black
        return label
    }()
    private lazy var reviewStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [review,reviewLabel,reviewText])
        stackView.axis = .horizontal
        stackView.spacing = 1
        stackView.alignment = .trailing
        return stackView
    }()
    private lazy var starIcon : UIImageView = {
        let image = UIImageView()
        image.snp.makeConstraints { make in
            make.height.width.equalTo(13)
        }
        image.image = UIImage(named: "star.svg")
        return image
    }()
    lazy var gradeLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15.0)
        label.textColor = UIColor.customColor(.darkGray)
        return label
    }()
    private lazy var reviewGradeLabel : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [starIcon,gradeLabel])
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.alignment = .center
        return stackView
    }()
    private lazy var bodyReviewLineView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.customColor(.gray)
        view.snp.makeConstraints { make in
            make.height.equalTo(1)
        }
        return view
    }()
    lazy var reviewDetailBtn : UIButton = {
        let btn = UIButton()
        btn.snp.makeConstraints { make in
            make.height.equalTo(16)
            make.width.equalTo(12)
        }
        btn.backgroundColor = UIColor.customColor(.boxGray)
        btn.setImage(UIImage(named: "rightGray"), for: .normal)
        return btn
    }()
    lazy var previewReviewTableView : UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = UIColor.customColor(.boxGray)
        tableView.separatorStyle = .none
        tableView.isScrollEnabled = false
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    private lazy var reviewTopLeftStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [reviewImage,reviewStackView])
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.alignment = .trailing
        return stackView
    }()
    private lazy var reviewTopRightStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [reviewGradeLabel,reviewDetailBtn])
        stackView.axis = .horizontal
        stackView.spacing = 8
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
        register()
    }
    
    // MARK: - Func
    
    func setViewHierarchy(){
        self.addSubviews(reviewTopLeftStackView,
                         reviewTopRightStackView,
                         bodyReviewLineView,
                         previewReviewTableView,
                         emptyReviewLabel
        )
    }
    
    func setConstraints(){
        reviewTopLeftStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(17)
            make.leading.equalToSuperview().offset(20)
        }
        reviewTopRightStackView.snp.makeConstraints { make in
            make.bottom.equalTo(reviewTopLeftStackView.snp.bottom)
            make.trailing.equalToSuperview().offset(-20)
        }
        bodyReviewLineView.snp.makeConstraints { make in
            make.top.equalTo(reviewTopLeftStackView.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-22)
//            make.leading.trailing.equalToSuperview()
        }
        emptyReviewLabel.snp.makeConstraints { make in
            make.top.equalTo(bodyReviewLineView.snp.bottom).offset(10)
            make.leading.equalTo(bodyReviewLineView.snp.leading)
        }
        previewReviewTableView.snp.makeConstraints { make in
            make.top.equalTo(bodyReviewLineView.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-22)
//            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().offset(-5)
        }
    }
    
    func setEmptyLable(isEmpty:Int){
        if isEmpty != 0 {
            self.emptyReviewLabel.isHidden = true
        }else {
            self.emptyReviewLabel.isHidden = false
        }
    }
}

// MARK: - Extension

extension BodyReviewView {
    private func register() {
        previewReviewTableView.register(PreviewReviewTableCell.self,
                                 forCellReuseIdentifier: PreviewReviewTableCell.identifier
        )
    }
}
extension BodyReviewView : UITableViewDelegate {}
extension BodyReviewView : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.setEmptyLable(isEmpty: TrainerDetailViewController.specificTrainer.reviewDto?.count ?? 0)
        let cellNum = TrainerDetailViewController.specificTrainer.reviewDto?.count ?? 0
        switch cellNum {
        case 0...3:
            return cellNum
        default:
            return 3
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reviewCell = tableView.dequeueReusableCell(withIdentifier: PreviewReviewTableCell.identifier, for: indexPath) as? PreviewReviewTableCell ?? PreviewReviewTableCell()
        reviewCell.dataBind(model: BodyReviewView.previewReviewData[indexPath.row])
        reviewCell.selectionStyle = .none
        return reviewCell
    }
}
