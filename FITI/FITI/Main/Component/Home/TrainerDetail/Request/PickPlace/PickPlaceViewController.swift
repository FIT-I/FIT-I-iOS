//
//  PickPlaceViewController.swift
//  FITI
//
//  Created by 홍준혁 on 2023/01/04.
//

import UIKit
import SnapKit
import Then

class PickPlaceViewController: UIViewController {
    
    var isIWillGoSelected : Bool = false
    var isComeHereSelected : Bool = false

    var titleLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir-Black", size: 20.0)
        label.text = "픽업 형태"
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

    lazy var iWillGoBtn : UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "iWillGoIcon.svg"), for: .normal)
        btn.addTarget(self, action: #selector(iWillGoEvent), for: .touchUpInside)
        return btn
    }()
    
    lazy var comeHereBtn : UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "comeHereIcon.svg"), for: .normal)
        btn.addTarget(self, action: #selector(comeHereEvent), for: .touchUpInside)
        return btn
    }()
    
    lazy var globalStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [iWillGoBtn,comeHereBtn])
        stackView.axis = .horizontal
        stackView.spacing = 20
        stackView.alignment = .bottom
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    
    private let nextBtn : UIButton = {
        let btn = UIButton()
        btn.backgroundColor = UIColor.customColor(.blue)
        btn.layer.cornerRadius = 8
        btn.setTitle("다음", for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.layer.borderWidth = 1
        btn.layer.borderColor = UIColor.customColor(.blue).cgColor
        btn.addTarget(self, action: #selector(nextEvent), for: .touchUpInside)
        return btn
    }()
    
    
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
        view.addSubview(globalStackView)
        view.addSubview(nextBtn)
    }
    
    private func setConstraints(){
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(60)
            make.centerX.equalToSuperview()
        }
        progressView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(38)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        grayView.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
            make.width.equalToSuperview().dividedBy(3)
        }
        nextBtn.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.leading.equalToSuperview().offset(14)
            make.trailing.equalToSuperview().offset(-14)
            make.bottom.equalToSuperview().offset(-30)
        }
        globalStackView.snp.makeConstraints { make in
            make.top.equalTo(progressView.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
    }

    @objc func nextEvent(){
        let nextVC = RequestResultViewController()
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @objc func backTapped(sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: false)
    }

    @objc func iWillGoEvent(sender: UIBarButtonItem) {
        if isIWillGoSelected == false && isComeHereSelected == false {
            isIWillGoSelected = true
            iWillGoBtn.setImage(UIImage(named: "selectedIWillGoIcon.svg"), for: .normal)
        }else{
            isIWillGoSelected = false
            iWillGoBtn.setImage(UIImage(named: "iWillGoIcon.svg"), for: .normal)
        }
    }
    
    @objc func comeHereEvent(sender: UIBarButtonItem) {
        if isComeHereSelected == false && isIWillGoSelected == false {
            isComeHereSelected = true
            comeHereBtn.setImage(UIImage(named: "selectedComeHereIcon.svg"), for: .normal)
        }else{
            isComeHereSelected = false
            comeHereBtn.setImage(UIImage(named: "comeHereIcon.svg"), for: .normal)
        }
    }
    
}
