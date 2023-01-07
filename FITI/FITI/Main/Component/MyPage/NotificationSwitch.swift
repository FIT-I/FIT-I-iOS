//
//  NotificationSwitch.swift
//  FITI
//
//  Created by 홍준혁 on 2023/01/07.
//

import Foundation
import UIKit
import SnapKit

class NotificationSwitch : UIView {
    
    var notificationLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15.0)
        label.text = "알림"
        label.textColor = UIColor.customColor(.blue)
        return label
    }()
    
    var notificationSwitch : UISwitch = {
        let notiSwitch = UISwitch()
        notiSwitch.onTintColor = UIColor.customColor(.blue)
        return notiSwitch
    }()
    
    lazy var globalStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [notificationLabel,notificationSwitch])
        stackView.axis = .horizontal
        stackView.spacing = 230
        stackView.alignment = .center
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
        self.backgroundColor = UIColor.customColor(.boxGray)
        self.addSubview(globalStackView)
    }
    
    private func setConstraints() {
        globalStackView.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(10)
            make.trailing.bottom.equalToSuperview().offset(-10)
        }
    }
    
}
