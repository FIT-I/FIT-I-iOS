//
//  MyPageViewController.swift
//  FITI
//
//  Created by 홍준혁 on 2023/01/01.
//

import UIKit
import SnapKit
import Moya
import Realm

struct UserInfo {
    var userName = ""
    var profile = ""
    var email = ""
    var location = ""
}

class MyPageViewController: UIViewController {
    
    static var MyInfo = UserInfo()
    
    private let provider = MoyaProvider<CustomerRouter>()
    private let myPageProvider = MoyaProvider<MyPageRouter>()

    var myPageTitleLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir-Black", size: 20.0)
        label.text = "마이페이지"
        label.textColor = UIColor.customColor(.blue)
        return label
    }()
    
    var settingBtn : UIButton = {
        let btn = UIButton()
        btn.snp.makeConstraints { make in
            make.height.equalTo(30)
            make.width.equalTo(50)
        }
        btn.setImage(UIImage(named: "gearshape.svg"), for: .normal)
        btn.addTarget(self, action: #selector(settingBtnEvent), for: .touchUpInside)
        return btn
    }()
    
    private var progressView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.customColor(.boxGray)
        view.snp.makeConstraints { make in
            make.height.equalTo(10)
        }
        return view
    }()
    
    // 프로필 스택 뷰
    let midProfileStackView = ProfileView()
    
    // 알림 뷰
    let notiView = NotificationSwitch()
    
    // line 뷰
    let lineView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.customColor(.boxGray)
        view.snp.makeConstraints { make in
            make.height.equalTo(2)
        }
        return view
    }()
    
    // 하단 뷰
    let bottomView = BottomView()
    let bottomBtn = BottomBtnView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        self.navigationItem.hidesBackButton = true
        // Do any additional setup after loading the view.
        setServerData()
        getMyPageServer()
        setViewLayer()
        setViewHierarchy()
        setConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setServerData()
        getHeartListServer()
        getMyPageServer()
    }

    func setViewLayer(){
        notiView.layer.cornerRadius = 10
    }
    
    func setViewHierarchy(){
        
        self.setBtnEvents()
        
        view.addSubview(myPageTitleLabel)
        view.addSubview(settingBtn)
        view.addSubview(progressView)
        view.addSubview(midProfileStackView)
        view.addSubview(notiView)
        view.addSubview(lineView)
        view.addSubview(bottomView)
        view.addSubview(bottomBtn)
    }
    
    func setConstraints(){
        
        myPageTitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(70)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
        }
        settingBtn.snp.makeConstraints { make in
            make.centerY.equalTo(myPageTitleLabel)
            make.trailing.equalToSuperview().offset(-24)
        }
        progressView.snp.makeConstraints { make in
            make.top.equalTo(myPageTitleLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        midProfileStackView.snp.makeConstraints { make in
            make.top.equalTo(progressView.snp.bottom).offset(15)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-23)
            make.height.equalTo(85)
        }
        notiView.snp.makeConstraints { make in
            make.top.equalTo(midProfileStackView.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(-15)
            make.height.equalTo(50)
        }
        lineView.snp.makeConstraints { make in
            make.top.equalTo(notiView.snp.bottom).offset(15)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        bottomView.snp.makeConstraints { make in
            make.top.equalTo(lineView.snp.bottom).offset(30)
            make.leading.equalToSuperview().offset(20)
        }
        bottomBtn.snp.makeConstraints { make in
            make.top.equalTo(lineView.snp.bottom).offset(30)
            make.trailing.equalToSuperview().offset(-20)
        }
    }

    @objc func settingBtnEvent(){
        let nextVC = SettingViewController()
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    func getMyPageServer(){
        self.myPageProvider.request(.getMyPage){ response in
            switch response {
                case .success(let moyaResponse):
                    do {
                        let responseData = try moyaResponse.map(MyPageResponse.self)
                        MyPageViewController.MyInfo.userName = responseData.result.userName
                        MyPageViewController.MyInfo.profile = responseData.result.profile
                        MyPageViewController.MyInfo.email = responseData.result.email
                        MyPageViewController.MyInfo.location = responseData.result.location
                        print(responseData)
                    } catch(let err) {
                        print(err.localizedDescription)
                    }
                case .failure(let err):
                    print(err.localizedDescription)
            }
        }
    }
    
    
    func setBtnEvents(){
        bottomBtn.heartListBtn.addTarget(self, action: #selector(heartListBtnEvent), for: .touchUpInside)
        bottomBtn.userLocationBtn.addTarget(self, action: #selector(localtionBtnEvent), for: .touchUpInside)
        bottomBtn.noticeBtn.addTarget(self, action: #selector(noticeBtnEvent), for: .touchUpInside)
        bottomBtn.clauseBtn.addTarget(self, action: #selector(clauseBtnEvent), for: .touchUpInside)
        midProfileStackView.fixProfileBtn.addTarget(self, action: #selector(settingProfileBtnEvent), for: .touchUpInside)
    }
    
    @objc func settingProfileBtnEvent(){
        let nextVC = SettingProfileViewController()
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @objc func heartListBtnEvent(){
        let nextVC = HeartListViewController()
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @objc func localtionBtnEvent(){
        let nextVC = SearchViewController()
        self.present(nextVC, animated: true, completion: nil)
    }
    
    @objc func noticeBtnEvent(){
        let nextVC = NoticeViewController()
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @objc func clauseBtnEvent(){
        let nextVC = ClauseViewController()
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    private func setServerData(){
        midProfileStackView.name.text = MyPageViewController.MyInfo.userName
        midProfileStackView.userId.text = MyPageViewController.MyInfo.email
    }
}

//MARK: - Extension

extension MyPageViewController {
    func getHeartListServer(){
        print("getHeartList")
        MyPageAPI.shared.getHeartListAPI{ response in
            guard let heartListResponse = response?.result else { return }
            HeartListViewController.heartList = heartListResponse
        }
    }
}
