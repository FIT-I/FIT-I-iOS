//
//  TermsOfUseViewController.swift
//  FITI
//
//  Created by 박윤빈 on 2023/01/07.
//

import Foundation
import UIKit
import SnapKit

class TermsOfUseViewController: UIViewController {
    
    var titleLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20.0)
        label.text = "이용약관"
        label.textColor = UIColor.customColor(.blue)
        return label
    }()
    
    var progressView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.customColor(.boxGray)
        view.snp.makeConstraints { make in
            make.height.equalTo(5)
        }
        return view
    }()
    
    var grayView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.lightGray
        view.snp.makeConstraints { make in
            make.height.equalTo(5)
        }
        return view
    }()
    
    //welcome label
    private let weightImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named:"weight.svg")
        return imageView
    }()
    
    private let welcomLabel : UILabel = {
        let label = UILabel()
        label.text = "환영합니다!"
        label.textColor = UIColor.customColor(.blue)
        label.font = UIFont(name: "Noto Sans", size: 24)
        label.font = UIFont.boldSystemFont(ofSize: 24)
        
        return label
    }()
    
    private let welcomeStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 32
        stackView.alignment = .leading
        return stackView
    }()
    
    //약관 전체 동의 UI
    private let acceptAllLabel : UILabel = {
        let label = UILabel()
        label.text = "약관 전체동의"
        label.font = UIFont(name: "Noto Sans", size: 20)
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    private let acceptAllButton : UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "emptyCircle.svg"), for: .normal)
        btn.addTarget(self, action: #selector(selectBtnEvent), for: .touchUpInside)
        return btn
    }()
    
    private let lineStackView0 : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 12
        return stackView
    }()
    
    var underLineView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.customColor(.blue)
        view.snp.makeConstraints { make in
            make.height.equalTo(0.5)
        }
        return view
    }()
    
    //서비스 약관 동의 UI
    private let acceptLabel1 : UILabel = {
        let label = UILabel()
        label.text = "(필수) 서비스 이용약관 동의"
        label.font = UIFont(name: "Noto Sans", size: 16)
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    private let acceptButton1 : UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "emptyCircle.svg"), for: .normal)
        
        btn.addTarget(self, action: #selector(selectBtn1Event), for: .touchUpInside)
        return btn
    }()
    
    private let detailButton1 : UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "rightBtn.svg"), for: .normal)
        btn.addTarget(self, action: #selector(selectDetailBtn1Event), for: .touchUpInside)

        return btn
    }() //스택뷰에 넣지 말고 해당 라인이랑 centerx 똑같이 잡은 다음에, 슈퍼뷰랑 trailing 20으로 잡기
    
    private let lineStackView1 : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 12
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    //개인정보 약관 동의 UI
    private let acceptLabel2 : UILabel = {
        let label = UILabel()
        label.text = "(필수) 개인정보 처리 방침 동의"
        label.font = UIFont(name: "Noto Sans", size: 16)
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    private let acceptButton2 : UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "emptyCircle.svg"), for: .normal)
        btn.addTarget(self, action: #selector(selectBtn2Event), for: .touchUpInside)
        return btn
    }()
    
    private let detailButton2 : UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "rightBtn.svg"), for: .normal)
        btn.addTarget(self, action: #selector(selectDetailBtn2Event), for: .touchUpInside)

        return btn
    }() //스택뷰에 넣지 말고 해당 라인이랑 centerx 똑같이 잡은 다음에, 슈퍼뷰랑 trailing 20으로 잡기
    
    private let lineStackView2 : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 12
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    //전자금융거래 약관 동의 UI
    private let acceptLabel3 : UILabel = {
        let label = UILabel()
        label.text = "(필수) 전자금융거래 이용약관 동의"
        label.font = UIFont(name: "Noto Sans", size: 16)
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    private let acceptButton3 : UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "emptyCircle.svg"), for: .normal)
        btn.addTarget(self, action: #selector(selectBtn3Event), for: .touchUpInside)
        return btn
    }()
    
    private let detailButton3 : UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "rightBtn.svg"), for: .normal)
        btn.addTarget(self, action: #selector(selectDetailBtn3Event), for: .touchUpInside)
        return btn
    }() //스택뷰에 넣지 말고 해당 라인이랑 centerx 똑같이 잡은 다음에, 슈퍼뷰랑 trailing 20으로 잡기
    
    private let lineStackView3 : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 12
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    let nextButton : UIButton = {
        let btn = UIButton()
        btn.backgroundColor = UIColor.customColor(.blue)
        btn.setTitle("다음", for: .normal)
        btn.layer.cornerRadius = 8
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.titleLabel?.font = UIFont(name: "Noto Sans", size: 0)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
//        btn.layer.cornerRadius = 4
        return btn
    }()
    
    
    //상세보기 버튼 레이아웃이 기기 변경 때 깨질 것 같아서 스택뷰에 안 넣었는데, 스택뷰에 넣어도 뷰가 안깨지게 할 수 있나..?
//    private let acceptStackView : UIStackView = {
//        let stackView = UIStackView()
//        stackView.axis = .vertical
//        stackView.alignment = .leading
//        stackView.spacing = 52
//        return stackView
//    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.topItem?.title = ""
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image:UIImage(named: "leftIcon.svg"), style: .plain, target: self, action: #selector(backTapped))
        
        // Do any additional setup after loading the view.
        setViewHierarchy()
        setConstraints()
    }
    
    private func setViewHierarchy() {
        view.addSubview(titleLabel)
        view.addSubview(progressView)
        progressView.addSubview(grayView)
        
        welcomeStackView.addArrangedSubview(weightImageView)
        welcomeStackView.addArrangedSubview(welcomLabel)
        view.addSubview(welcomeStackView)
        
        lineStackView0.addArrangedSubview(acceptAllButton)
        lineStackView0.addArrangedSubview(acceptAllLabel)
        view.addSubview(lineStackView0)
        view.addSubview(underLineView)
        
        lineStackView1.addArrangedSubview(acceptButton1)
        lineStackView1.addArrangedSubview(acceptLabel1)
//        lineStackView1.addArrangedSubview(detailButton1)
        view.addSubview(lineStackView1)
        view.addSubview(detailButton1)

        
        lineStackView2.addArrangedSubview(acceptButton2)
        lineStackView2.addArrangedSubview(acceptLabel2)
//        lineStackView2.addArrangedSubview(detailButton2)
        view.addSubview(lineStackView2)
        view.addSubview(detailButton2)

        
        lineStackView3.addArrangedSubview(acceptButton3)
        lineStackView3.addArrangedSubview(acceptLabel3)
//        lineStackView3.addArrangedSubview(detailButton3)
        view.addSubview(lineStackView3)
        view.addSubview(detailButton3)

        
//        acceptStackView.addArrangedSubview(lineStackView1)
//        acceptStackView.addArrangedSubview(lineStackView2)
//        acceptStackView.addArrangedSubview(lineStackView3)

//        view.addSubview(acceptStackView)
        view.addSubview(nextButton)

    }
    
    private func setConstraints(){
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(70)
            make.centerX.equalToSuperview()
        }
        progressView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(38)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        grayView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.width.equalToSuperview().dividedBy(4)
        }
        
        welcomeStackView.snp.makeConstraints { make in
            make.top.equalTo(progressView.snp.bottom).offset(64)
            make.centerX.equalTo(grayView.snp.trailing)
        }
        
        lineStackView0.snp.makeConstraints { make in
            make.top.equalTo(welcomLabel.snp.bottom).offset(94)
            make.leading.equalToSuperview().offset(21)
        }
        
        underLineView.snp.makeConstraints { make in
            make.top.equalTo(lineStackView0.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        lineStackView1.snp.makeConstraints { make in
            make.top.equalTo(underLineView.snp.bottom).offset(32)
            make.leading.equalToSuperview().offset(21)
        }
        
        detailButton1.snp.makeConstraints { make in
            make.top.equalTo(lineStackView1)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        lineStackView2.snp.makeConstraints { make in
            make.top.equalTo(lineStackView1.snp.bottom).offset(52)
            make.leading.equalToSuperview().offset(21)
        }
        
        detailButton2.snp.makeConstraints { make in
            make.top.equalTo(lineStackView2)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        lineStackView3.snp.makeConstraints { make in
            make.top.equalTo(lineStackView2.snp.bottom).offset(52)
            make.leading.equalToSuperview().offset(21)
        }
        
        detailButton3.snp.makeConstraints { make in
            make.top.equalTo(lineStackView3)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        
//        acceptStackView.snp.makeConstraints { make in
//            make.top.equalTo(underLineView.snp.bottom).offset(32)
//            make.leading.equalToSuperview().offset(21)
//            make.trailing.equalToSuperview().offset(30)
//        }
        
        nextButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-21)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(50)
        }
        
    
    }
    
    @objc func backTapped(sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
    var count = 0
    var tapBtn = false
    var tapBtn1 = false
    var tapBtn2 = false
    var tapBtn3 = false

    @objc func selectBtn1Event(sender: UIBarButtonItem) {
        if(tapBtn1 == false){
            acceptButton1.setImage(UIImage(named: "check.fill.svg"), for: .normal)
            tapBtn1 = true
            count+=1
            
            //3개의 버튼 중 해당 버튼이 마지막으로 눌리는 버튼일 때(3개가 다 체크되는 순간, 전체 동의 버튼도 같이 체크되도록)
            if(count == 3){
                acceptAllButton.setImage(UIImage(named: "check.fill.svg"), for: .normal)
                tapBtn = true
            }
            
        } else{
            acceptButton1.setImage(UIImage(named: "emptyCircle.svg"), for: .normal)
            tapBtn1 = false
            count-=1
            
            //눌린 버튼이 3개에서 2개가 되는 순간, 전체동의 버튼 해제
            if(count == 2){
                acceptAllButton.setImage(UIImage(named: "emptyCircle.svg"), for: .normal)
                tapBtn = false
            }
            
        }
        
    }
    
    @objc func selectBtn2Event(sender: UIBarButtonItem) {
        if(tapBtn2 == false){
            acceptButton2.setImage(UIImage(named: "check.fill.svg"), for: .normal)
            tapBtn2 = true
            count+=1
            
            if(count == 3){
                acceptAllButton.setImage(UIImage(named: "check.fill.svg"), for: .normal)
                tapBtn = true
            }
            
        } else{
            acceptButton2.setImage(UIImage(named: "emptyCircle.svg"), for: .normal)
            tapBtn2 = false
            count-=1
            
            if(count == 2){
                acceptAllButton.setImage(UIImage(named: "emptyCircle.svg"), for: .normal)
                tapBtn = false
            }
        }
        
    }
    
    @objc func selectBtn3Event(sender: UIBarButtonItem) {
        if(tapBtn3 == false){
            acceptButton3.setImage(UIImage(named: "check.fill.svg"), for: .normal)
            tapBtn3 = true
            count+=1
            
            if(count == 3){
                acceptAllButton.setImage(UIImage(named: "check.fill.svg"), for: .normal)
                tapBtn = true
            }
            
        } else{
            acceptButton3.setImage(UIImage(named: "emptyCircle.svg"), for: .normal)
            tapBtn3 = false
            count-=1
            
            if(count == 2){
                acceptAllButton.setImage(UIImage(named: "emptyCircle.svg"), for: .normal)
                tapBtn = false
            }
        }
        
    }
    
    @objc func selectBtnEvent(sender: UIBarButtonItem) {
        if(tapBtn == false){
            acceptAllButton.setImage(UIImage(named: "check.fill.svg"), for: .normal)
            acceptButton1.setImage(UIImage(named: "check.fill.svg"), for: .normal)
            acceptButton2.setImage(UIImage(named: "check.fill.svg"), for: .normal)
            acceptButton3.setImage(UIImage(named: "check.fill.svg"), for: .normal)
            count = 3
            tapBtn = true
            tapBtn1 = true
            tapBtn2 = true
            tapBtn3 = true

        } else{
            acceptAllButton.setImage(UIImage(named: "emptyCircle.svg"), for: .normal)
            acceptButton1.setImage(UIImage(named: "emptyCircle.svg"), for: .normal)
            acceptButton2.setImage(UIImage(named: "emptyCircle.svg"), for: .normal)
            acceptButton3.setImage(UIImage(named: "emptyCircle.svg"), for: .normal)
            count = 0
            tapBtn = false
            tapBtn1 = false
            tapBtn2 = false
            tapBtn3 = false
        }
        
    }
    
    @objc func selectDetailBtn1Event(){
        let nextVC = serviceAcceptViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @objc func selectDetailBtn2Event(){
        let nextVC = privacyAcceptViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @objc func selectDetailBtn3Event(){
        let nextVC = financeAcceptViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    
}
