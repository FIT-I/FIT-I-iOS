//
//  PickServiceViewController.swift
//  FITI
//
//  Created by 홍준혁 on 2023/01/04.
//

import UIKit
import SnapKit

class PickServiceViewController: UIViewController {
    
    // MARK: - UI Components

    private lazy var titleLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir-Black", size: 20.0)
        label.text = "서비스 선택"
        label.textColor = UIColor.customColor(.blue)
        return label
    }()
    private lazy var progressView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.customColor(.boxGray)
        view.snp.makeConstraints { make in
            make.height.equalTo(5)
        }
        return view
    }()
    private lazy var grayView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.lightGray
        view.snp.makeConstraints { make in
            make.height.equalTo(5)
        }
        return view
    }()
    private lazy var subTitleLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir-Black", size: 20.0)
        label.text = "서비스 선택하기"
        label.textColor = UIColor.black
        return label
    }()
    private lazy var meetingTitleLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir-Black", size: 20.0)
        label.text = "매칭기간 선택하기"
        label.textColor = UIColor.black
        return label
    }()
    private lazy var startDateLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17.0)
        label.text = "시작"
        label.textColor = UIColor.black
        return label
    }()
    private lazy var endDateLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17.0)
        label.text = "종료"
        label.textColor = UIColor.black
        return label
    }()
    private lazy var dateLabelStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [startDateLabel,endDateLabel])
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.alignment = .leading
        return stackView
    }()
    private lazy var startDatePicker : UIDatePicker = {
        let picker = UIDatePicker()
        picker.preferredDatePickerStyle = .compact
        picker.datePickerMode = .date
        return picker
    }()
    private lazy var endDatePicker : UIDatePicker = {
        let picker = UIDatePicker()
        picker.preferredDatePickerStyle = .compact
        picker.datePickerMode = .date
        return picker
    }()
    private lazy var datePickerStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [startDatePicker,endDatePicker])
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .leading
        return stackView
    }()
    private lazy var nextBtn : UIButton = {
        let btn = UIButton()
        btn.backgroundColor = UIColor.customColor(.blue)
        btn.layer.cornerRadius = 8
        btn.setTitle("다음", for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.layer.borderWidth = 1
        btn.layer.borderColor = UIColor.customColor(.blue).cgColor
        btn.addTarget(self, action: #selector(nextEvent), for: .touchUpInside)
        return btn
    }()
    private lazy var priceLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20.0)
        label.textColor = UIColor.black
        return label
    }()
    private lazy var pickStackView = PickServiceView()

    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setViewHierarchy()
        setConstraints()
        setNavigationController()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setPriceData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        setDate()
    }
    
    private func setViewHierarchy() {
        view.addSubviews(titleLabel,
                         progressView,
                         subTitleLabel,
                         nextBtn,
                         pickStackView,
                         priceLabel,
                         meetingTitleLabel,
                         dateLabelStackView,
                         datePickerStackView
        )
        progressView.addSubview(grayView)
    }
    
    private func setConstraints(){
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(70)
            make.centerX.equalToSuperview()
        }
        progressView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(38)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        grayView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.width.equalToSuperview().dividedBy(2)
        }
        subTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(grayView.snp.bottom).offset(33)
            make.leading.equalToSuperview().offset(30)
        }
        pickStackView.snp.makeConstraints { make in
            make.top.equalTo(subTitleLabel.snp.bottom).offset(30)
            make.leading.equalToSuperview().offset(30)
            make.height.equalTo(80)
        }
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(subTitleLabel.snp.bottom).offset(30)
            make.trailing.equalToSuperview().offset(-30)
            make.height.equalTo(80)
        }
        meetingTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(priceLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(30)
        }
        dateLabelStackView.snp.makeConstraints { make in
            make.top.equalTo(meetingTitleLabel.snp.bottom).offset(38)
            make.leading.equalToSuperview().offset(30)
        }
        datePickerStackView.snp.makeConstraints { make in
            make.top.equalTo(meetingTitleLabel.snp.bottom).offset(30)
            make.trailing.equalToSuperview().offset(-30)
        }
        nextBtn.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.leading.equalToSuperview().offset(14)
            make.trailing.equalToSuperview().offset(-14)
            make.bottom.equalToSuperview().offset(-30)
        }
    }
    
    // MARK: - @objc Func
    
    @objc func nextEvent(){
        let nextVC = PickPlaceViewController()
        navigationController?.pushViewController(nextVC, animated: false)
    }
    @objc func backTapped(sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
    //MARK: - Func
    
    func setNavigationController(){
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.topItem?.title = ""
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image:UIImage(named: "leftIcon.svg"), style: .plain, target: self, action: #selector(backTapped))
    }
    func setPriceData(){
        self.priceLabel.text = String(TrainerDetailViewController.specificTrainer.cost) + "원"
    }
}

extension PickServiceViewController{
    func setDate(){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        RequestResultViewController.meetingSheet.startDate = dateFormatter.string(from: startDatePicker.date)
        RequestResultViewController.meetingSheet.endDate = dateFormatter.string(from: endDatePicker.date)
    }
}
