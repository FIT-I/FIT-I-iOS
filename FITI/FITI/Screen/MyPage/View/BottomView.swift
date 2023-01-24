//
//  BottomStackView.swift
//  FITI
//
//  Created by 홍준혁 on 2023/01/07.
//

import Foundation
import SnapKit
import UIKit

class BottomView : UIView {
    
    var heartList : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15.0)
        label.text = "찜 목록"
        label.snp.makeConstraints { make in
            make.width.equalTo(60)
            make.height.equalTo(22)
        }
        label.textColor = UIColor.customColor(.blue)
        return label
    }()
    
    var userLocation : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15.0)
        label.text = "본인 위치 설정"
        label.snp.makeConstraints { make in
            make.width.equalTo(90)
            make.height.equalTo(22)
        }
        label.textColor = UIColor.customColor(.blue)
        return label
    }()
    
    var notice : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15.0)
        label.text = "공지사항"
        label.snp.makeConstraints { make in
            make.width.equalTo(60)
            make.height.equalTo(22)
        }
        label.textColor = UIColor.customColor(.blue)
        return label
    }()
    
    var clause : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15.0)
        label.text = "이용약관"
        label.snp.makeConstraints { make in
            make.width.equalTo(60)
            make.height.equalTo(22)
        }
        label.textColor = UIColor.customColor(.blue)
        return label
    }()
    
    lazy var globalStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [heartList,userLocation,notice,clause])
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.alignment = .leading
        return stackView
    }()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
       
    override init(frame: CGRect) {
        super .init(frame: .zero)
        setViewHierarchy()
        setConstraints()
    }
    
    private func setViewHierarchy() {
        self.backgroundColor = .systemBackground
        self.addSubview(globalStackView)
    }
    
    private func setConstraints() {
        globalStackView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
    }
}
