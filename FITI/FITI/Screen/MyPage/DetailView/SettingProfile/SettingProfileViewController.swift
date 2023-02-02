//
//  SettingProfileViewController.swift
//  FITI
//
//  Created by 홍준혁 on 2023/01/08.
//

import UIKit
import SnapKit

class SettingProfileViewController: UIViewController {

    // MARK: - Properties
    
    private lazy var myPageTitleLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir-Black", size: 15.0)
        label.text = "프로필 수정"
        label.textColor = UIColor.customColor(.blue)
        return label
    }()
    private lazy var topImageView : UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "reviewerIcon.svg")
        return imgView
    }()
    private lazy var progressView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.customColor(.boxGray)
        view.snp.makeConstraints { make in
            make.height.equalTo(5)
        }
        return view
    }()
    private lazy var bottomInfoView = BottomInfoView()

    // MARK: - UI Components
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        self.setNavigationController()
        self.dismissKeyboard()
        self.setServerData()
        setViewHierarchy()
        setConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setServerData()
    }
    
    func setViewHierarchy(){
        view.addSubview(myPageTitleLabel)
        view.addSubview(topImageView)
        view.addSubview(progressView)
        view.addSubview(bottomInfoView)
    }
    
    func setConstraints(){
        myPageTitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(60)
            make.centerX.equalToSuperview()
        }
        topImageView.snp.makeConstraints { make in
            make.top.equalTo(myPageTitleLabel.snp.bottom).offset(35)
            make.height.width.equalTo(60)
            make.centerX.equalToSuperview()
        }
        progressView.snp.makeConstraints { make in
            make.top.equalTo(topImageView.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview()
        }
        bottomInfoView.snp.makeConstraints { make in
            make.top.equalTo(progressView.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
        }
    }
    
    //MARK: - @objc Func
    
    @objc func backTapped(sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
    //MARK: - Func
    
    private func setServerData(){
        bottomInfoView.userEmail.text = MyPageViewController.MyInfo.email
        bottomInfoView.userLocation.text = MyPageViewController.MyInfo.location
    }
    private func setNavigationController(){
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.topItem?.title = ""
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image:UIImage(named: "leftIcon.svg"), style: .plain, target: self, action: #selector(backTapped))
    }
}
