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
        label.text = "프로필"
        label.textColor = UIColor.customColor(.blue)
        return label
    }()
    private lazy var topImageView : UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "reviewerIcon.svg")
        return imgView
    }()
    lazy var customerProfile1 : UIButton = {
        let btn = UIButton()
        btn.snp.makeConstraints { make in
            make.height.width.equalTo(80)
        }
        btn.layer.cornerRadius = 20
        btn.backgroundColor = UIColor.lightGray
        btn.setImage(UIImage(named: "profile1.svg"), for: .normal)
        return btn
    }()
    lazy var customerProfile2 : UIButton = {
        let btn = UIButton()
        btn.snp.makeConstraints { make in
            make.height.width.equalTo(80)
        }
        btn.layer.cornerRadius = 20
        btn.backgroundColor = UIColor.lightGray
        btn.setImage(UIImage(named: "profile2.svg"), for: .normal)
        return btn
    }()
    lazy var customerProfile3 : UIButton = {
        let btn = UIButton()
        btn.snp.makeConstraints { make in
            make.height.width.equalTo(80)
        }
        btn.layer.cornerRadius = 20
        btn.backgroundColor = UIColor.lightGray
        btn.setImage(UIImage(named: "profile3.svg"), for: .normal)
        return btn
    }()
    lazy var customerProfile4 : UIButton = {
        let btn = UIButton()
        btn.snp.makeConstraints { make in
            make.height.width.equalTo(80)
        }
        btn.layer.cornerRadius = 20
        btn.backgroundColor = UIColor.lightGray
        btn.setImage(UIImage(named: "profile4.svg"), for: .normal)
        return btn
    }()
    lazy var customerProfile5 : UIButton = {
        let btn = UIButton()
        btn.snp.makeConstraints { make in
            make.height.width.equalTo(80)
        }
        btn.layer.cornerRadius = 20
        btn.backgroundColor = UIColor.lightGray
        btn.setImage(UIImage(named: "profile5.svg"), for: .normal)
        return btn
    }()
    lazy var customerProfile6 : UIButton = {
        let btn = UIButton()
        btn.snp.makeConstraints { make in
            make.height.width.equalTo(80)
        }
        btn.layer.cornerRadius = 20
        btn.backgroundColor = UIColor.lightGray
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
        label.font = UIFont(name: "Avenir-Black", size: 15.0)
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
        setButtonAction()
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
            make.top.equalTo(btnStackView.snp.bottom).offset(20)
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
    func showExceptionNotification(description:String){
        let alertController = UIAlertController(
            title: description,
            message: "다시 시도해주세요.",
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "확인", style: .destructive) { _ in
            self.dismiss(animated: true)
        }
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    func profileBtn(btnNum:Int){
        switch btnNum {
        case 1:
            self.patchProfile(profile: "customerProfile1")
            customerProfile1.backgroundColor = UIColor.customColor(.blue)
            customerProfile2.backgroundColor = UIColor.lightGray
            customerProfile3.backgroundColor = UIColor.lightGray
            customerProfile4.backgroundColor = UIColor.lightGray
            customerProfile5.backgroundColor = UIColor.lightGray
            customerProfile6.backgroundColor = UIColor.lightGray
        case 2:
            self.patchProfile(profile: "customerProfile2")
            customerProfile1.backgroundColor = UIColor.lightGray
            customerProfile2.backgroundColor = UIColor.customColor(.blue)
            customerProfile3.backgroundColor = UIColor.lightGray
            customerProfile4.backgroundColor = UIColor.lightGray
            customerProfile5.backgroundColor = UIColor.lightGray
            customerProfile6.backgroundColor = UIColor.lightGray
        case 3:
            self.patchProfile(profile: "customerProfile3")
            customerProfile1.backgroundColor = UIColor.lightGray
            customerProfile2.backgroundColor = UIColor.lightGray
            customerProfile3.backgroundColor = UIColor.customColor(.blue)
            customerProfile4.backgroundColor = UIColor.lightGray
            customerProfile5.backgroundColor = UIColor.lightGray
            customerProfile6.backgroundColor = UIColor.lightGray
        case 4:
            self.patchProfile(profile: "customerProfile4")
            customerProfile1.backgroundColor = UIColor.lightGray
            customerProfile2.backgroundColor = UIColor.lightGray
            customerProfile3.backgroundColor = UIColor.lightGray
            customerProfile4.backgroundColor = UIColor.customColor(.blue)
            customerProfile5.backgroundColor = UIColor.lightGray
            customerProfile6.backgroundColor = UIColor.lightGray
        case 5:
            self.patchProfile(profile: "customerProfile5")
            customerProfile1.backgroundColor = UIColor.lightGray
            customerProfile2.backgroundColor = UIColor.lightGray
            customerProfile3.backgroundColor = UIColor.lightGray
            customerProfile4.backgroundColor = UIColor.lightGray
            customerProfile5.backgroundColor = UIColor.customColor(.blue)
            customerProfile6.backgroundColor = UIColor.lightGray
        case 6:
            self.patchProfile(profile: "customerProfile6")
            customerProfile1.backgroundColor = UIColor.lightGray
            customerProfile2.backgroundColor = UIColor.lightGray
            customerProfile3.backgroundColor = UIColor.lightGray
            customerProfile4.backgroundColor = UIColor.lightGray
            customerProfile5.backgroundColor = UIColor.lightGray
            customerProfile6.backgroundColor = UIColor.customColor(.blue)
        default:
            return
        }
    }
    func setButtonAction(){
        let btnAction1 = UIAction { [weak self] _ in
            self?.profileBtn(btnNum: 1)
        }
        let btnAction2 = UIAction { [weak self] _ in
            self?.profileBtn(btnNum: 2)
        }
        let btnAction3 = UIAction { [weak self] _ in
            self?.profileBtn(btnNum: 3)
        }
        let btnAction4 = UIAction { [weak self] _ in
            self?.profileBtn(btnNum: 4)
        }
        let btnAction5 = UIAction { [weak self] _ in
            self?.profileBtn(btnNum: 5)
        }
        let btnAction6 = UIAction { [weak self] _ in
            self?.profileBtn(btnNum: 6)
        }
        customerProfile1.addAction(btnAction1, for: .touchUpInside)
        customerProfile2.addAction(btnAction2, for: .touchUpInside)
        customerProfile3.addAction(btnAction3, for: .touchUpInside)
        customerProfile4.addAction(btnAction4, for: .touchUpInside)
        customerProfile5.addAction(btnAction5, for: .touchUpInside)
        customerProfile6.addAction(btnAction6, for: .touchUpInside)
    }
}

// MARK: - network

extension SettingProfileViewController {
    func patchProfile(profile:String){
        MyPageAPI.shared.patchProfile(profile: profile){ response in
            guard let patchProfileResponse = response else { return }
            if patchProfileResponse.isSuccess == false {
                self.showExceptionNotification(description: patchProfileResponse.message ?? "실패하였습니다.")
            }else {
                self.getMyPageServer()
                return
            }
        }
    }
    func getMyPageServer(){
        MyPageAPI.shared.getMyPageDataAPI { response in
            if response?.isSuccess == false {
                self.showExceptionNotification(description: response?.message ?? "")
            }else {
                guard let myPageResponse = response?.result else { return }
                MyPageViewController.MyInfo.userName = myPageResponse.userName
                MyPageViewController.MyInfo.profile = myPageResponse.profile
                MyPageViewController.MyInfo.email = myPageResponse.email
                MyPageViewController.MyInfo.location = myPageResponse.location ?? "위치 설정을 해주세요."
            }
        }
    }
}
