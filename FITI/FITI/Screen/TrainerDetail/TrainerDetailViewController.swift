//
//  BookDetailVC.swift
//  FITI
//
//  Created by 홍준혁 on 2023/01/11.
//

import Foundation
import UIKit

import SnapKit
import Then

class TrainerDetailViewController: UIViewController {
    
    // MARK: - Properties
    
    static var isHeartFull : Bool = false
    var isScrolled = false
    static var id = Int()
    static var trainerHeartList = [HeartList]()
    // MARK: - FIX ME : Delegate 패턴으로 수정
    static var specificTrainer = Trainer()
    
    //MARK: - UI Components
    
    private lazy var topView : UIImageView = {
        let imgView = UIImageView()
        return imgView
    }()
    private lazy var toolBarContainerView : UIView = {
        let view = UIView()
        return view
    }()
    private lazy var matchingRequest : UIButton = {
        let btn = UIButton()
        btn.backgroundColor = UIColor.customColor(.blue)
        btn.layer.cornerRadius = 8
        btn.setTitle("매칭 요청", for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.layer.borderWidth = 1
        btn.layer.borderColor = UIColor.customColor(.blue).cgColor
        btn.addTarget(self, action: #selector(matchingRequestTouched), for: .touchUpInside)
        return btn
    }()
    static var heartBtn : UIButton = {
        let btn = UIButton()
        btn.backgroundColor = UIColor.systemBackground
        btn.layer.cornerRadius = 8
        btn.setImage(UIImage(named: "heart"), for: .normal)
        btn.layer.borderWidth = 1
        btn.layer.borderColor = UIColor.customColor(.blue).cgColor
        btn.addTarget(self, action: #selector(heartTouchEvent), for: .touchUpInside)
        return btn
    }()
    private lazy var contentScrollView = UIScrollView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .white
        $0.showsVerticalScrollIndicator = true
    }
    let headView = HeadView()
    let bodyPriceView = BodyPriceView()
    let bodyIntroView = BodyIntroView()
    let bodyIntroAboutService = BodyIntroAboutServiceView()
    let bodyReviewView = BodyReviewView()
    let bottomPhotoView = BottomPhotoView()
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationController()
        setButtonEvent()
        setViewLayer()
        setLayout()
        setData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setHeartIcon()
        setData()
        resizePreviewReviewView()
        bodyReviewView.previewReviewTableView.reloadData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        getHeartListServer()
    }
    
    // MARK: - @objc Func
    
    @objc func backTapped(sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func dismissVC() {
        self.dismiss(animated: true)
    }
    
    @objc func matchingRequestTouched(){
        let nextVC = PickServiceViewController()
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @objc func moveToReviewTableView(){
        let nextVC = ReviewViewController()
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @objc func moveToBodyIntroDetailIntroView(){
        let nextVC = DetailBodyIntroViewController()
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @objc func moveToAboutServiceDetailIntroView(){
        let nextVC = DetailBodyIntroAboutServiceViewController()
        navigationController?.pushViewController(nextVC, animated: true)
    }

    @objc func heartTouchEvent(){
        if TrainerDetailViewController.isHeartFull == false {
            TrainerDetailViewController.isHeartFull = true
            TrainerDetailViewController.heartBtn.setImage(UIImage(named: "heart.fill.svg"), for: .normal)
            self.postHeartServer(trainerIndex: TrainerDetailViewController.id)
        }else{
            TrainerDetailViewController.isHeartFull = false
            TrainerDetailViewController.heartBtn.setImage(UIImage(named: "heart.svg"), for: .normal)
            self.deleteHeartServer(trainerIndex: TrainerDetailViewController.id)
        }
    }
    
    // MARK: Func
    
    func setHeartIcon() {
        for i in 0..<TrainerDetailViewController.trainerHeartList.count {
            print(TrainerDetailViewController.trainerHeartList[i].trainerIdx)
            print(TrainerDetailViewController.id)
            if TrainerDetailViewController.trainerHeartList[i].trainerIdx == TrainerDetailViewController.id {
                TrainerDetailViewController.isHeartFull = true
                TrainerDetailViewController.heartBtn.setImage(UIImage(named: "heart.fill.svg"), for: .normal)
            }else {
                TrainerDetailViewController.isHeartFull = false
                TrainerDetailViewController.heartBtn.setImage(UIImage(named: "heart.svg"), for: .normal)
            }
        }
    }
    func setButtonEvent(){
        bodyReviewView.reviewDetailBtn.addTarget(self, action: #selector(moveToReviewTableView), for: .touchUpInside)
        bodyIntroView.textDetailBtn.addTarget(self, action: #selector(moveToBodyIntroDetailIntroView), for: .touchUpInside)
        bodyIntroAboutService.textDetailBtn.addTarget(self, action: #selector(moveToAboutServiceDetailIntroView), for: .touchUpInside)
    }
    func setViewLayer(){
        bodyPriceView.layer.cornerRadius = 8
        bodyIntroView.layer.cornerRadius = 8
        bodyIntroAboutService.layer.cornerRadius = 8
        bodyReviewView.layer.cornerRadius = 8
    }
    func setNavigationController(){
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.topItem?.title = ""
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image:UIImage(named: "leftIcon.svg"), style: .plain, target: self, action: #selector(backTapped))
    }
    func setData(){
        self.headView.name.text = TrainerDetailViewController.specificTrainer.name
        self.headView.school.text = TrainerDetailViewController.specificTrainer.school
        self.headView.grade.text = String(TrainerDetailViewController.specificTrainer.grade)
        switch TrainerDetailViewController.specificTrainer.levelName {
        case "gold":
            self.headView.goldIcon.image = UIImage(named: "gold.svg")
        case "silver":
            self.headView.goldIcon.image = UIImage(named: "silver.svg")
        case "bronze":
            self.headView.goldIcon.image = UIImage(named: "bronze.svg")
        default:
            self.headView.goldIcon.image = nil
        }
        self.bodyPriceView.priceForTimeLabel.text = (TrainerDetailViewController.specificTrainer.cost ?? "0") + "원"
        self.bodyIntroView.introTextView.text = TrainerDetailViewController.specificTrainer.intro
        self.bodyIntroAboutService.introServiceTextView.text = TrainerDetailViewController.specificTrainer.service
        self.bodyReviewView.reviewLabel.text = String(TrainerDetailViewController.specificTrainer.reviewDto?.count ?? 0)
        self.bodyReviewView.gradeLabel.text = String(TrainerDetailViewController.specificTrainer.grade) + "점"
        if TrainerDetailViewController.specificTrainer.profile == "trainerProfile" {
            self.headView.reviewerImage.image = UIImage(named: "reviewerIcon.svg")
        } else {
            let url = URL(string: TrainerDetailViewController.specificTrainer.profile ?? "")
            self.headView.reviewerImage.kf.setImage(with: url)
        }
        if TrainerDetailViewController.specificTrainer.background == "trainerProfile" || TrainerDetailViewController.specificTrainer.background == nil {
            self.topView.image = UIImage(named: "blueScreen.svg")
        } else {
            let url = URL(string: TrainerDetailViewController.specificTrainer.background ?? "")
            self.topView.kf.setImage(with: url)
        }
    }
    func resizePreviewReviewView(){
        let reviewNum = TrainerDetailViewController.specificTrainer.reviewDto?.count
        switch reviewNum {
        case 0:
            bodyReviewView.snp.remakeConstraints {
                $0.top.equalTo(bodyIntroAboutService.snp.bottom).offset(25)
                $0.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
                $0.trailing.equalTo(view.safeAreaLayoutGuide).offset(-20)
                $0.height.equalTo(100)
            }
            bodyReviewView.reviewDetailBtn.layer.isHidden = true
            return
        case 1:
            bodyReviewView.snp.remakeConstraints {
                $0.top.equalTo(bodyIntroAboutService.snp.bottom).offset(25)
                $0.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
                $0.trailing.equalTo(view.safeAreaLayoutGuide).offset(-20)
                $0.height.equalTo(170)
            }
        case 2:
            bodyReviewView.snp.remakeConstraints {
                $0.top.equalTo(bodyIntroAboutService.snp.bottom).offset(25)
                $0.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
                $0.trailing.equalTo(view.safeAreaLayoutGuide).offset(-20)
                $0.height.equalTo(260)
            }
        default:
            return
        }
    }
}

//MARK: - Extension

extension TrainerDetailViewController {
    
    //MARK: - setLayout
    
    func setLayout() {
        
        //MARK: addSubViews
        view.addSubviews(contentScrollView, toolBarContainerView)
        toolBarContainerView.addSubviews(TrainerDetailViewController.heartBtn,matchingRequest)
        contentScrollView.addSubviews(
            topView,
            headView,
            bodyPriceView,
            bodyIntroView,
            bodyIntroAboutService,
            bodyReviewView,
            bottomPhotoView
        )
        
        //MARK: - naviViewLayout
        
        view.backgroundColor = .systemBackground
        toolBarContainerView.backgroundColor = .systemBackground
        bodyPriceView.backgroundColor = UIColor.customColor(.boxGray)
        bodyIntroView.backgroundColor = UIColor.customColor(.boxGray)
        bodyIntroAboutService.backgroundColor = UIColor.customColor(.boxGray)
        bodyReviewView.backgroundColor = UIColor.customColor(.boxGray)
        
        //MARK: - toolBarLayout
    
        toolBarContainerView.snp.makeConstraints {
            $0.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(64)
        }
        TrainerDetailViewController.heartBtn.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.bottom.equalToSuperview().offset(-10)
            make.leading.equalToSuperview().offset(16)
            make.width.equalTo(50)
        }
        matchingRequest.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.bottom.equalToSuperview().offset(-10)
            make.leading.equalTo(TrainerDetailViewController.heartBtn.snp.trailing).offset(10)
            make.trailing.equalToSuperview().offset(-14)
        }
        contentScrollView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.equalTo(toolBarContainerView.snp.top)
        }
        topView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(180)
        }
        headView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(145)
            make.leading.equalToSuperview()
        }
        bodyPriceView.snp.makeConstraints {
            $0.top.equalTo(headView.snp.bottom).offset(20)
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).offset(-20)
            $0.height.equalTo(90)
        }
        bodyIntroView.snp.makeConstraints {
            $0.top.equalTo(bodyPriceView.snp.bottom).offset(25)
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).offset(-20)
            $0.bottom.equalTo(bodyIntroView.textDetailBtn.snp.bottom).offset(5)
        }
        bodyIntroAboutService.snp.makeConstraints {
            $0.top.equalTo(bodyIntroView.snp.bottom).offset(25)
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).offset(-20)
            $0.bottom.equalTo(bodyIntroAboutService.textDetailBtn.snp.bottom).offset(5)
        }
        bodyReviewView.snp.makeConstraints {
            $0.top.equalTo(bodyIntroAboutService.snp.bottom).offset(15)
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).offset(-20)
            $0.height.equalTo(330)
        }
        bottomPhotoView.snp.makeConstraints {
            $0.top.equalTo(bodyReviewView.snp.bottom).offset(25)
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).offset(-20)
            $0.height.equalTo(200)
            $0.bottom.equalToSuperview().inset(45)
        }
    }
}

// MARK: - Network

extension TrainerDetailViewController {
    func postHeartServer(trainerIndex:Int) {
        CustomerAPI.shared.postAddHeartAPI(trainerIndex: trainerIndex) { response in
            guard let postHeartResponse = response?.result else { return }
            print(postHeartResponse)
        }
    }
    func deleteHeartServer(trainerIndex:Int) {
        CustomerAPI.shared.deleteHeartAPI(trainerIndex: trainerIndex) { response in
            guard let deleteHeartResponse = response?.result else { return }
            print(deleteHeartResponse)
        }
    }
    func getHeartListServer(){
        print("getHeartList")
        MyPageAPI.shared.getHeartListAPI{ response in
            guard let heartListResponse = response?.result else { return }
            HeartListViewController.heartList = heartListResponse
            TrainerDetailViewController.trainerHeartList = heartListResponse
        }
    }
}
