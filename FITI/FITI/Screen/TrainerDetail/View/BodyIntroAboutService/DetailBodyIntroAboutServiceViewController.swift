//
//  DetailBodyIntroAboutServiceViewController.swift
//  FITI
//
//  Created by 홍준혁 on 2023/01/18.
//

import Foundation
import UIKit
import SnapKit

class DetailBodyIntroAboutServiceViewController: UIViewController {
    
    //MARK: - UI Components

    private var introTextView : UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
//        textView.backgroundColor = UIColor.customColor(.boxGray)
        textView.textColor = UIColor.customColor(.darkGray)
        textView.layer.cornerRadius = 16
        textView.isEditable = true
        textView.isScrollEnabled = false
        textView.font = UIFont.systemFont(ofSize: 15.0)
        textView.textContainerInset =  UIEdgeInsets(top: 0, left: 18, bottom: 10, right: 18)
        return textView
    }()
    private lazy var contentScrollView = UIScrollView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .white
        $0.showsVerticalScrollIndicator = true
    }
    let aboutService = DetailBodyIntroAboutServiceView()
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.systemBackground
        
        setIntroLayout()
        setViewLayer()
        setNavigationController()
        self.dismissKeyboard()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setData()
    }
    
    func setIntroLayout() {
        contentScrollView.addSubviews(aboutService,introTextView)
        view.addSubview(contentScrollView)
        view.backgroundColor = .systemBackground
//        aboutService.backgroundColor = UIColor.customColor(.boxGray)
//        introTextView.backgroundColor = UIColor.customColor(.boxGray)
    }
    
    func setViewLayer() {
        aboutService.layer.cornerRadius = 16
        contentScrollView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.bottom.equalToSuperview()
        }
        aboutService.snp.makeConstraints {
            $0.top.equalToSuperview().offset(30)
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(15)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).offset(-15)
            $0.height.equalTo(150)
        }
        introTextView.snp.makeConstraints {
            $0.top.equalTo(aboutService.snp.bottom).offset(-95)
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(15)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).offset(-15)
            $0.bottom.equalToSuperview().offset(-20)
        }
    }
    
    // MARK: - @objc
    
    @objc func backTapped(sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Func
    
    func setData(){
        introTextView.text = TrainerDetailViewController.specificTrainer.service
    }
    func setNavigationController(){
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.topItem?.title = ""
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image:UIImage(named: "leftIcon.svg"), style: .plain, target: self, action: #selector(backTapped))
    }
}
