//
//  PickServiceViewController.swift
//  FITI
//
//  Created by 홍준혁 on 2023/01/04.
//

import UIKit
import SnapKit

class PickServiceViewController: UIViewController {

    var titleLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20.0)
        label.text = "서비스 선택"
        label.textColor = UIColor.customColor(.blue)
        return label
    }()
    
    var progressView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.customColor(.boxGray)
        view.snp.makeConstraints { make in
            make.height.equalTo(5)
        }
        return view
    }()
    
    var grayView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.lightGray
        view.snp.makeConstraints { make in
            make.height.equalTo(5)
        }
        return view
    }()
    
    var subTitleLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20.0)
        label.text = "서비스 선택하기"
        label.textColor = UIColor.black
        return label
    }()
    
    private let nextBtn : UIButton = {
        let btn = UIButton()
        btn.backgroundColor = UIColor.customColor(.blue)
        btn.layer.cornerRadius = 8
        btn.setTitle("매칭 요청", for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.layer.borderWidth = 1
        btn.layer.borderColor = UIColor.customColor(.blue).cgColor
        btn.addTarget(self, action: #selector(nextEvent), for: .touchUpInside)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.topItem?.title = ""
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image:UIImage(named: "leftIcon.svg"), style: .plain, target: self, action: #selector(backTapped))
        
        // Do any additional setup after loading the view.
        setViewHierarchy()
        setConstraints()
    }
    
    private func setViewHierarchy() {
        view.addSubview(titleLabel)
        view.addSubview(progressView)
        progressView.addSubview(grayView)
        view.addSubview(subTitleLabel)
        view.addSubview(nextBtn)
    }
    
    private func setConstraints(){
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(70)
            make.centerX.equalToSuperview()
        }
        progressView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(38)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        grayView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.width.equalToSuperview().dividedBy(3)
        }
        subTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(grayView.snp.bottom).offset(33)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-220)
        }
        nextBtn.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(770)
            make.leading.equalToSuperview().offset(14)
            make.trailing.equalToSuperview().offset(-14)
            make.bottom.equalToSuperview().offset(-40)
        }
    }
    
    @objc func nextEvent(){
        let nextVC = PickDateViewController()
        navigationController?.pushViewController(nextVC, animated: false)
    }
    
    @objc func backTapped(sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }

}
