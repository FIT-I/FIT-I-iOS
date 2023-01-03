//
//  HomeViewController.swift
//  FITI
//
//  Created by 홍준혁 on 2023/01/01.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    
    var appImage : UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "appIcon.svg")
        return imgView
    }()

    // 상단 5개 버튼 구현
    private let selectBtn1 : UIButton = {
        let btn = UIButton()
        btn.snp.makeConstraints { make in
            make.width.equalTo(65)
            make.height.equalTo(20)
        }
        btn.backgroundColor = UIColor.systemBackground
        btn.layer.cornerRadius = 8
        btn.setTitle("개인PT", for: .normal)
        btn.titleLabel?.font = UIFont(name: "Noto Sans", size: 15)
        btn.setTitleColor(UIColor.customColor(.gray), for: .normal)
        btn.layer.borderWidth = 1
        btn.layer.borderColor = UIColor.customColor(.gray).cgColor
        return btn
    }()
    
    private let selectBtn2 : UIButton = {
        let btn = UIButton()
        btn.snp.makeConstraints { make in
            make.width.equalTo(65)
            make.height.equalTo(20)
        }
        btn.backgroundColor = UIColor.systemBackground
        btn.layer.cornerRadius = 8
        btn.setTitle("다이어트", for: .normal)
        btn.titleLabel?.font = UIFont(name: "Noto Sans", size: 15)
        btn.setTitleColor(UIColor.customColor(.gray), for: .normal)
        btn.layer.borderWidth = 1
        btn.layer.borderColor = UIColor.customColor(.gray).cgColor
        return btn
    }()
    
    private let selectBtn3 : UIButton = {
        let btn = UIButton()
        btn.snp.makeConstraints { make in
            make.width.equalTo(65)
            make.height.equalTo(20)
        }
        btn.backgroundColor = UIColor.systemBackground
        btn.layer.cornerRadius = 8
        btn.setTitle("식단관리", for: .normal)
        btn.titleLabel?.font = UIFont(name: "Noto Sans", size: 15)
        btn.setTitleColor(UIColor.customColor(.gray), for: .normal)
        btn.layer.borderWidth = 1
        btn.layer.borderColor = UIColor.customColor(.gray).cgColor
        return btn
    }()
    
    private let selectBtn4 : UIButton = {
        let btn = UIButton()
        btn.snp.makeConstraints { make in
            make.width.equalTo(65)
            make.height.equalTo(20)
        }
        btn.backgroundColor = UIColor.systemBackground
        btn.layer.cornerRadius = 8
        btn.setTitle("재활치료", for: .normal)
        btn.titleLabel?.font = UIFont(name: "Noto Sans", size: 15)
        btn.setTitleColor(UIColor.customColor(.gray), for: .normal)
        btn.layer.borderWidth = 1
        btn.layer.borderColor = UIColor.customColor(.gray).cgColor
        return btn
    }()
    
    private let selectBtn5 : UIButton = {
        let btn = UIButton()
        btn.snp.makeConstraints { make in
            make.width.equalTo(65)
            make.height.equalTo(20)
        }
        btn.backgroundColor = UIColor.systemBackground
        btn.layer.cornerRadius = 8
        btn.setTitle("운동친구", for: .normal)
        btn.titleLabel?.font = UIFont(name: "Noto Sans", size: 15)
        btn.setTitleColor(UIColor.customColor(.gray), for: .normal)
        btn.layer.borderWidth = 1
        btn.layer.borderColor = UIColor.customColor(.gray).cgColor
        return btn
    }()
    
    private let selectBtnsStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        return stackView
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
    
    func signInViewAddUI(){
        
        view.addSubview(appImage)
        
        selectBtnsStackView.addArrangedSubview(selectBtn1)
        selectBtnsStackView.addArrangedSubview(selectBtn2)
        selectBtnsStackView.addArrangedSubview(selectBtn3)
        selectBtnsStackView.addArrangedSubview(selectBtn4)
        selectBtnsStackView.addArrangedSubview(selectBtn5)
        
        view.addSubview(selectBtnsStackView)
        view.addSubview(trainerTableView)
    }
    
    func signInViewSetUI(){
        
        appImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(70)
            make.leading.equalToSuperview().offset(62)
            make.trailing.equalToSuperview().offset(-62)
            make.height.equalTo(20)
        }
        
        selectBtnsStackView.snp.makeConstraints { make in
            make.top.equalTo(appImage.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-21)
        }
        
        trainerTableView.snp.makeConstraints { make in
            make.top.equalTo(selectBtnsStackView.snp.bottom).offset(43)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-21)
            make.bottom.equalToSuperview().offset(-140)
        }
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
