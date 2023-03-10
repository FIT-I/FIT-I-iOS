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
    
    private lazy var reviewTableView = UITableView().then {
        $0.backgroundColor = .clear
        $0.separatorStyle = .none
        $0.dataSource = self
        $0.delegate = self
    }

    // 사진 뷰
    let bottomPhotoView = BottomPhotoView()
    
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.topItem?.title = ""
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image:UIImage(named: "leftIcon.svg"), style: .plain, target: self, action: #selector(backTapped))
        
        setButtonEvent()
        setLayout()
//        register()
    }
    
    func setButtonEvent(){
        bodyReviewView.reviewDetailBtn.addTarget(self, action: #selector(moveToReviewTableView), for: .touchUpInside)
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

extension BookDetailVC {
    
    //MARK: - register
    
    private func register() {
        reviewTableView.register(BookReviewTableViewCell.self,
                                 forCellReuseIdentifier: BookReviewTableViewCell.identifier
        )
    }
    
    //MARK: - setLayout
    
    func setLayout() {
        
        //MARK: addSubViews
        view.addSubviews(contentScrollView, toolBarContainerView)
        toolBarContainerView.addSubviews(heartBtn,matchingRequest)
        contentScrollView.addSubviews(
            headView,
            bodyPriceView,
            bodyIntroView,
            bodyIntroAboutService,
            bodyReviewView,
            reviewTableView,
            bottomPhotoView
        )
        
        //MARK: - naviViewLayout
        
        // testColors
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
//            make.top.equalToSuperview()
            make.height.equalTo(50)
            make.bottom.equalToSuperview().offset(-10)
            make.leading.equalToSuperview().offset(16)
            make.width.equalTo(50)
        }

        matchingRequest.snp.makeConstraints { make in
//            make.top.equalToSuperview()
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
        headView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(120)
        }
        
        bodyPriceView.snp.makeConstraints {
            $0.top.equalTo(headView.snp.bottom).offset(25)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(110)
        }
        
        bodyIntroView.snp.makeConstraints {
            $0.top.equalTo(bodyPriceView.snp.bottom).offset(25)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(130)
        }
        
        bodyIntroAboutService.snp.makeConstraints {
            $0.top.equalTo(bodyIntroView.snp.bottom).offset(25)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(170)
        }
        
        bodyReviewView.snp.makeConstraints {
            $0.top.equalTo(bodyIntroAboutService.snp.bottom).offset(25)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(10)
        }
//        reviewTableView.snp.makeConstraints {
//            $0.top.equalTo(bodyReviewView.snp.bottom).offset(15)
////            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
//            $0.leading.trailing.equalToSuperview()
//            $0.height.equalTo(282)
//        }
        
        bottomPhotoView.snp.makeConstraints {
            $0.top.equalTo(bodyReviewView.snp.bottom).offset(25)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(283)
            $0.bottom.equalToSuperview()
        }

    }
}

//MARK: - ReviewTableView Delegate
extension TrainerDetailViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reviewDummy.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let reviewCell = tableView.dequeueReusableCell(withIdentifier: BookReviewTableViewCell.identifier, for: indexPath) as? BookReviewTableViewCell else { return UITableViewCell() }
        
        reviewCell.dataBind(model: reviewDummy[indexPath.row])
        reviewCell.selectionStyle = .none
        return reviewCell
    }
}

extension TrainerDetailViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 87
    }
}
