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
    private lazy var customerProfile1 : UIButton = {
        let btn = UIButton()
        btn.snp.makeConstraints { make in
            make.height.width.equalTo(90)
        }
        btn.backgroundColor = .gray
        btn.setImage(UIImage(named: "profile1.svg"), for: .normal)
        return btn
    }()
    private lazy var customerProfile2 : UIButton = {
        let btn = UIButton()
        btn.snp.makeConstraints { make in
            make.height.width.equalTo(90)
        }
        btn.backgroundColor = .gray
        btn.setImage(UIImage(named: "profile2.svg"), for: .normal)
        return btn
    }()
    private lazy var customerProfile3 : UIButton = {
        let btn = UIButton()
        btn.snp.makeConstraints { make in
            make.height.width.equalTo(90)
        }
        btn.backgroundColor = .gray
        btn.setImage(UIImage(named: "profile3.svg"), for: .normal)
        return btn
    }()
    private lazy var customerProfile4 : UIButton = {
        let btn = UIButton()
        btn.snp.makeConstraints { make in
            make.height.width.equalTo(90)
        }
        btn.backgroundColor = .gray
        btn.setImage(UIImage(named: "profile4.svg"), for: .normal)
        return btn
    }()
    private lazy var customerProfile5 : UIButton = {
        let btn = UIButton()
        btn.snp.makeConstraints { make in
            make.height.width.equalTo(90)
        }
        btn.backgroundColor = .gray
        btn.setImage(UIImage(named: "profile5.svg"), for: .normal)
        return btn
    }()
    private lazy var customerProfile6 : UIButton = {
        let btn = UIButton()
        btn.snp.makeConstraints { make in
            make.height.width.equalTo(90)
        }
        btn.backgroundColor = .gray
        btn.setImage(UIImage(named: "profile6.svg"), for: .normal)
        return btn
    }()
    private lazy var topHorizontalBtnStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [customerProfile1,customerProfile2,customerProfile3])
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        return stackView
    }()
    private lazy var bottomHorizontalBtnStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [customerProfile4,customerProfile5,customerProfile6])
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        return stackView
    }()
    private lazy var btnStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [topHorizontalBtnStackView,bottomHorizontalBtnStackView])
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        return stackView
    }()
    lazy var name : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
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
        view.addSubviews(myPageTitleLabel,
                         btnStackView,
                         progressView,
                         name,
                         bottomInfoView
        )
    }
    
    func setConstraints(){
        myPageTitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(60)
            make.centerX.equalToSuperview()
        }
        btnStackView.snp.makeConstraints { make in
            make.top.equalTo(myPageTitleLabel.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
        }
        name.snp.makeConstraints { make in
            make.top.equalTo(btnStackView.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
        progressView.snp.makeConstraints { make in
            make.top.equalTo(name.snp.bottom).offset(20)
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
