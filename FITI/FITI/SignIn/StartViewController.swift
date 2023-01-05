//
//  StartViewController.swift
//  FITI
//
//  Created by 홍준혁 on 2023/01/01.
//

import UIKit
import SnapKit
import Then
import SwiftUI

class StartViewController: UIViewController, UIPickerViewDelegate {

    private let titleLabel1 : UILabel = {
        let label = UILabel()
        label.text = "안녕하세요."
        label.textColor = UIColor.customColor(.blue)
        label.font = UIFont(name: "Noto Sans", size: 24)
        label.font = UIFont.boldSystemFont(ofSize: 25)
        return label
    }()

    private let titleLabel2 : UILabel = {
        let label = UILabel()
        label.text = "Fit-i를 찾은 당신은 누구입니까?"
        label.textColor = UIColor.customColor(.blue)
        label.font = UIFont(name: "Noto Sans", size: 0)
        label.font = UIFont.boldSystemFont(ofSize: 24)
        return label
    }()
    
    private let TitlestackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .fill
        return stackView
    }()
    
    private let choosePickerView : UIPickerView = {
        let pkView = UIPickerView()
        return pkView
    }()
        

    
    
//    private let pickRollScrollView : UIScrollView = {
//        let scrollView = UIScrollView()
//        scrollView.translatesAutoresizingMaskIntoConstraints = false
//        scrollView.backgroundColor = .orange
//        scrollView.showsVerticalScrollIndicator = false
//        return scrollView
//    }()
//
//    private let contentStackView: UIStackView = {
//        let stackView = UIStackView()
//        stackView.axis = .horizontal
//        stackView.spacing = 10
//        stackView.alignment = .fill
//        return stackView
//       }()
    
    private let customerImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named:"customer.svg")
        return imageView
    }()
    
    private let trainerImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named:"trainer.svg")
        return imageView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        // Do any additional setup after loading the view.
        
//        choosePickerView.delegate = self
//        choosePickerView.dataSource = self

        startViewAddUI()
        startViewSetUI()
    }
    
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        return 1
//    }
    
    func startViewAddUI(){
        
        // add view
        TitlestackView.addArrangedSubview(titleLabel1)
        TitlestackView.addArrangedSubview(titleLabel2)
        
        view.addSubview(TitlestackView)

//        view.addSubview(pickRollScrollView)
        
//        pickRollScrollView.addSubview(contentStackView)
//        pickRollScrollView.addSubview(trainerImageView)

//        contentStackView.addArrangedSubview(customerImageView)
//        contentStackView.addArrangedSubview(trainerImageView)
        
    }
    
    func startViewSetUI(){
        
        TitlestackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(155)
            make.centerX.equalToSuperview()
        }
        

        
        customerImageView.snp.makeConstraints { make in
            make.height.equalTo(317)
            make.width.equalTo(260)
            make.centerX.equalToSuperview()
        }

        trainerImageView.snp.makeConstraints { make in
            make.height.equalTo(317)
            make.width.equalTo(260)
            make.leading.equalTo(customerImageView.snp.trailing).offset(10)
        }
        
//        pickRollScrollView.snp.makeConstraints { make in
//            make.top.equalTo(TitlestackView.snp.bottom).offset(43)
//            make.width.equalTo(300)
//            make.height.equalTo(customerImageView)
//
//            make.centerX.equalToSuperview()
//
//        }
//
//        contentStackView.snp.makeConstraints { make in
//            make.top.equalToSuperview()
//            make.height.equalTo(customerImageView)
//            make.leading.equalToSuperview()
//        }
        
    }
    
}
