//
//  MatchingReviewViewController.swift
//  FITI
//
//  Created by 홍준혁 on 2023/02/04.
//

import Foundation
import UIKit
import SnapKit
import Then

class MatchingReviewViewController: UIViewController {

    static var tainerId = Int()
    private var reviewSheet = WriteReviewRequest()
    
    //MARK: - UI Components

    private lazy var reviewLabel: UILabel = {
        let label = UILabel()
        label.text = "매칭 후기 남기기"
        label.textColor = UIColor.customColor(.blue)
        label.font = UIFont(name: "Noto Sans", size: 20.0)
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        return label
    }()
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
        textView.textContainer.maximumNumberOfLines = 10
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
        
        reviewTextView.delegate = self
        //처음 화면이 로드되었을 때 플레이스 홀더처럼 보이게끔 만들어주기
        reviewTextView.text = "후기를 작성해주세요. 10줄 내로 작성해주세요."
        reviewTextView.textColor = UIColor.lightGray

        setMRLayout()
        setMRViewLayer()
        self.dismissKeyboard()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.reviewSheet = WriteReviewRequest()
        print(MatchingReviewViewController.tainerId)
    }

    func setMRLayout() {

        view.addSubviews(contentScrollView, toolBarContainerView)
        toolBarContainerView.addSubview(requestButton)
        contentScrollView.addSubviews(reviewLabel, rectView, matchingReview, reviewTextView)
        view.backgroundColor = .systemBackground
        matchingReview.backgroundColor = UIColor.customColor(.boxGray)
        toolBarContainerView.backgroundColor = .systemBackground
    }

    func setMRViewLayer() {
        matchingReview.layer.cornerRadius = 8
        requestButton.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.bottom.equalToSuperview().offset(-25)
            make.leading.equalToSuperview().offset(15)
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
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(15)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).offset(-15)
            $0.height.equalTo(160)
        }

        reviewTextView.snp.makeConstraints {
            $0.top.equalTo(matchingReview.snp.bottom)
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(15)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).offset(-15)
            $0.height.equalTo(210)
        }
    }


    // MARK: - @objc func
    @objc func backTapped(sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }

    @objc func requestButtonTouched(){
        self.reviewSheet.grade = self.matchingReview.rateView.currentStar
        self.reviewSheet.contents = self.reviewTextView.text
        self.reviewSheet.trainerIdx = MatchingReviewViewController.tainerId
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.1) {
            self.postReviewServer(body: self.reviewSheet)
        }
    }
    
    // MARK: - func
    
    func successAlert(message:String){
        let alert = UIAlertController(title: "리뷰 작성", message: message, preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "확인", style: .default, handler: { okAction in
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.1) {
                self.navigationController?.popViewController(animated: true)
            }
        })
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    func failAlert(message:String){
        let alert = UIAlertController(title: "리뷰 작성 실패", message: message, preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "확인", style: .default, handler: { okAction in
        })
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
}

extension MatchingReviewViewController: UITextViewDelegate {
    func textViewDidEndEditing(_ textView: UITextView) {
        if reviewTextView.text.isEmpty {
            reviewTextView.text =  "후기를 작성해주세요."
            reviewTextView.textColor = UIColor.lightGray
        }
    }
    func textViewDidBeginEditing(_ textView: UITextView) {
        if reviewTextView.textColor == UIColor.lightGray {
            reviewTextView.text = nil
            reviewTextView.textColor = UIColor.black
        }
    }
}

// MARK: - Network

extension MatchingReviewViewController {
    func postReviewServer(body: WriteReviewRequest){
        CustomerAPI.shared.postReviewAPI(body: body){ response in
            guard let postReviewResponse = response?.message else {return}
            self.successAlert(message: postReviewResponse)
        }
    }
}
