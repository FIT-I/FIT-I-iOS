//
//  GradeTableViewController.swift
//  FITI
//
//  Created by 홍준혁 on 2023/01/11.
//

import Foundation
import UIKit
import SnapKit
import Moya

class GradeTableViewController: UIViewController {
    private let gradeImage : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named:"gradeTable.svg")
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        self.navigationItem.hidesBackButton = true
        pagingTimer()
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
