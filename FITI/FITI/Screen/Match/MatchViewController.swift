//
//  ChatViewController.swift
//  FITI
//
//  Created by 홍준혁 on 2023/01/01.
//

import UIKit

class MatchViewController: UIViewController {
    private lazy var titleLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir-Black", size: 20.0)
        label.text = "매칭 내역 확인"
        label.textColor = UIColor.customColor(.blue)
        return label
    }()
    private lazy var progressView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.customColor(.boxGray)
        view.snp.makeConstraints { make in
            make.height.equalTo(5)
        }
        return view
    }()
    private lazy var requestTableView : UITableView = {
        let tableview = UITableView()
        return tableview
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setViewHierarchy()
        setConstraints()
//        setTableView()
    }
    func setViewHierarchy(){
        view.addSubview(titleLabel)
        view.addSubview(progressView)
//        view.addSubview(requestTableView)
    }
    func setConstraints(){
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(70)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        progressView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
//        requestTableView.snp.makeConstraints { make in
//            make.top.equalTo(progressView.snp.bottom)
//            make.leading.equalToSuperview().offset(20)
//            make.trailing.equalToSuperview()
//            make.bottom.equalToSuperview()
//        }
    }
//    func setTableView(){
//        requestTableView.register(CommunityTableCell.self, forCellReuseIdentifier: CommunityTableCell.identifier)
//        requestTableView.delegate = self
//        requestTableView.dataSource = self
//    }
}

//extension MatchViewController : UITableViewDelegate {
//
//}
//
//extension MatchViewController : UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 0
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: )
//        retr
//    }
//}
