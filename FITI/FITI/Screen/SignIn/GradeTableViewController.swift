//
//  GradeTableViewController.swift
//  FITI
//
//  Created by 홍준혁 on 2023/01/11.
//

import Foundation
import UIKit
import SnapKit

class GradeTableViewController: UIViewController {
    
    private let gradeImage : UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(named:"gradeTable.svg")
            return imageView
        }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemBackground
        // navigationItem 제거
        self.navigationItem.hidesBackButton = true
        pagingTimer()
        // Do any additional setup after loading the view.
        setViewHierarchy()
        setConstraints()
    }

    private func setViewHierarchy() {
        view.addSubview(gradeImage)
    }
    
    private func setConstraints(){
        
        gradeImage.snp.makeConstraints { make in
            make.height.equalTo(597)
            make.width.equalTo(349)
            make.center.equalToSuperview()
        }
    }
    
    @objc func backTapped(sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
    func pagingTimer() {
            let _: Timer = Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { (Timer) in
                self.pagingMove()
            }
        }
    
    func pagingMove() {
        let nextVC = TabBarController()
        navigationController?.pushViewController(nextVC, animated: true)
    }

}
