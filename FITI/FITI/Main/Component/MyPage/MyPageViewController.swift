//
//  MyPageViewController.swift
//  FITI
//
//  Created by 홍준혁 on 2023/01/01.
//

import UIKit
import SnapKit

class MyPageViewController: UIViewController {
    
    var myPageTitleLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20.0)
        label.text = "마이페이지"
        label.textColor = UIColor.black
        return label
    }()
    
    var settingBtn : UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "gearshape.svg"), for: .normal)
        return btn
    }()
    
    lazy var topStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [myPageTitleLabel,settingBtn])
        stackView.axis = .horizontal
        stackView.spacing = 230
        stackView.alignment = .center
        return stackView
    }()
    
    // 프로필 스택 뷰
    let midProfileStackView = ProfileView()
    
    // 알림 뷰
    let notiView = NotificationSwitch()
    
    //

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        // Do any additional setup after loading the view.
        
        setViewHierarchy()
        setConstraints()
        
    }
    
    func setViewHierarchy(){
        view.addSubview(topStackView)
        view.addSubview(midProfileStackView)
        view.addSubview(notiView)
    }
    
    func setConstraints(){
        topStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(80)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
        }
        midProfileStackView.snp.makeConstraints { make in
            make.top.equalTo(topStackView.snp.bottom).offset(33)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-23)
            make.height.equalTo(35)
        }
        notiView.snp.makeConstraints { make in
            make.top.equalTo(midProfileStackView.snp.bottom).offset(45)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(50)
        }
    }

}
