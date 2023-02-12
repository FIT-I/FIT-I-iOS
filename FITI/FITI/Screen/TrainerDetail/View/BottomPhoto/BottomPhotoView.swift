//
//  BottomView.swift
//  FITI
//
//  Created by 홍준혁 on 2023/01/10.
//

import Foundation
import UIKit
import SnapKit


class BottomPhotoView: UIView {
    
    private let space : CGFloat = 10
    private lazy var photoImage : UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "camera.svg")
        return imgView
    }()
    private lazy var photoLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15.0)
        label.text = "사진 및 자격증"
        label.textColor = UIColor.black
        return label
    }()
    private lazy var emptyPhotoLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15.0)
        label.text = "트레이너가 등록한 사진이 없습니다."
        label.textColor = UIColor.customColor(.gray)
        return label
    }()
    private lazy var editPhotoButton : UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "edit.svg"), for: .normal)
        return btn
    }()
    private lazy var photoLineView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.customColor(.gray)
        return view
    }()
    private lazy var photoTopStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [photoImage,photoLabel])
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.alignment = .center
        return stackView
    }()
    private lazy var editerChoiceCV: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 5.0
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 125, height: 125)
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.isScrollEnabled = true
        cv.contentInset = .zero
        cv.backgroundColor = .clear
        cv.clipsToBounds = true
        cv.backgroundColor = .green
        return cv
    }()
    
    // MARK: - Life Cycles
    override init(frame: CGRect) {
        super.init(frame: frame)
        setViewHierarchy()
        setLayout()
        editerChoiceCV.backgroundColor = .clear
        editerChoiceCV.register(PhotoCell.self, forCellWithReuseIdentifier: PhotoCell.identifier)
        editerChoiceCV.delegate = self
        editerChoiceCV.dataSource = self
        editerChoiceCV.showsHorizontalScrollIndicator = false
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setViewHierarchy(){
        self.addSubviews(photoTopStackView,
                         photoLineView,
                         editPhotoButton,
                         editerChoiceCV,
                         emptyPhotoLabel
        )
    }
    
    private func setLayout(){
        photoTopStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(17)
            make.leading.equalToSuperview()
        }
        editPhotoButton.snp.makeConstraints { make in
            make.top.equalTo(photoTopStackView)
            make.trailing.equalToSuperview().offset(-20)
        }
        photoLineView.snp.makeConstraints { make in
            make.top.equalTo(photoTopStackView.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(1)
        }
        emptyPhotoLabel.snp.makeConstraints { make in
            make.top.equalTo(photoLineView.snp.bottom).offset(10)
            make.leading.equalTo(photoLineView.snp.leading)
        }
        editerChoiceCV.snp.makeConstraints { make in
            make.top.equalTo(photoLineView.snp.bottom).offset(10)
            make.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview()
        }
    }
    
    func setEmptyLable(isEmpty:Int){
        if isEmpty != 0 {
            self.emptyPhotoLabel.isHidden = true
        }else {
            self.emptyPhotoLabel.isHidden = false
        }
    }
}

//MARK: - Extension

extension BottomPhotoView: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.setEmptyLable(isEmpty: TrainerDetailViewController.specificTrainer.imageList?.count ?? 0)
        return TrainerDetailViewController.specificTrainer.imageList?.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = editerChoiceCV.dequeueReusableCell(withReuseIdentifier: PhotoCell.identifier, for: indexPath) as! PhotoCell
        cell.layer.cornerRadius = 10
        cell.layer.masksToBounds = true
        let imgString = TrainerDetailViewController.specificTrainer.imageList?[indexPath.row] ?? ""
        cell.bindImage(img: imgString)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return space
    }
}
