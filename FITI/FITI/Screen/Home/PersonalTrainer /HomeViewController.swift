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
    private let provider = MoyaProvider<MyPageServices>()
    // line 뷰
    let lineView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.customColor(.boxGray)
        view.snp.makeConstraints { make in
            make.height.equalTo(10)
        }
        return view
    }()
    
    // 트레이너 보여주는 테이블 뷰
    let trainerTableView : UITableView = {
        let tableview = UITableView()
        return tableview
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        // Do any additional setup after loading the view.
        
        
        trainerTableView.register(TrainerTabelCell.self, forCellReuseIdentifier: TrainerTabelCell.identifier)
        trainerTableView.delegate = self
        trainerTableView.dataSource = self
    
        signInViewAddUI()
        signInViewSetUI()
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
    
    func getMyPageServer(){
        self.provider.request(.getMyPage){ response in
            switch response {
                case .success(let moyaResponse):
                    do {
                        let responseData = try moyaResponse.map(MyPageResponse.self)
                        MyPageViewController.MyInfo.userName = responseData.result.userName
                        MyPageViewController.MyInfo.profile = responseData.result.profile
                        MyPageViewController.MyInfo.email = responseData.result.email
                        MyPageViewController.MyInfo.location = responseData.result.location
                    } catch(let err) {
                        print(err.localizedDescription)
                    }
                case .failure(let err):
                    print(err.localizedDescription)
            }
        }
    }

    
    @objc func tapped(sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }

}

extension HomeViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("cell did touched")
        let nextVC = TrainerDetailViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}


extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TrainerTabelCell.identifier, for: indexPath)
//        cell.binding()
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
}

