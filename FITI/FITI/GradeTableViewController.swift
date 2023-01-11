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
    
    private let announceFirstLabel : UILabel = {
        let label = UILabel()
        label.text = "*자격증 업데이트를 통해 언제든지 Level-UP 할 수 있습니다. "
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.customColor(.blue)
        return label
    }()
    
    private let announceSecLabel : UILabel = {
        let label = UILabel()
        label.text = "  My page내의 자격증 업데이트 칸을 이용해주세요."
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.customColor(.blue)
        return label
    }()
    
    private let announceStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        return stackView
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
        announceStackView.addArrangedSubview(announceFirstLabel)
        announceStackView.addArrangedSubview(announceSecLabel)

        view.addSubview(announceStackView)
    }
    
    private func setConstraints(){
        
        gradeImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.height.equalTo(350)
            make.width.equalTo(349)
            make.center.equalToSuperview()
        }
        
        announceStackView.snp.makeConstraints { make in
//            make.bottom.equalToSuperview().offset(-90)
            make.top.equalTo(gradeImage.snp.bottom).offset(30)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-30)
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
