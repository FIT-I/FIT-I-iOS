//
//  SignInViewController.swift
//  FITI-Trainer-iOS
//
//  Created by 박윤빈 on 2023/01/11.
//

import UIKit

import SnapKit
import Moya

class SignInViewController: UIViewController {

    // MARK: - Properties
    
    let realm = RealmService()
    var id = false
    var pw = false
    
    // MARK: - UI Components
    
    private lazy var titleLabel : UILabel = {
        let label = UILabel()
        label.text = "Trainer-Login"
        label.textColor = UIColor.customColor(.blue)
        label.font = UIFont(name: "Noto Sans", size: 24)
        label.font = UIFont.boldSystemFont(ofSize: 24)
        return label
    }()
    private lazy var idTextField : UITextField = {
        let tf = UITextField()
        tf.attributedPlaceholder = NSAttributedString(
                    string: "아이디",
                    attributes: [NSAttributedString.Key.foregroundColor: UIColor.customColor(.gray)]
                )
        tf.layer.borderColor = UIColor.customColor(.gray).cgColor
        tf.layer.borderWidth = 1
        tf.layer.cornerRadius = 10
        tf.font = UIFont.systemFont(ofSize: 20)
        tf.textColor = UIColor.customColor(.blue)
        tf.setLeftPaddingPoints(10)
        tf.addTarget(self, action: #selector(handleIdTfDidChange), for: .editingChanged)
        return tf
    }()
    private lazy var passwordTextField : UITextField = {
        let tf = UITextField()
        tf.attributedPlaceholder = NSAttributedString(
                    string: "비밀번호",
                    attributes: [NSAttributedString.Key.foregroundColor: UIColor.customColor(.gray)]
                )
        tf.layer.borderColor = UIColor.customColor(.gray).cgColor
        tf.layer.borderWidth = 1
        tf.layer.cornerRadius = 10
        tf.font = UIFont.systemFont(ofSize: 20)
        tf.textColor = UIColor.customColor(.blue)
        tf.setLeftPaddingPoints(10)
        tf.addTarget(self, action: #selector(handlePwTfDidChange), for: .editingChanged)
        return tf
    }()
    private lazy var findPasswordButton : UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .none
        btn.setTitle("비밀번호 찾기", for: .normal)
        btn.setTitleColor(UIColor.customColor(.blue), for: .normal)
        btn.titleLabel?.font = UIFont(name: "Noto Sans", size: 0)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        btn.addTarget(self, action: #selector(findPwBtnEvent), for: .touchUpInside)
        return btn
    }()
    private lazy var signUpButton : UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .none
        btn.setTitle("회원가입", for: .normal)
        btn.setTitleColor(UIColor.customColor(.blue), for: .normal)
        btn.titleLabel?.font = UIFont(name: "Noto Sans", size: 0)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        btn.addTarget(self, action: #selector(signUpBtnEvent), for: .touchUpInside)
        return btn
    }()
    private lazy var horizontalStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 20
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        return stackView
    }()
    private lazy var nextButton : UIButton = {
           let btn = UIButton()
            btn.backgroundColor = UIColor.customColor(.gray)
            btn.setTitle("로그인", for: .normal)
            btn.setTitleColor(UIColor.white, for: .normal)
            btn.titleLabel?.font = UIFont(name: "Noto Sans", size: 0)
            btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
            btn.layer.cornerRadius = 10
            btn.addTarget(self, action: #selector(touchNextBtnEvent), for: .touchUpInside)
            return btn
        }()
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        // MARK: - FIXME
//        self.realm.resetDB()
        if checkRealmToken() {
            print(self.realm.getToken())
            ifSuccessPushHome()
        }
        self.dismissKeyboard()
        self.setNavigationItem()
        signInViewAddUI()
        signInViewSetUI()
    }

    private func signInViewAddUI(){
        horizontalStackView.addArrangedSubviews([findPasswordButton,signUpButton])
        view.addSubviews(titleLabel,
                         idTextField,
                         passwordTextField,
                         horizontalStackView,
                         nextButton
        )
    }

    private func signInViewSetUI(){
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(200)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-100)
        }
        idTextField.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.height.equalTo(52)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(idTextField.snp.bottom).offset(10)
            make.height.equalTo(52)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        horizontalStackView.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(27)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        nextButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-80)
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(-15)
            make.height.equalTo(60)
        }
    }

    // MARK: - @objc Func
    
    @objc func signUpBtnEvent(){
        let nextVC = PolicyViewController()
        navigationController?.pushViewController(nextVC, animated: true)
    }
    @objc func findPwBtnEvent(){
        let nextVC = FindPwViewController()
        navigationController?.pushViewController(nextVC, animated: true)
    }
    @objc func handleIdTfDidChange(){
        idTextField.layer.borderColor = UIColor.customColor(.blue).cgColor
        id = true
        if(id && pw){
            nextButton.backgroundColor = UIColor.customColor(.blue)
        }
    }
    @objc func handlePwTfDidChange(){
        passwordTextField.layer.borderColor = UIColor.customColor(.blue).cgColor
        pw = true
        if(id && pw){
            nextButton.backgroundColor = UIColor.customColor(.blue)
        }
    }
    @objc func touchNextBtnEvent() {
        switch checkRealmToken() {
        case false :
            if((idTextField.text != "") && (passwordTextField.text != "")){
                self.signInServer(email: idTextField.text ?? "", password: passwordTextField.text ?? "")
            }
        default:
            ifSuccessPushHome()
        }
    }
    
    //MARK: - Func
    
    private func checkRealmToken()->Bool{
        if realm.getToken() == ""{
            return false
        }else{
            return true
        }
    }
    private func ifSuccessPushHome(){
        print("pushToHome")
        self.getFirstTrainerListServer(category: "pt", page: 0, size: 5, sort: ["current"])
        let nextVC = GradeTableViewController()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
            self.navigationController?.pushViewController(nextVC, animated: true)
        }
    }
    private func addTokenInRealm(item:String){
        realm.addToken(item: item)
        print(realm.getToken())
    }
    private func showFailAlert(){
        let alert = UIAlertController(title: "로그인 실패", message: "이메일 또는 비밀번호를 확인해주세요.", preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: { okAction in
            self.idTextField.text = ""
            self.passwordTextField.text = ""
        })
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    func setNavigationItem(){
        self.navigationItem.hidesBackButton = true
    }
}

// MARK: - Network

extension SignInViewController {
    func signInServer(email:String, password:String){
        SignAPI.shared.postSignInAPI(email: email, password: password){ response in
            print(response?.message ?? "")
            guard let signInResponse = response?.result else { return }
            print(signInResponse.accessToken)
            if response?.code == 1000 {
                self.addTokenInRealm(item: signInResponse.accessToken)
                self.ifSuccessPushHome()
            } else {
                self.showFailAlert()
            }
        }
    }
    func getFirstTrainerListServer(category:String,page:Int,size:Int,sort:[String]){
        TrainerAPI.shared.getFirstTrainerListAPI(category: category, page: page, size: size, sort: sort) { response in
            guard let trainerListResponse = response?.result.dto else { return }
            HomeViewController.trainerList = trainerListResponse
        }
    }
}
