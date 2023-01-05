//
//  TrainerCertifyViewController.swift
//  FITI
//
//  Created by 박윤빈 on 2023/01/04.
//

import Foundation
import UIKit
import SnapKit

class TrainerCertifyViewController: UIViewController {
    
    private let titleLabel : UILabel = {
        let label = UILabel()
        label.text = "트레이너 인증"
        label.textColor = UIColor.customColor(.blue)
        label.font = UIFont(name: "Noto Sans", size: 24)
        label.font = UIFont.boldSystemFont(ofSize: 24)
        return label
    }()
    
    private let Label1 : UILabel = {
        let label = UILabel()
        label.text = "트레이너 인증을 위해 아래 항목을 기입해주세요!"
        label.textColor = UIColor.customColor(.blue)
        label.font = UIFont(name: "Noto Sans", size: 16)
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    let schoolTextField : UITextField = {
        let tf = UITextField()
        
        //placeholder 색 지정
        tf.attributedPlaceholder = NSAttributedString(
            string: "재학/졸업한 학교를 입력해주세요",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.customColor(.skyblue2)]
        )
        
        tf.font = UIFont.boldSystemFont(ofSize: 16)

        return tf
    }()

    let yearButton : UIButton = {
       let btn = UIButton()
        btn.backgroundColor = UIColor.customColor(.skyblue1)
        btn.setTitle("입학년도 선택", for: .normal)
        btn.setTitleColor(UIColor.customColor(.blue), for: .normal)
        btn.titleLabel?.font = UIFont(name: "Noto Sans", size: 0)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        btn.layer.cornerRadius = 4

        return btn
    }()
    
    let majorTextField : UITextField = {
        let tf = UITextField()
        
        //placeholder 색 지정
        tf.attributedPlaceholder = NSAttributedString(
            string: "전공을 기입해주세요",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.customColor(.skyblue2)]
        )
        
        tf.font = UIFont.boldSystemFont(ofSize: 16)

        return tf
    }()
    
    let mailTextField : UITextField = {
        let tf = UITextField()
        
        //placeholder 색 지정
        tf.attributedPlaceholder = NSAttributedString(
            string: "학교 메일 주소를 입력해주세요",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.customColor(.skyblue2)]
        )
        
        tf.font = UIFont.boldSystemFont(ofSize: 16)

        return tf
    }()
    
    let authMailButton : UIButton = {
       let btn = UIButton()
        btn.backgroundColor = UIColor.customColor(.blue)
        btn.setTitle("인증번호 발송", for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.titleLabel?.font = UIFont(name: "Noto Sans", size: 0)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        btn.layer.cornerRadius = 4

        return btn
    }()
    
    let checkTextField : UITextField = {
        let tf = UITextField()
        
        //placeholder 색 지정
        tf.attributedPlaceholder = NSAttributedString(
            string: "메일로 발송된 인증번호를 입력해주세요",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.customColor(.skyblue2)]
        )
        
        tf.font = UIFont.boldSystemFont(ofSize: 16)

        return tf
    }()
    
    let checkButton : UIButton = {
       let btn = UIButton()
        btn.backgroundColor = UIColor.customColor(.blue)
        btn.setTitle("확인", for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.titleLabel?.font = UIFont(name: "Noto Sans", size: 0)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        btn.layer.cornerRadius = 4

        return btn
    }()
    
    let backButton : UIButton = {
       let btn = UIButton()
        btn.backgroundColor = UIColor.customColor(.blue)
        btn.setTitle("돌아가기", for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.titleLabel?.font = UIFont(name: "Noto Sans", size: 0)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        btn.layer.cornerRadius = 8

        return btn
    }()
    
    let nextButton : UIButton = {
       let btn = UIButton()
        btn.backgroundColor = UIColor.customColor(.blue)
        btn.setTitle("다음", for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.titleLabel?.font = UIFont(name: "Noto Sans", size: 0)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        btn.layer.cornerRadius = 8

        return btn
    }()
    
    lazy var bottomStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [backButton,nextButton])
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        
        return stackView
    }()
 
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        signInViewAddUI()
        signInViewSetUI()
        
    }
    
    override func viewDidLayoutSubviews() {

        let school = CALayer()
        let major = CALayer()
        let mail = CALayer()
        let check = CALayer()
        
        
        school.frame = CGRect(x: 0, y: schoolTextField.frame.size.height+12, width: schoolTextField.frame.width, height: 1)
        school.backgroundColor = UIColor.customColor(.blue).cgColor
        schoolTextField.layer.addSublayer(school)
        
        major.frame = CGRect(x: 0, y: majorTextField.frame.size.height+12, width: majorTextField.frame.width, height: 1)
        major.backgroundColor = UIColor.customColor(.blue).cgColor
        majorTextField.layer.addSublayer(major)
        
        mail.frame = CGRect(x: 0, y: mailTextField.frame.size.height+12, width: mailTextField.frame.width, height: 1)
        mail.backgroundColor = UIColor.customColor(.blue).cgColor
        mailTextField.layer.addSublayer(mail)
        
        check.frame = CGRect(x: 0, y: checkTextField.frame.size.height+12, width: checkTextField.frame.width, height: 1)
        check.backgroundColor = UIColor.customColor(.blue).cgColor
        checkTextField.layer.addSublayer(check)
        
    }
    
    func signInViewAddUI(){
        view.addSubview(titleLabel)
        view.addSubview(Label1)
        view.addSubview(schoolTextField)
        view.addSubview(yearButton)
        view.addSubview(majorTextField)
        view.addSubview(mailTextField)
        view.addSubview(authMailButton)
        view.addSubview(checkTextField)
        view.addSubview(checkButton)
        view.addSubview(bottomStackView)
    }
    
    func signInViewSetUI(){
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(70)
            make.height.equalTo(33)
            make.centerX.equalToSuperview()
        }
        
        Label1.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(49)
            make.height.equalTo(22)
            make.centerX.equalToSuperview()
        }
        
        schoolTextField.snp.makeConstraints { make in
            make.top.equalTo(Label1.snp.bottom).offset(50)
            make.height.equalTo(22)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalTo(yearButton.snp.leading).offset(-20)
            make.centerX.equalToSuperview()
        }
        
        yearButton.snp.makeConstraints { make in
            make.centerY.equalTo(schoolTextField.snp.centerY)
            make.height.equalTo(40)
            make.width.equalTo(94)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        majorTextField.snp.makeConstraints { make in
            make.top.equalTo(schoolTextField.snp.bottom).offset(50)
            make.height.equalTo(22)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.centerX.equalToSuperview()
        }
        
        mailTextField.snp.makeConstraints { make in
            make.top.equalTo(majorTextField.snp.bottom).offset(50)
            make.height.equalTo(22)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.centerX.equalToSuperview()
        }
        
        authMailButton.snp.makeConstraints { make in
            make.bottom.equalTo(mailTextField)
            make.height.equalTo(35)
            make.width.equalTo(100)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        checkTextField.snp.makeConstraints { make in
            make.top.equalTo(mailTextField.snp.bottom).offset(50)
            make.height.equalTo(22)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.centerX.equalToSuperview()
        }
        
        checkButton.snp.makeConstraints { make in
            make.bottom.equalTo(checkTextField)
            make.height.equalTo(35)
            make.width.equalTo(50)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        bottomStackView.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-52)
            make.height.equalTo(60)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
    }
}
