//
//  TrainerTabelCell.swift
//  FITI
//
//  Created by 홍준혁 on 2023/01/01.
//


import Foundation
import UIKit
import SnapKit

class TrainerTabelCell: UITableViewCell {

    static let identifier = "TrainerTabelCell"
    
    private let imgView : UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        view.image = UIImage(systemName: "figure.soccer")
        view.snp.makeConstraints { make in
            make.height.equalTo(110)
            make.width.equalTo(100)
        }
        return view
    }()
    
    var name : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15.0)
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
        label.font = UIFont.systemFont(ofSize: 10.0)
        label.text = "개인PT"
        label.textColor = UIColor.black
        return label
    }()
    
    var distance : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10.0)
        label.text = "1Km"
        label.textColor = UIColor.customColor(.gray)
        return label
    }()
    
    private let dot : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10.0)
        label.text = "."
        label.textColor = UIColor.customColor(.gray)
        return label
    }()
    
    var yellowStarIcon : UIImageView = {
        let image = UIImageView()
        image.image =  UIImage(systemName: "star")
        return image
    }()
    
    var grade : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10.0)
        label.text = "평점4.3"
        label.textColor = UIColor.customColor(.gray)
        return label
    }()
    
    var license : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10.0)
        label.text = "자격증 5개"
        label.textColor = UIColor.customColor(.gray)
        return label
    }()
    
    var school : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10.0)
        label.text = "숭실대"
        label.textColor = UIColor.customColor(.gray)
        return label
    }()
    
    var introTextView : UITextView = {
        let textView = UITextView()
        textView.textColor = UIColor.black
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.font = UIFont.systemFont(ofSize: 10.0)
        // 더미 데이터
        textView.text = "Pt 센터 경력 3년. 스포애니 상도점에서 대표 트레이너로 근무한 경험이 있습니다. 가르치는 것은 자신있습니다. 중앙대학교 체육대학 지난학기 수석 학생입니다. 배운 내용을 토대로 안전하게 지도해드립니다."
//        textView.backgroundColor = .red
        return textView
    }()
    
    var price : UILabel = {
        let label = UILabel()
//        label.font = UIFont(name: "Noto Sans", size: 10)
        label.font = UIFont.systemFont(ofSize: 10.0)
        label.text = "2만원~"
        label.textColor = UIColor.black
        return label
    }()
    
    let time : UILabel = {
        let label = UILabel()
//        label.font = UIFont(name: "Noto Sans", size: 10)
        label.font = UIFont.systemFont(ofSize: 10.0)
        label.text = "/1시간"
        label.textColor = UIColor.customColor(.gray)
        return label
    }()
    
    lazy var iconStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [starIcon,purpose])
        stackView.axis = .horizontal
        stackView.spacing = 2
        stackView.alignment = .center
        return stackView
    }()
    
    lazy var nameStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [name,iconStackView])
        stackView.axis = .horizontal
        stackView.spacing = 13
        stackView.alignment = .leading
        return stackView
    }()
    
    lazy var gradeStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [grade,license,school])
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.alignment = .leading
        return stackView
    }()
    
    lazy var priceStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [price,time])
        stackView.axis = .horizontal
        stackView.spacing = 2
        stackView.alignment = .leading
        return stackView
    }()
    
    lazy var rightStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [nameStackView,gradeStackView,introTextView,priceStackView])
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.alignment = .leading
        return stackView
    }()
    
    lazy var globalStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [imgView,rightStackView])
        stackView.axis = .horizontal
        stackView.spacing = 15
        stackView.alignment = .fill
        return stackView
    }()
    
    
    


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(self.globalStackView)

        globalStackView.snp.makeConstraints { make in
//            make.top.leading.trailing.bottom.equalToSuperview()
            make.top.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().offset(-10)
            make.leading.trailing.equalToSuperview()
        }
        
        print(globalStackView)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been impl")
    }
    
}

//
//extension TrainerTabelCell {
//    public func binding(){
//        //
//    }
//}
