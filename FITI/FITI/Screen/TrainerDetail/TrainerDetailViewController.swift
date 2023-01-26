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
    
    var isHeartFull : Bool = false
    
    //MARK: - UI Components
    
    // 상단 뷰
    var topView : UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "blueScreen.svg")
        return imgView
    }()
    
    // 네비 뷰
    private let toolBarContainerView : UIView = {
        let view = UIView()
        return view
    }()
    
    private let matchingRequest : UIButton = {
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
    
    private let heartBtn : UIButton = {
        let btn = UIButton()
        btn.backgroundColor = UIColor.systemBackground
        btn.layer.cornerRadius = 8
        btn.setImage(UIImage(named: "heart"), for: .normal)
        btn.layer.borderWidth = 1
        btn.layer.borderColor = UIColor.customColor(.blue).cgColor
        btn.addTarget(self, action: #selector(heartTouchEvent), for: .touchUpInside)
        return btn
    }()
    
    
    // 스크롤 뷰
    private lazy var contentScrollView = UIScrollView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .white
        $0.showsVerticalScrollIndicator = true
    }
    
    //MARK: -
    let headView = HeadView()
    
    // 관리 비용
    let bodyPriceView = BodyPriceView()
    
    // 소개 글 목차 뷰
    let bodyIntroView = BodyIntroView()

    // 서비스 줄거리
    let bodyIntroAboutService = BodyIntroAboutServiceView()
    
    // 리뷰
    let bodyReviewView = BodyReviewView()

    // 사진 뷰
    let bottomPhotoView = BottomPhotoView()
    
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.topItem?.title = ""
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image:UIImage(named: "leftIcon.svg"), style: .plain, target: self, action: #selector(backTapped))
        
        setButtonEvent()
        setViewLayer()
        setLayout()
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
        if isHeartFull == false {
            self.isHeartFull = true
            self.heartBtn.setImage(UIImage(named: "heart.fill.svg"), for: .normal)
        }else{
            self.isHeartFull = false
            self.heartBtn.setImage(UIImage(named: "heart.svg"), for: .normal)
        }
    }
}

//MARK: - Extension

extension TrainerDetailViewController {
    
    //MARK: - setLayout
    
    func setLayout() {
        
        //MARK: addSubViews
        view.addSubviews(contentScrollView, toolBarContainerView)
        toolBarContainerView.addSubviews(heartBtn,matchingRequest)
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
        
        // testColors
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
        
        heartBtn.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.bottom.equalToSuperview().offset(-10)
            make.leading.equalToSuperview().offset(16)
            make.width.equalTo(50)
        }

        matchingRequest.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.bottom.equalToSuperview().offset(-10)
            make.leading.equalTo(heartBtn.snp.trailing).offset(10)
            make.trailing.equalToSuperview().offset(-14)
        }

        
        //MARK: - scrollViewLayout
        contentScrollView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.equalTo(toolBarContainerView.snp.top)
        }
        
        //MARK: - containerViewLayout
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
            $0.height.equalTo(130)
        }
        
        bodyIntroView.snp.makeConstraints {
            $0.top.equalTo(bodyPriceView.snp.bottom).offset(25)
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).offset(-20)
            $0.height.equalTo(180)
        }
        
        bodyIntroAboutService.snp.makeConstraints {
            $0.top.equalTo(bodyIntroView.snp.bottom).offset(25)
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).offset(-20)
            $0.height.equalTo(270)
        }
        
        bodyReviewView.snp.makeConstraints {
            $0.top.equalTo(bodyIntroAboutService.snp.bottom).offset(25)
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).offset(-20)
            $0.height.equalTo(350)
        }

        bottomPhotoView.snp.makeConstraints {
            $0.top.equalTo(bodyReviewView.snp.bottom).offset(25)
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).offset(-20)
            $0.height.equalTo(200)
            $0.bottom.equalToSuperview()
        }

    }
}
