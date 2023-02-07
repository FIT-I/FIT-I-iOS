//
//  RequestSuccessViewController.swift
//  FITI
//
//  Created by 홍준혁 on 2023/02/07.
//

import UIKit

import SnapKit

class RequestSuccessViewController: UIViewController {
    
    private let textImage : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named:"successRequest.svg")
        return imageView
    }()
    
    private let textSubImage : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named:"successRequestSubText.svg")
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.systemBackground
        self.navigationItem.hidesBackButton = true
        pagingTimer()
        setViewHierarchy()
        setConstraints()
    }
    
    private func setViewHierarchy() {
        view.addSubviews(textImage, textSubImage)
    }
    
    private func setConstraints(){
        textImage.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        textSubImage.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-100)
        }
    }
    
    func pagingTimer() {
        let _: Timer = Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { (Timer) in
            self.pagingMove()
        }
    }
    
    func pagingMove() {
        let nextVC = TabBarController()
        navigationController?.pushViewController(nextVC, animated: true)
    }
}
