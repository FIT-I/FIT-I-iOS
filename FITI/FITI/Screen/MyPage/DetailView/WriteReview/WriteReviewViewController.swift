//
//  WriteReviewViewController.swift
//  FITI
//
//  Created by 홍준혁 on 2023/02/06.
//

import Foundation
import UIKit
import SnapKit

class WriteReviewViewController: UIViewController {
    
    private var writeReviewList = [SuccessMatchSheet]()
    
    private let matchEmptyImage : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named:"matchEmptyImage.svg")
        return imageView
    }()
    
    lazy var titleLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir-Black", size: 20.0)
        label.text = "매칭 내역 보기 / 후기 남기기"
        label.textColor = UIColor.customColor(.blue)
        return label
    }()
    lazy var progressView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.customColor(.boxGray)
        view.snp.makeConstraints { make in
            make.height.equalTo(5)
        }
        return view
    }()
    private lazy var reviewTableView : UITableView = {
        let tableview = UITableView()
        return tableview
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setNavigationController()
        setViewHierarchy()
        setConstraints()
        setTableView()
    }
    override func viewWillAppear(_ animated: Bool) {
        self.writeReviewList = MatchViewController.successMatchList
        setEmptyImage()
    }
    
    // MARK: - @objc
    
    @objc func backTapped(sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - func
    
    func setViewHierarchy(){
        view.addSubviews(titleLabel,
                         progressView,
                         reviewTableView,
                         matchEmptyImage
        )
    }
    func setConstraints(){
        matchEmptyImage.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalTo(253)
            make.width.equalTo(142)
        }
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(70)
            make.centerX.equalToSuperview()
        }
        progressView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        reviewTableView.snp.makeConstraints { make in
            make.top.equalTo(progressView.snp.bottom)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    func setTableView(){
        reviewTableView.register(WriteReviewTableCell.self, forCellReuseIdentifier: WriteReviewTableCell.identifier)
        reviewTableView.delegate = self
        reviewTableView.dataSource = self
    }
    
    func setNavigationController(){
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.topItem?.title = ""
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image:UIImage(named: "leftIcon.svg"), style: .plain, target: self, action: #selector(backTapped))
    }
    
    func setEmptyImage(){
        if MatchViewController.successMatchList.count > 0 {
            matchEmptyImage.isHidden = true
            reviewTableView.isHidden = false
        }else {
            matchEmptyImage.isHidden = false
            reviewTableView.isHidden = true
        }
    }
}

extension WriteReviewViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let touchedCell = tableView.cellForRow(at: indexPath) as! WriteReviewTableCell
        print(touchedCell.trainerId)
        let nextVC = MatchingReviewViewController()
        MatchingReviewViewController.tainerId = touchedCell.trainerId
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}

extension WriteReviewViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return writeReviewList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WriteReviewTableCell.identifier, for: indexPath) as? WriteReviewTableCell ?? WriteReviewTableCell()
        cell.bindingMatchingWriteReviewList(model: writeReviewList[indexPath.row])
        cell.selectionStyle = .none
        cell.accessoryType = .disclosureIndicator
        return cell
    }
}
