//
//  ReportView.swift
//  FITI
//
//  Created by 여진홍 on 2023/02/03.
//

import UIKit
import SnapKit

class ReportView: UIView {

    // Buttons
    lazy var firstPickBtn: UIButton = {
        let btn = UIButton()
        btn.addTarget(self, action: #selector(firstBtnPressed), for: .touchUpInside)
        btn.setImage(UIImage(named: "lessthan.circle.svg"), for: .normal)
        return btn
    }()
    
    lazy var secondPickBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "lessthan.circle.svg"), for: .normal)
        btn.addTarget(self, action: #selector(secondBtnPressed), for: .touchUpInside)
        return btn
    }()
    
    lazy var thirdPickBtn: UIButton =  {
        let btn = UIButton()
        btn.setImage(UIImage(named: "lessthan.circle.svg"), for: .normal)
        btn.addTarget(self, action: #selector(thirdBtnPressed), for: .touchUpInside)
        return btn
    }()
    
    lazy var fourthPickBtn: UIButton =  {
        let btn = UIButton()
        btn.setImage(UIImage(named: "lessthan.circle.svg"), for: .normal)
        btn.addTarget(self, action: #selector(fourthBtnPressed), for: .touchUpInside)
        return btn
    }()
    
    lazy var fifthPickBtn: UIButton =  {
        let btn = UIButton()
        btn.setImage(UIImage(named: "lessthan.circle.svg"), for: .normal)
        btn.addTarget(self, action: #selector(fifthBtnPressed), for: .touchUpInside)
        return btn
    }()
    
    lazy var sixthPickBtn: UIButton =  {
        let btn = UIButton()
        btn.setImage(UIImage(named: "lessthan.circle.svg"), for: .normal)
        btn.addTarget(self, action: #selector(sixthBtnPressed), for: .touchUpInside)
        return btn
    }()
    
    lazy var seventhPickBtn: UIButton =  {
        let btn = UIButton()
        btn.setImage(UIImage(named: "lessthan.circle.svg"), for: .normal)
        btn.addTarget(self, action: #selector(seventhBtnPressed), for: .touchUpInside)
        return btn
    }()
    
    lazy var eighthPickBtn: UIButton =  {
        let btn = UIButton()
        btn.setImage(UIImage(named: "lessthan.circle.svg"), for: .normal)
        btn.addTarget(self, action: #selector(eighthBtnPressed), for: .touchUpInside)
        return btn
    }()
    
    // Labels
    lazy var firstLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15.0)
        label.text = "요청서와 관련없는 광고/홍보/영업"
        label.textColor = UIColor.customColor(.darkGray)
        return label
    }()
    
    lazy var secondLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15.0)
        label.text = "중복 요청서 작성"
        label.textColor = UIColor.customColor(.darkGray)
        return label
    }()
    
    lazy var thirdLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15.0)
        label.text = "허위 요청서 작성"
        label.textColor = UIColor.customColor(.darkGray)
        return label
    }()
    
    lazy var fourthLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15.0)
        label.text = "요청서 내 개인정보 노출"
        label.textColor = UIColor.customColor(.darkGray)
        return label
    }()
    
    lazy var fifthLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15.0)
        label.text = "서비스 카테고리 오선택"
        label.textColor = UIColor.customColor(.darkGray)
        return label
    }()
    
    lazy var sixthLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15.0)
        label.text = "유효하지 않는 전화번호"
        label.textColor = UIColor.customColor(.darkGray)
        return label
    }()
    
    lazy var seventhLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15.0)
        label.text = "부적절한 언어(욕설, 성희롱 등) 사용"
        label.textColor = UIColor.customColor(.darkGray)
        return label
    }()
    
    lazy var eighthLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15.0)
        label.text = "관련 법령 등을 위반하는 요청"
        label.textColor = UIColor.customColor(.darkGray)
        return label
    }()
    
    // stackView
    lazy var firstStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [firstPickBtn, firstLabel])
        stackView.axis = .horizontal
        stackView.spacing = 20
        stackView.alignment = .center
        return stackView
    }()
    
    lazy var secondStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [secondPickBtn, secondLabel])
        stackView.axis = .horizontal
        stackView.spacing = 20
        stackView.alignment = .center
        return stackView
    }()
    
    lazy var thirdStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [thirdPickBtn, thirdLabel])
        stackView.axis = .horizontal
        stackView.spacing = 20
        stackView.alignment = .center
        return stackView
    }()
    
    lazy var fourthStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [fourthPickBtn, fourthLabel])
        stackView.axis = .horizontal
        stackView.spacing = 20
        stackView.alignment = .center
        return stackView
    }()
    
    lazy var fifthStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [fifthPickBtn, fifthLabel])
        stackView.axis = .horizontal
        stackView.spacing = 20
        stackView.alignment = .center
        return stackView
    }()
    
    lazy var sixthStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [sixthPickBtn, sixthLabel])
        stackView.axis = .horizontal
        stackView.spacing = 20
        stackView.alignment = .center
        return stackView
    }()
    
    lazy var seventhStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [seventhPickBtn, seventhLabel])
        stackView.axis = .horizontal
        stackView.spacing = 20
        stackView.alignment = .center
        return stackView
    }()
    
    lazy var eighthStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [eighthPickBtn, eighthLabel])
        stackView.axis = .horizontal
        stackView.spacing = 20
        stackView.alignment = .center
        return stackView
    }()
    
    // 전체 stackView
    
    lazy var globalStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [firstStackView, secondStackView, thirdStackView, fourthStackView, fifthStackView, sixthStackView, seventhStackView, eighthStackView])
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 10
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
        self.addSubview(globalStackView)
    }
    
    private func setConstraints() {
        globalStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(15)
            make.leading.equalToSuperview().offset(20)
    //        make.bottom.equalToSuperview().offset(15)
        }
    }
    
    @objc func firstBtnPressed (_ sender: UIButton) {
        if firstPickBtn.imageView?.image == UIImage(named: "bluecircle.svg"){ firstPickBtn.setImage(UIImage(named: "lessthan.circle.svg"), for: .normal) }
        else if firstPickBtn.imageView?.image == UIImage(named: "lessthan.circle.svg"){
        firstPickBtn.setImage(UIImage(named: "bluecircle.svg"), for: .normal)
                }
    }
    
    @objc func secondBtnPressed (_ sender: UIButton) {
        if secondPickBtn.imageView?.image == UIImage(named: "bluecircle.svg"){ secondPickBtn.setImage(UIImage(named: "lessthan.circle.svg"), for: .normal) }
        else if secondPickBtn.imageView?.image == UIImage(named: "lessthan.circle.svg"){
        secondPickBtn.setImage(UIImage(named: "bluecircle.svg"), for: .normal)
                }
    }
    
    @objc func thirdBtnPressed (_ sender: UIButton) {
        if thirdPickBtn.imageView?.image == UIImage(named: "bluecircle.svg"){ thirdPickBtn.setImage(UIImage(named: "lessthan.circle.svg"), for: .normal) }
        else if thirdPickBtn.imageView?.image == UIImage(named: "lessthan.circle.svg"){
        thirdPickBtn.setImage(UIImage(named: "bluecircle.svg"), for: .normal)
                }
    }
    
    @objc func fourthBtnPressed (_ sender: UIButton) {
        if fourthPickBtn.imageView?.image == UIImage(named: "bluecircle.svg"){ fourthPickBtn.setImage(UIImage(named: "lessthan.circle.svg"), for: .normal) }
        else if fourthPickBtn.imageView?.image == UIImage(named: "lessthan.circle.svg"){
        fourthPickBtn.setImage(UIImage(named: "bluecircle.svg"), for: .normal)
                }
    }
    
    @objc func fifthBtnPressed (_ sender: UIButton) {
        if fifthPickBtn.imageView?.image == UIImage(named: "bluecircle.svg"){ fifthPickBtn.setImage(UIImage(named: "lessthan.circle.svg"), for: .normal) }
        else if fifthPickBtn.imageView?.image == UIImage(named: "lessthan.circle.svg"){
        fifthPickBtn.setImage(UIImage(named: "bluecircle.svg"), for: .normal)
                }
    }
    
    @objc func sixthBtnPressed (_ sender: UIButton) {
        if sixthPickBtn.imageView?.image == UIImage(named: "bluecircle.svg"){ sixthPickBtn.setImage(UIImage(named: "lessthan.circle.svg"), for: .normal) }
        else if sixthPickBtn.imageView?.image == UIImage(named: "lessthan.circle.svg"){
        sixthPickBtn.setImage(UIImage(named: "bluecircle.svg"), for: .normal)
                }
    }
    
    @objc func seventhBtnPressed (_ sender: UIButton) {
        if seventhPickBtn.imageView?.image == UIImage(named: "bluecircle.svg"){ seventhPickBtn.setImage(UIImage(named: "lessthan.circle.svg"), for: .normal) }
        else if seventhPickBtn.imageView?.image == UIImage(named: "lessthan.circle.svg"){
        seventhPickBtn.setImage(UIImage(named: "bluecircle.svg"), for: .normal)
                }
    }
    
    @objc func eighthBtnPressed (_ sender: UIButton) {
        if eighthPickBtn.imageView?.image == UIImage(named: "bluecircle.svg"){ eighthPickBtn.setImage(UIImage(named: "lessthan.circle.svg"), for: .normal) }
        else if eighthPickBtn.imageView?.image == UIImage(named: "lessthan.circle.svg"){
        eighthPickBtn.setImage(UIImage(named: "bluecircle.svg"), for: .normal)
                }
    }
    
    

}
