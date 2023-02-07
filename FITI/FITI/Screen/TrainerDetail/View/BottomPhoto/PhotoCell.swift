//
//  BookCVC.swift
//  FITI
//
//  Created by 홍준혁 on 2023/01/10.
//

import Foundation
import UIKit
import SnapKit
import Then
import Kingfisher

class PhotoCell: UICollectionViewCell {
    
    static let identifier = "CustomCollectionCell"

    let editerChoiceImageView : UIImageView = {
        let img = UIImageView()
        return img
    }()

    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .clear
        editerChoiceImageView.contentMode = .scaleToFill
        setLayout()
        editerChoiceImageView.layer.cornerRadius = 12
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayout() {
        contentView.addSubview(editerChoiceImageView)
        self.backgroundColor = .systemGroupedBackground
        addSubview(editerChoiceImageView)
        editerChoiceImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension PhotoCell {
    func bindImage(img:String){
        let imgUrl = URL(string: img)
        self.editerChoiceImageView.kf.setImage(with: imgUrl)
    }
}

