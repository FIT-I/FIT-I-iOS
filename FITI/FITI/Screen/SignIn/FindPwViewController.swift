//
//  FindPwViewController.swift
//  FITI-Trainer-iOS
//
//  Created by 박윤빈 on 2023/01/11.
//

import UIKit

import SnapKit

class FindPwViewController: UIViewController {
    
    var isAllTrue = [false,false]
    
    var AuthCodeFromServer = String()
    
    var titleLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.text = "비밀번호 찾기"
        label.textColor = UIColor.customColor(.blue)
        return label
    }()
    
    private let emailTextField : UITextField = {
        let tf = UITextField()
        
        tf.attributedPlaceholder = NSAttributedString(
                    string: "이메일을 입력해주세요.",
                    attributes: [NSAttributedString.Key.foregroundColor: UIColor.customColor(.gray)]
                )
        tf.layer.borderColor = UIColor.customColor(.gray).cgColor
        tf.layer.borderWidth = 2
        tf.layer.cornerRadius = 10
        tf.font = UIFont.systemFont(ofSize: 20)
        tf.textColor = UIColor.customColor(.blue)
        tf.setLeftPaddingPoints(10)
        return tf
    }()
    
    private let authTextField : UITextField = {
        let tf = UITextField()
        tf.isHidden = true
        tf.layer.borderColor = UIColor.customColor(.gray).cgColor
        tf.layer.borderWidth = 2
        tf.layer.cornerRadius = 10
        tf.font = UIFont.systemFont(ofSize: 20)
        tf.textColor = UIColor.customColor(.blue)
        tf.setLeftPaddingPoints(10)
        return tf
    }()
    
    private let warningLabelForEmail : UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont.systemFont(ofSize: 10)
        return label
    }()
    
    private let warningLabelForAuth : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10)
        label.text = ""
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
    
    let nextButton : UIButton = {
           let btn = UIButton()
            btn.backgroundColor = UIColor.customColor(.gray)
            btn.setTitle("인증코드 받기", for: .normal)
            btn.setTitleColor(UIColor.white, for: .normal)
            btn.titleLabel?.font = UIFont(name: "Noto Sans", size: 0)
            btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
            btn.layer.cornerRadius = 10
            btn.addTarget(self, action: #selector(touchNextBtnEvent), for: .touchUpInside)
            return btn
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.topItem?.title = ""
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image:UIImage(named: "leftIcon.svg"), style: .plain, target: self, action: #selector(backTapped))
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleEmailTfDidChange(_:)), name: UITextField.textDidChangeNotification, object: emailTextField)
        NotificationCenter.default.addObserver(self, selector: #selector(handleAuthTfDidChange(_:)), name: UITextField.textDidChangeNotification, object: authTextField)
        
        // Do any additional setup after loading the view.
        setViewHierarchy()
        setConstraints()
        
        self.dismissKeyboard()

    }

    private func setViewHierarchy() {
        
        view.addSubview(titleLabel)
        view.addSubview(progressView)
        progressView.addSubview(grayView)
        view.addSubview(emailTextField)
        view.addSubview(authTextField)
        view.addSubview(nextButton)
        view.addSubview(warningLabelForAuth)
        view.addSubview(warningLabelForEmail)
    }
    
    private func setConstraints(){
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(70)
            make.centerX.equalToSuperview()
        }
        
        progressView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(11)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        grayView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.width.equalToSuperview().dividedBy(2)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(progressView.snp.bottom).offset(68)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(52)
        }
        
        warningLabelForEmail.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(3)
            make.leading.equalTo(emailTextField).offset(10)
        }
        
        authTextField.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(52)
        }
        
        warningLabelForAuth.snp.makeConstraints { make in
            make.top.equalTo(authTextField.snp.bottom).offset(3)
            make.leading.equalTo(authTextField).offset(10)
        }
    
        nextButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-50)
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(-15)
            make.height.equalTo(60)
        }
    
    }
    
    @objc func backTapped(sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
    
    @objc func touchNextBtnEvent() {
        
        if(isAllTrue[1]){
            if self.AuthCodeFromServer == authTextField.text {
                self.getPasswordServer(email: self.emailTextField.text ?? "")
            }else {
                self.showToast(message: "인증번호가 틀렸습니다.")
            }
        } else if(isAllTrue[0]){
            self.sendEmailServer(email: self.emailTextField.text ?? "")
            self.emailTextField.isUserInteractionEnabled = false
            warningLabelForEmail.text = "이메일 주소 수정이 불가합니다."
            authTextField.isHidden = false
            nextButton.backgroundColor = UIColor.customColor(.gray)
            nextButton.setTitle("완료", for: .normal)
            self.grayView.snp.remakeConstraints({ make in
                make.trailing.equalToSuperview()
                make.height.equalTo(5)
                make.width.equalToSuperview().dividedBy(2)
            })
                        
            UIView.animate(withDuration: 0.5, animations: {
                self.view.layoutIfNeeded()
            }, completion: nil)
        }
    }
    
    @objc func handleAuthTfDidChange(_ notification: Notification) {
        if let textField = notification.object as? UITextField {
            if let text = textField.text {
                if text.count < 6  {
                    warningLabelForAuth.text = "6자리를 입력해주세요"
                    warningLabelForAuth.textColor = .red
                    authTextField.layer.borderColor = UIColor.red.cgColor
                    self.isAllTrue[1] = false
                }else if(text.count == 6){
                    warningLabelForAuth.text = ""
                    warningLabelForAuth.textColor = .clear
                    authTextField.layer.borderColor = UIColor.customColor(.blue).cgColor
                    nextButton.backgroundColor = UIColor.customColor(.blue)
                    self.isAllTrue[1] = true
                }else{
                    warningLabelForAuth.text = "6자리를 입력해주세요"
                    warningLabelForAuth.textColor = .red
                    authTextField.layer.borderColor = UIColor.red.cgColor
                    self.isAllTrue[1] = false
                }
            }
        }
    }
    
    @objc func handleEmailTfDidChange(_ notification: Notification) {
        if let textField = notification.object as? UITextField {
            if let text = textField.text {
                if text.count < 1  {
                    warningLabelForEmail.text = "이메일을 입력해주세요."
                    warningLabelForEmail.textColor = .red
                    emailTextField.layer.borderColor = UIColor.red.cgColor

                    self.isAllTrue[0] = false
                }else{
                    if checkEmail(str: text) == false {
                        warningLabelForEmail.text = "올바르지 않은 이메일 형식입니다."
                        warningLabelForEmail.textColor = .red
                        emailTextField.layer.borderColor = UIColor.red.cgColor

                        self.isAllTrue[0] = false
                    }
                    else {
                        warningLabelForEmail.text = "올바른 이메일 형식입니다."
                        warningLabelForEmail.textColor = UIColor.customColor(.green)
                        emailTextField.layer.borderColor = UIColor.customColor(.blue).cgColor
                        nextButton.backgroundColor = UIColor.customColor(.blue)

                        self.isAllTrue[0] = true
                    }
                }
            }
        }
    }
    
    //이메일 형식 검사 함수 - true || false 반환
    func checkEmail(str: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        return  NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: str)
    }
    
    func showExceptionNotification(description:String){
        let alertController = UIAlertController(
            title: description,
            message: "다시 시도해주세요.",
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "확인", style: .destructive) { _ in
            self.dismiss(animated: true)
        }
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func showFindPasswordSuccessNotification(description:String){
        let alertController = UIAlertController(
            title: description,
            message: "로그인 페이지로 이동",
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "확인", style: .default) { _ in
            let nextVC = SignInViewController()
            self.navigationController?.pushViewController(nextVC, animated: true)
        }
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func showEmailSuccessNotification(){
        let alertController = UIAlertController(
            title: "이메일 전송",
            message: "이메일을 확인하고 인증코드를 입력해주세요.",
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "확인", style: .default) { _ in
            self.dismiss(animated: true)
        }
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func showToast(message : String, font: UIFont = UIFont.systemFont(ofSize: 14.0)) {
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height-170, width: 150, height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.font = font
        toastLabel.textAlignment = .center;
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 10.0, delay: 0.1, options: .curveEaseOut, animations: {
             toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
}

extension FindPwViewController {
    func sendEmailServer(email:String){
        SignAPI.shared.sendEmailAPI(email: email){ response in
            guard let sendEmailResponse = response else { return }
            if sendEmailResponse.isSuccess == false {
                self.showExceptionNotification(description: sendEmailResponse.message)
                self.emailTextField.isUserInteractionEnabled = true
            }else {
                self.showEmailSuccessNotification()
                self.AuthCodeFromServer = sendEmailResponse.result ?? ""
            }
        }
    }
    
    func getPasswordServer(email:String){
        SignAPI.shared.getPasswordAPI(email: email){ response in
            guard let getPasswordResponse = response else { return }
            if getPasswordResponse.isSuccess == false {
                self.showExceptionNotification(description: getPasswordResponse.message)
                self.emailTextField.isUserInteractionEnabled = true
            }else {
                self.showFindPasswordSuccessNotification(description: getPasswordResponse.result ?? "")
            }
        }
    }
}
