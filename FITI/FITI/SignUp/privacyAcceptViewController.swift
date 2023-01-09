//
//  privacyAcceptViewController.swift
//  FITI
//
//  Created by 홍준혁 on 2023/01/08.
//

import Foundation
import UIKit
import SnapKit

class privacyAcceptViewController: UIViewController {
    
    var titleLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20.0)
        label.text = "이용약관2"
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
    }
    
    @objc func backTapped(sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
}
