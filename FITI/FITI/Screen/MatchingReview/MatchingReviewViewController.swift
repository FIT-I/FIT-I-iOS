//
//  MatchingReviewViewController.swift
//  FITI
//
//  Created by 여진홍 on 2023/02/01.
//

import Foundation
import UIKit
import SnapKit
import Then

class MatchingReviewViewController: UIViewController {
    
    //MARK: - UI Components
    // 상단 제목
    private lazy var reviewLabel: UILabel = {
        let label = UILabel()
        label.text = "매칭 후기 남기기"
        label.textColor = UIColor.customColor(.blue)
        label.font = UIFont(name: "Noto Sans", size: 20.0)
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        return label
    }()

    // 상단 회색 바
    private lazy var rectView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.customColor(.boxGray)
        return view
    }()

    // textview
    private var reviewTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.backgroundColor = UIColor.customColor(.boxGray)
        textView.textColor = UIColor.customColor(.blue)
        textView.layer.cornerRadius = 8
        textView.isEditable = true
        textView.isScrollEnabled = false
        textView.font = UIFont.systemFont(ofSize: 15.0)
        textView.textContainerInset =  UIEdgeInsets(top: 0, left: 22, bottom: 10, right: 22)
        textView.text = "친절하고 운동도 잘 알려주셨어요. 감사합니다.:)"

        return textView
    }()
    
    // tool Bar 고정
    private lazy var toolBarContainerView : UIView = {
        let view = UIView()
        return view
    }()

    // 작성완료 버튼
    private lazy var requestButton : UIButton = {
        let btn = UIButton()
        btn.backgroundColor = UIColor.customColor(.blue)
        btn.layer.cornerRadius = 10
        btn.setTitle("작성완료", for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 20, weight: .medium)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.layer.borderWidth = 1
        btn.layer.borderColor = UIColor.customColor(.blue).cgColor
        btn.addTarget(self, action: #selector(requestButtonTouched), for: .touchUpInside)
        return btn
    }()
    
    // 스크롤 뷰
    private lazy var contentScrollView = UIScrollView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .white
        $0.showsVerticalScrollIndicator = true

    }

    let matchingReview = MatchingReview()

    
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.topItem?.title = ""
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image:UIImage(named: "leftIcon.svg"), style: .plain, target: self, action: #selector(backTapped))
        
        setMRLayout()
        setMRViewLayer()
        self.dismissKeyboard()
    
    }
    
    func setMRLayout() {
        
        view.addSubviews(contentScrollView, toolBarContainerView)
        toolBarContainerView.addSubview(requestButton)
        contentScrollView.addSubviews(reviewLabel, rectView, matchingReview, reviewTextView)
        
       
//        view.addSubview(requestButton)
//        view.addSubview(reviewLabel)
//        view.addSubview(rectView)
//        view.addSubview(matchingReview)
//        view.addSubview(reviewTextView)
//        view.addSubview(requestButton)
       
        
        view.backgroundColor = .systemBackground
        matchingReview.backgroundColor = UIColor.customColor(.boxGray)
        toolBarContainerView.backgroundColor = .systemBackground

    }
    
    func setMRViewLayer() {
        matchingReview.layer.cornerRadius = 8
        requestButton.snp.makeConstraints { make in
            make.height.equalTo(50)
         //   make.top.equalTo(reviewTextView.snp.bottom).offset(5)
            make.bottom.equalToSuperview().offset(-25)
      //      make.leading.equalTo(view.safeAreaLayoutGuide).offset(15)
            make.leading.equalToSuperview().offset(15)
      //      make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-15)
            make.trailing.equalToSuperview().offset(-15)
        }
        
        toolBarContainerView.snp.makeConstraints {
            $0.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(64)
        }
        
        //MARK: - scrollViewLayout
        contentScrollView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.equalTo(toolBarContainerView.snp.top)
        }
        
        // MARK: - containerViewLayout
        
        reviewLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.centerX.equalToSuperview()
        }

        rectView.snp.makeConstraints {
            $0.top.equalTo(reviewLabel.snp.bottom).offset(18)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(5)
        }

        matchingReview.snp.makeConstraints {
            $0.top.equalTo(rectView.snp.bottom).offset(40)
         //   $0.top.equalToSuperview().offset(170)
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(15)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).offset(-15)
            $0.height.equalTo(160)
        }

        reviewTextView.snp.makeConstraints {
            $0.top.equalTo(matchingReview.snp.bottom).offset(-30)
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(15)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).offset(-15)
          //  $0.bottom.equalTo(requestButton.snp.top).offset(-20)
            $0.bottom.equalToSuperview().inset(45)
        }
        
        
    }
    
    
    // MARK: - @objc func

    @objc func backTapped(sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func requestButtonTouched(){
    //    let nextVC =
    //    navigationController?.pushViewController(nextVC, animated: true)
    }


}


