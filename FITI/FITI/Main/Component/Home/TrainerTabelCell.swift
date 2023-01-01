//
//  TrainerTabelCell.swift
//  FITI
//
//  Created by 홍준혁 on 2023/01/01.
//


import Foundation
import UIKit
import SnapKit
//import Kingfisher

class TrainerTabelCell: UITableViewCell {

    static let identifier = "TrainerTabelCell"
    
    private let imgView : UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        view.snp.makeConstraints { make in
            make.height.equalTo(70)
            make.width.equalTo(70)
        }
        return view
    }()
    
    var name : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Noto Sans", size: 15)
        label.text = "김동현"
        label.textColor = UIColor.black
        return label
    }()
    
    var starIcon : UIImageView = {
        let image = UIImageView()
        image.image =  UIImage(systemName: "wand.and.stars")
        return image
    }()
    
    var runIcon : UIImageView = {
        let image = UIImageView()
        image.image =  UIImage(systemName: "figure.run")
        return image
    }()
    
    var foodIcon : UIImageView = {
        let image = UIImageView()
        image.image =  UIImage(systemName: "heart.text.square")
        return image
    }()
    
    var recycleIcon : UIImageView = {
        let image = UIImageView()
        image.image =  UIImage(systemName: "person.2.wave.2")
        return image
    }()
    
    var purpose : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Noto Sans", size: 10)
        label.text = "개인PT"
        label.textColor = UIColor.black
        return label
    }()
    
    var distance : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Noto Sans", size: 10)
        label.text = "1Km"
        label.textColor = UIColor.customColor(.gray)
        return label
    }()
    
    private let dot : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Noto Sans", size: 10)
        label.text = "."
        label.textColor = UIColor.customColor(.gray)
        return label
    }()
    
    private let yellowStarIcon : UIImage = {
        let image = UIImage(systemName: "star")
        return image!
    }()
    
    private let grade : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Noto Sans", size: 10)
        label.text = "4.3"
        label.textColor = UIColor.customColor(.gray)
        return label
    }()
    
    private let license : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Noto Sans", size: 10)
        label.text = "보유 자격증 5개"
        label.textColor = UIColor.customColor(.gray)
        return label
    }()
    
    private let school : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Noto Sans", size: 10)
        label.text = "숭실대학교"
        label.textColor = UIColor.customColor(.gray)
        return label
    }()
    
    private let introTextView : UITextView = {
        let textView = UITextView()
        textView.textColor = UIColor.black
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.font = UIFont(name: "Noto Sans", size: 10)
        textView.snp.makeConstraints { make in
            make.height.equalTo(30)
        }
        return textView
    }()
    
    private let price : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Noto Sans", size: 10)
        label.text = "2만원~"
        label.textColor = UIColor.black
        return label
    }()
    
    private let time : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Noto Sans", size: 10)
        label.text = "/1시간"
        label.textColor = UIColor.customColor(.gray)
        return label
    }()
    
    private let iconStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 2
        stackView.alignment = .fill
        return stackView
    }()
    
    private let nameStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .fill
        return stackView
    }()
    
    private let distanceStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .fill
        return stackView
    }()
    
    private let priceStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .fill
        return stackView
    }()
    
    private let rightStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .fill
        return stackView
    }()
    
    private let globalStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .fill
        return stackView
    }()
    
    


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // 어떻게 이 코드가.... 뭐지..
//        print(GlobalstackView)
//        print(iconStackView)
        
        iconStackView.addArrangedSubview(starIcon)
        iconStackView.addArrangedSubview(purpose)
        

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been impl")
    }
    
}

extension TrainerTabelCell {
    public func binding(){
        //
    }
}
