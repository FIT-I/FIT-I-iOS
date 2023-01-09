//
//  HomeViewController.swift
//  FITI
//
//  Created by 홍준혁 on 2023/01/01.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {

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
        // Do any additional setup after loading the view.\
        
        
        trainerTableView.register(TrainerTabelCell.self, forCellReuseIdentifier: TrainerTabelCell.identifier)
        trainerTableView.delegate = self
        trainerTableView.dataSource = self
        
        
        signInViewAddUI()
        signInViewSetUI()
    }
    
    func signInViewAddUI(){
        view.addSubview(lineView)
        view.addSubview(trainerTableView)
    }
    
    func signInViewSetUI(){
        lineView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.leading.trailing.equalToSuperview()
        }
        trainerTableView.snp.makeConstraints { make in
            make.top.equalTo(lineView.snp.bottom)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.bottom.equalToSuperview().offset(-50)
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
