//
//  SignInViewController.swift
//  FITI
//
//  Created by 홍준혁 on 2023/01/01.
//

import UIKit
import SnapKit

class SignInViewController: UIViewController {

    private let titleLabel : UILabel = {
        let label = UILabel()
        label.text = "CUSTOMER LOG_IN"
        label.textColor = UIColor.customColor(.blue)
        label.font = UIFont(name: "Noto Sans", size: 24)
        label.font = UIFont.boldSystemFont(ofSize: 25)
        return label
    }()
    
    let idTextField : UITextField = {
        let tf = UITextField()
        tf.placeholder = ("아이디")
        tf.font = UIFont(name: "Noto Sans", size: 3)
        tf.layer.cornerRadius = 4
        tf.borderStyle = .roundedRect
        return tf
    }()
    
    let passwordTextField : UITextField = {
        let tf = UITextField()
        tf.placeholder = ("비밀번호")
        tf.font = UIFont(name: "Noto Sans", size: 14)
        tf.layer.cornerRadius = 4
        tf.borderStyle = .roundedRect
        return tf
    }()
    
    private let stackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .fill
        return stackView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        // Do any additional setup after loading the view.
        
        signInViewAddUI()
        signInViewSetUI()
    }
    
    func signInViewAddUI(){
        stackView.addArrangedSubview(idTextField)
        stackView.addArrangedSubview(passwordTextField)
        
        view.addSubview(titleLabel)
        view.addSubview(stackView)
    }
    
    func signInViewSetUI(){
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(200)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-100)
        }
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(27)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        
    }
    


}
