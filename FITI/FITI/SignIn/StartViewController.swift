//
//  StartViewController.swift
//  FITI
//
//  Created by 홍준혁 on 2023/01/01.
//

import UIKit
import SnapKit

class StartViewController: UIViewController {

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
        label.text = "FIT-I를 찾은 당신은 누구입니까?"
        label.textColor = UIColor.customColor(.blue)
        label.font = UIFont(name: "Noto Sans", size: 24)
        label.font = UIFont.boldSystemFont(ofSize: 25)
        return label
    }()
    
    private let TitlestackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.alignment = .fill
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        // Do any additional setup after loading the view.
        startViewAddUI()
        
        startViewSetUI()
    }
    
    func startViewAddUI(){
        
        // add view
        TitlestackView.addArrangedSubview(titleLabel1)
        TitlestackView.addArrangedSubview(titleLabel2)
        view.addSubview(TitlestackView)
    }
    
    func startViewSetUI(){
        TitlestackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(155)
            make.centerX.equalToSuperview()
        }
    }
    
    
    
}
