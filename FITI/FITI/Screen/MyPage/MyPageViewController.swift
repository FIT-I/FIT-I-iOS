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
    
    // MARK: - Properties
    
    static var MyInfo = UserInfo()
    private let myPageProvider = MoyaProvider<MyPageRouter>()
    
    // MARK: - UI Components

    private lazy var myPageTitleLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir-Black", size: 20.0)
        label.text = "마이페이지"
        label.textColor = UIColor.customColor(.blue)
        return label
    }()
    
    private lazy var settingBtn : UIButton = {
        let btn = UIButton()
        btn.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.width.equalTo(80)
        }
        btn.setImage(UIImage(named: "gearshape.svg"), for: .normal)
        btn.addTarget(self, action: #selector(settingBtnEvent), for: .touchUpInside)
        return btn
    }()
    
    private var progressView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.customColor(.boxGray)
        view.snp.makeConstraints { make in
            make.height.equalTo(5)
        }
        return view
    }()
    let midProfileStackView = ProfileView()
    let lineView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.customColor(.boxGray)
        view.snp.makeConstraints { make in
            make.height.equalTo(2)
        }
        return view
    }()
    let bottomView = BottomView()
    let bottomBtn = BottomBtnView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        self.navigationItem.hidesBackButton = true
        setNavigationController()
        setServerData()
        getMyPageServer()
        setViewHierarchy()
        setConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setServerData()
        getHeartListServer()
        getMyPageServer()
        getSuccessMatchingListServer()
    }

    func setViewHierarchy(){
        self.setBtnEvents()
        view.addSubviews(myPageTitleLabel,
                         settingBtn,
                         progressView,
                         midProfileStackView,
                         lineView,
                         bottomView,
                         bottomBtn
        )
    }
    
    func setConstraints(){
        myPageTitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(70)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
        }
        settingBtn.snp.makeConstraints { make in
            make.centerY.equalTo(myPageTitleLabel)
            make.trailing.equalToSuperview()
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
        lineView.snp.makeConstraints { make in
            make.top.equalTo(midProfileStackView.snp.bottom).offset(15)
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
    
    // MARK: - @objc

    @objc func settingBtnEvent(){
        let nextVC = SettingViewController()
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @objc func settingProfileBtnEvent(){
        let nextVC = SettingProfileViewController()
        nextVC.name.text = MyPageViewController.MyInfo.userName
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @objc func heartListBtnEvent(){
        let nextVC = HeartListViewController()
        navigationController?.pushViewController(nextVC, animated: true)
    }
    @objc func reviewBtnEvent(){
        let nextVC = WriteReviewViewController()
        navigationController?.pushViewController(nextVC, animated: true)
    }
    @objc func localtionBtnEvent(){
        let nextVC = SearchViewController()
        self.present(nextVC, animated: true, completion: nil)
    }
    @objc func patchPasswordBtnEvent(){
        let nextVC = PatchPasswordViewController()
        navigationController?.pushViewController(nextVC, animated: true)
    }
    @objc func noticeBtnEvent(){
        let nextVC = NoticeViewController()
        navigationController?.pushViewController(nextVC, animated: true)
    }
    @objc func clauseBtnEvent(){
        let nextVC = ClauseViewController()
        navigationController?.pushViewController(nextVC, animated: true)
    }
    @objc func backTapped(sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - func
    
    func getMyPageServer(){
        self.myPageProvider.request(.getMyPage){ response in
            switch response {
                case .success(let moyaResponse):
                    do {
                        let responseData = try moyaResponse.map(MyPageResponse.self)
                        MyPageViewController.MyInfo.userName = responseData.result.userName
                        MyPageViewController.MyInfo.profile = responseData.result.profile
                        MyPageViewController.MyInfo.email = responseData.result.email
                        MyPageViewController.MyInfo.location = responseData.result.location ?? "위치 설정을 해주세요."
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
        bottomBtn.writeReviewBtn.addTarget(self, action: #selector(reviewBtnEvent), for: .touchUpInside)
        bottomBtn.userLocationBtn.addTarget(self, action: #selector(localtionBtnEvent), for: .touchUpInside)
        bottomBtn.noticeBtn.addTarget(self, action: #selector(noticeBtnEvent), for: .touchUpInside)
        bottomBtn.clauseBtn.addTarget(self, action: #selector(clauseBtnEvent), for: .touchUpInside)
        midProfileStackView.fixProfileBtn.addTarget(self, action: #selector(settingProfileBtnEvent), for: .touchUpInside)
        bottomBtn.petchPasswordBtn.addTarget(self, action: #selector(patchPasswordBtnEvent), for: .touchUpInside)
    }
    
    private func setServerData(){
        midProfileStackView.name.text = MyPageViewController.MyInfo.userName
        midProfileStackView.userId.text = MyPageViewController.MyInfo.email
    }
    func setNavigationController(){
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.topItem?.title = ""
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image:UIImage(named: "leftIcon.svg"), style: .plain, target: self, action: #selector(backTapped))
    }
}

//MARK: - Network

extension MyPageViewController {
    func getHeartListServer(){
        print("getHeartList")
        MyPageAPI.shared.getHeartListAPI{ response in
            guard let heartListResponse = response?.result else { return }
            HeartListViewController.heartList = heartListResponse
        }
    }
    func getSuccessMatchingListServer(){
        CustomerAPI.shared.getSuccessMatchingListAPI(){ response in
            guard let successMatchingListResponse = response?.result else { return }
            if response?.isSuccess == true {
                MatchViewController.successMatchList = successMatchingListResponse
            }else {
                print("성공된 매칭을 불러오는데 실패했습니다.")
            }
        }
    }
}
