//
//  RateView.swift
//  FITI
//
//  Created by 여진홍 on 2023/02/01.
//

import UIKit

class RateView: BaseView {
    
    var starNumber: Int = 5 {
        didSet { bind () }
    }
    var currentStar: Int = 0
    
    private var buttons: [UIButton] = []
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
     //   stackView.backgroundColor = UIColor.customColor(.boxGray)
        return stackView
    }()
    
    override func configure() {
        super.configure()
        
        starNumber = 5
        addSubviews()
        setupLayout()
    }
    
    private func addSubviews() {
        addSubview(stackView)
    }
    
    private func setupLayout() {
        stackView.translatesAutoresizingMaskIntoConstraints = false

        stackView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
    }

    
    override func bind() {
        super.bind()

        for i in 0..<5 {
            let button = UIButton()
            button.setImage(UIImage(named: "starEmpty.svg"), for: .normal)
            button.tag = i
            buttons += [button]
            stackView.addArrangedSubview(button)
            button.addTarget(self, action: #selector(didTapButton(sender:)), for: .touchUpInside)
        }
    }

    @objc
    private func didTapButton(sender: UIButton) {
        let end = sender.tag

        for i in 0...end {
            buttons[i].setImage(UIImage(named: "starFill.svg"), for: .normal)
        }
        for i in end + 1..<starNumber {
            buttons[i].setImage(UIImage(named: "starEmpty.svg"), for: .normal)
        }

        currentStar = end + 1
    }
    
    
}


