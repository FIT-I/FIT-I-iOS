//
//  ReviewViewController.swift
//  FITI
//
//  Created by 홍준혁 on 2023/01/04.
//

import UIKit
import SnapKit

class ReviewViewController: UIViewController {
    
    // MARK: - Properties
    
    var reviewData = [ReviewDto]()
    
    // MARK: - UI Components
    
    private let titleLabel : UILabel = {
        let lb = UILabel()
        lb.text = "리뷰 전체보기"
        lb.textColor = UIColor.black
        lb.font = UIFont(name: "Avenir-Black", size: 20.0)
        return lb
    }()
    let reviewTableView : UITableView = {
        let tableview = UITableView()
        return tableview
    }()

    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setViewHierarchy()
        setConstraints()
        setNavigationController()
        setTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        reviewTableView.reloadData()
        setReviewData()
    }
    
    func setViewHierarchy(){
        view.addSubview(titleLabel)
        view.addSubview(reviewTableView)
    }
    
    func setConstraints(){
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(60)
            make.centerX.equalToSuperview()
        }
        reviewTableView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(40)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.bottom.equalToSuperview().offset(-10)
        }
    }
    
    // MARK: - @objc
    
    @objc func backTapped(sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Func
    
    func setTableView(){
        reviewTableView.register(ReviewTableCell.self, forCellReuseIdentifier: ReviewTableCell.identifier)
        reviewTableView.delegate = self
        reviewTableView.dataSource = self
        reviewTableView.separatorStyle = .none
        reviewTableView.showsVerticalScrollIndicator = false
    }
    func setNavigationController(){
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.topItem?.title = ""
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image:UIImage(named: "leftIcon.svg"), style: .plain, target: self, action: #selector(backTapped))
    }
    func setReviewData(){
        self.reviewData = TrainerDetailViewController.specificTrainer.reviewDto ?? [ReviewDto]()
    }
}

// MARK: - Extension

extension ReviewViewController : UITableViewDelegate {}
extension ReviewViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.reviewData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ReviewTableCell.identifier, for: indexPath) as? ReviewTableCell ?? ReviewTableCell()
        cell.reviewTableBnding(model: reviewData[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
}
