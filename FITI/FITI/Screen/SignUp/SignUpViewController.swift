//
//  MakeAccountViewController.swift
//  FITI
//
//  Created by 홍준혁 on 2023/01/11.
//

import UIKit

import SnapKit
import Moya

class SignUpViewController: UIViewController {
    
    // MARK: - Properties

    var isPwEyeBtnTap = false
    var isCheckEyeBtnTap = false
    var email = false
    var name = false
    var pw = false
    var pwCheck = false
    var isAllTrue = [false,false]
    
    // MARK: - UI Components
    
    var titleLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.text = "회원가입"
        label.textColor = UIColor.customColor(.blue)
        return label
    }()
    private lazy var nameTextField : UITextField = {
        let tf = UITextField()
        tf.attributedPlaceholder = NSAttributedString(
                    string: "이름을 입력해주세요.",
                    attributes: [NSAttributedString.Key.foregroundColor: UIColor.customColor(.gray)]
                )
        tf.layer.borderColor = UIColor.customColor(.gray).cgColor
        tf.layer.borderWidth = 1
        tf.layer.cornerRadius = 10
        tf.font = UIFont.systemFont(ofSize: 20)
        tf.textColor = UIColor.customColor(.blue)
        tf.setLeftPaddingPoints(10)
        tf.addTarget(self, action: #selector(nameTfDidChange), for: .editingChanged)
        return tf
    }()
    private lazy var emailTextField : UITextField = {
        let tf = UITextField()
        tf.attributedPlaceholder = NSAttributedString(
                    string: "이메일을 입력해주세요.",
                    attributes: [NSAttributedString.Key.foregroundColor: UIColor.customColor(.gray)]
                )
        tf.layer.borderColor = UIColor.customColor(.gray).cgColor
        tf.layer.borderWidth = 1
        tf.layer.cornerRadius = 10
        tf.font = UIFont.systemFont(ofSize: 20)
        tf.textColor = UIColor.customColor(.blue)
        tf.setLeftPaddingPoints(10)
        tf.addTarget(self, action: #selector(emailTfDidChange), for: .editingChanged)
        return tf
    }()
    private let warningLabelForEmail : UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont.systemFont(ofSize: 10)
        return label
    }()
    private lazy var pwTextField : UITextField = {
        let tf = UITextField()
        tf.attributedPlaceholder = NSAttributedString(
                    string: "비밀번호를 입력해주세요.",
                    attributes: [NSAttributedString.Key.foregroundColor: UIColor.customColor(.gray)]
                )
        tf.layer.borderColor = UIColor.customColor(.gray).cgColor
        tf.layer.borderWidth = 1
        tf.layer.cornerRadius = 10
        tf.font = UIFont.systemFont(ofSize: 20)
        tf.textColor = UIColor.customColor(.blue)
        tf.setLeftPaddingPoints(10)
        tf.isSecureTextEntry = true
        tf.addTarget(self, action: #selector(pwTfDidChange), for: .editingChanged)
        return tf
    }()
    private lazy var checkPwTextField : UITextField = {
        let tf = UITextField()
        tf.attributedPlaceholder = NSAttributedString(
                    string: "비밀번호를 확인해주세요.",
                    attributes: [NSAttributedString.Key.foregroundColor: UIColor.customColor(.gray)]
                )
        tf.layer.borderColor = UIColor.customColor(.gray).cgColor
        tf.layer.borderWidth = 1
        tf.layer.cornerRadius = 10
        tf.font = UIFont.systemFont(ofSize: 20)
        tf.textColor = UIColor.customColor(.blue)
        tf.isSecureTextEntry = true
        tf.setLeftPaddingPoints(10)
        tf.addTarget(self, action: #selector(pwCheckTfDidChange), for: .editingChanged)
        return tf
    }()
    private lazy var pwRuleLabel : UILabel = {
        let label = UILabel()
        label.text = "(특수문자 @, &, !, ?를 포함해 5자 이상으로 입력해주세요)"
        label.font = UIFont.systemFont(ofSize: 10)
        label.textColor = UIColor.customColor(.gray)
        return label
    }()
    private lazy var wrongPwLabel : UILabel = {
        let label = UILabel()
        label.text = "비밀번호가 일치하지 않습니다."
        label.font = UIFont.systemFont(ofSize: 10)
        label.textColor = UIColor.systemBackground
        
        return label
    }()
    private lazy var nextButton : UIButton = {
           let btn = UIButton()
            btn.backgroundColor = UIColor.customColor(.gray)
            btn.setTitle("다음", for: .normal)
            btn.setTitleColor(UIColor.white, for: .normal)
            btn.titleLabel?.font = UIFont(name: "Noto Sans", size: 0)
            btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
            btn.layer.cornerRadius = 10
            btn.addTarget(self, action: #selector(touchNextBtnEvent), for: .touchUpInside)
            return btn
    }()
    private lazy var pwEyeButton : UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "eye.gray.svg"), for: .normal)
        btn.addTarget(self, action: #selector(touchPwEyeBtnEvent), for: .touchUpInside)
        return btn
    }()
    private lazy var pwCheckEyeButton : UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "eye.gray.svg"), for: .normal)
        btn.addTarget(self, action: #selector(touchCheckEyeBtnEvent), for: .touchUpInside)
        return btn
    }()
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        self.setNavigationController()
        self.setNotificationCenter()
        self.dismissKeyboard()
        setViewHierarchy()
        setConstraints()
    }

    private func setViewHierarchy() {
        view.addSubviews(titleLabel,
                         nameTextField,
                         emailTextField,
                         warningLabelForEmail,
                         pwTextField,
                         pwRuleLabel,
                         checkPwTextField,
                         nextButton,
                         pwEyeButton,
                         pwCheckEyeButton,
                         wrongPwLabel
        )
    }
    
    private func setConstraints(){
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(70)
            make.centerX.equalToSuperview()
        }
        nameTextField.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(80)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(52)
        }
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(nameTextField.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(52)
        }
        warningLabelForEmail.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(3)
            make.leading.equalTo(emailTextField).offset(10)
        }
        pwTextField.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(52)
        }
        pwRuleLabel.snp.makeConstraints { make in
            make.top.equalTo(pwTextField.snp.bottom).offset(3)
            make.leading.equalTo(pwTextField).offset(10)
        }
        checkPwTextField.snp.makeConstraints { make in
            make.top.equalTo(pwRuleLabel.snp.bottom).offset(3)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(52)
        }
        pwEyeButton.snp.makeConstraints { make in
            make.height.equalTo(13.64)
            make.centerY.equalTo(pwTextField)
            make.trailing.equalTo(pwTextField).offset(-20)
        }
        pwCheckEyeButton.snp.makeConstraints { make in
            make.height.equalTo(13.64)
            make.centerY.equalTo(checkPwTextField)
            make.trailing.equalTo(checkPwTextField).offset(-20)
        }
        wrongPwLabel.snp.makeConstraints { make in
            make.top.equalTo(checkPwTextField.snp.bottom).offset(3)
            make.leading.equalTo(checkPwTextField).offset(10)
        }
        nextButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-50)
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(-15)
            make.height.equalTo(60)
        }
    }
    
    // MARK: - @objc Func
    
    @objc func touchPwEyeBtnEvent() {
        if(isPwEyeBtnTap == false){
            pwEyeButton.setImage(UIImage(named: "eye.blue.svg"), for: .normal)
            pwTextField.isSecureTextEntry = false
            isPwEyeBtnTap = true
        } else{
            pwEyeButton.setImage(UIImage(named: "eye.gray.svg"), for: .normal)
            pwTextField.isSecureTextEntry = true
            isPwEyeBtnTap = false
        }
    }
    @objc func touchCheckEyeBtnEvent() {
        if(isCheckEyeBtnTap == false){
            checkPwTextField.isSecureTextEntry = false
            pwCheckEyeButton.setImage(UIImage(named: "eye.blue.svg"), for: .normal)
            isCheckEyeBtnTap = true
        } else{
            pwCheckEyeButton.setImage(UIImage(named: "eye.gray.svg"), for: .normal)
            checkPwTextField.isSecureTextEntry = true
            isCheckEyeBtnTap = false
        }
    }
    @objc func nameTfDidChange() {
        nameTextField.layer.borderColor = UIColor.customColor(.blue).cgColor
        name = true
        if(email && name && pw && pwCheck){
            nextButton.backgroundColor = UIColor.customColor(.blue)
        }
    }
    @objc func emailTfDidChange() {
        emailTextField.layer.borderColor = UIColor.customColor(.blue).cgColor
        email = true
        if(email && name && pw && pwCheck){
            nextButton.backgroundColor = UIColor.customColor(.blue)
        }
    }
    @objc func pwTfDidChange() {
        pwTextField.layer.borderColor = UIColor.customColor(.blue).cgColor
        pw = true
        if(email && name && pw && pwCheck){
            nextButton.backgroundColor = UIColor.customColor(.blue)
        }
    }
    @objc func pwCheckTfDidChange() {
        checkPwTextField.layer.borderColor = UIColor.customColor(.blue).cgColor
        
        if(pwTextField.text == ""){
            wrongPwLabel.text = "비밀번호를 먼저 입력해주세요"
            wrongPwLabel.textColor = UIColor.red
        } else if(checkPwTextField.text != pwTextField.text){
            wrongPwLabel.text = "비밀번호가 일치하지 않습니다."
            wrongPwLabel.textColor = UIColor.red
        } else{
            wrongPwLabel.text = "비밀번호가 일치합니다."
            wrongPwLabel.textColor = UIColor.systemBackground
            wrongPwLabel.textColor = UIColor.customColor(.green)
            pwCheck = true
        }
        if(email && name && pw && pwCheck){
            nextButton.backgroundColor = UIColor.customColor(.blue)
        }
    }
    @objc func handlePwTfDidChange(_ notification: Notification) {
        if let textField = notification.object as? UITextField {
            if let text = textField.text {
                if checkPw(str: text) == false  {
                    pwRuleLabel.textColor = UIColor.red
                    pwTextField.layer.borderColor = UIColor.red.cgColor
                    pw = false
                }else{
                    isAllTrue[1] = true
                    pwRuleLabel.textColor = UIColor.customColor(.green)
                    pwRuleLabel.text = "사용 가능한 비밀번호입니다."
                    pwTextField.layer.borderColor = UIColor.customColor(.blue).cgColor
                    pw = true
                    if(email && name && pw && pwCheck){
                        nextButton.backgroundColor = UIColor.customColor(.blue)
                    }
                }
            }
        }
    }
    @objc func backTapped(sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    @objc func touchNextBtnEvent() {
        if(nextButton.backgroundColor == UIColor.customColor(.blue)){
            // MARK: FIX ME - profileImage
            self.signUpServer(name: nameTextField.text ?? "", email: emailTextField.text ?? "", password: pwTextField.text ?? "", profileImage: "customerProfile1")
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
    
    // MARK: - Func
    
    func setNotificationCenter(){
        NotificationCenter.default.addObserver(self, selector: #selector(handleEmailTfDidChange(_:)), name: UITextField.textDidChangeNotification, object: emailTextField)
        NotificationCenter.default.addObserver(self, selector: #selector(handlePwTfDidChange(_:)), name: UITextField.textDidChangeNotification, object: pwTextField)
    }
    func setNavigationController(){
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.topItem?.title = ""
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image:UIImage(named: "leftIcon.svg"), style: .plain, target: self, action: #selector(backTapped))
    }
    
    func showSuccessAlert(message:String){
        let alert = UIAlertController(title: "회원가입 성공", message: message, preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "로그인하러 가기", style: .default, handler: { _ in
            self.pushToSignIn()
        })
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    func showFailAlert(message:String){
        let alert = UIAlertController(title: "회원가입 실패", message: message, preferredStyle: UIAlertController.Style.alert)
        present(alert, animated: true, completion: nil)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
            alert.dismiss(animated: true)
        }
    }
    func pushToSignIn(){
        let nextVC = SignInViewController()
        navigationController?.pushViewController(nextVC, animated: true)
    }
    func checkEmail(str: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        return  NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: str)
    }
    func checkPw(str: String) -> Bool {
        let pwRegex = "^(?=.*[A-Za-z])(?=.*[!@#$%^&+=])(?=.*[0-9]).{5,}"
        return  NSPredicate(format: "SELF MATCHES %@", pwRegex).evaluate(with: str)
    }
    
}

// MARK: - Network

extension SignUpViewController {
    func signUpServer(name:String, email:String, password:String, profileImage:String){
        SignAPI.shared.postSignUpAPI(name: name, email: email, password: password, profileImage: profileImage) { response in
            guard let signUpMessageResponse = response?.result else { return }
            guard let signUpIsSuccessResponse = response?.isSuccess else { return }
            // MARK: - FIX ME : Just Best Case, 회원 가입 실패 시 예외처리 필요
            if signUpIsSuccessResponse == true {
                self.showSuccessAlert(message: signUpMessageResponse)
            }
        }
    }
}
