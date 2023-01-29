//
//  HomeViewController.swift
//  FITI
//
//  Created by 홍준혁 on 2023/01/01.
//

import UIKit

import SnapKit
import Moya

// 개인 PT
class HomeViewController: UIViewController {
    
    // MARK: - Properties
    
    static var trainerList = [Dto]()
    
    // MARK: - UI Components
    
    let lineView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.customColor(.boxGray)
        view.snp.makeConstraints { make in
            make.height.equalTo(10)
        }
        return view
    }()
    let trainerTableView : UITableView = {
        let tableview = UITableView()
        return tableview
    }()
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        signInViewAddUI()
        signInViewSetUI()
        setTableViewCell()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getMyPageServer()
    }
    
    func signInViewAddUI(){
        view.addSubview(trainerTableView)
    }
    
    func signInViewSetUI(){
        trainerTableView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(120)
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(-15)
            make.bottom.equalToSuperview().offset(-50)
        }
    }

    // MARK: - @objc Func
    
    @objc func tapped(sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Func
    
    func setTableViewCell(){
        trainerTableView.register(TrainerTableCell.self, forCellReuseIdentifier: TrainerTableCell.identifier)
        trainerTableView.delegate = self
        trainerTableView.dataSource = self
    }
}

// MARK: - Extension

extension HomeViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("cell did touched")
        let nextVC = TrainerDetailViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}
extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return HomeViewController.trainerList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TrainerTableCell.identifier, for: indexPath) as? TrainerTableCell ?? TrainerTableCell()
        cell.bindingTrainerList(model: HomeViewController.trainerList[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
}
extension HomeViewController {
    func getMyPageServer(){
        MyPageAPI.shared.getMyPageDataAPI { response in
            guard let myPageResponse = response?.result else { return }
            MyPageViewController.MyInfo.userName = myPageResponse.userName
            MyPageViewController.MyInfo.profile = myPageResponse.profile
            MyPageViewController.MyInfo.email = myPageResponse.email
            MyPageViewController.MyInfo.location = myPageResponse.location
        }
    }
}
