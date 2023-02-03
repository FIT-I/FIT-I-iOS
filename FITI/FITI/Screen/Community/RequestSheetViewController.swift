//
//  RequestSheetViewController.swift
//  FITI
//
//  Created by 홍준혁 on 2023/02/02.
//

import Foundation
import SnapKit
import UIKit

class RequestSheetViewController: UIViewController {
    
    // MARK: - Properties
    
    static var requestSheetData = MatchSheet()
    static var trainerIndex = Int()
    
    // MARK: - UI Components
    
    private lazy var titleLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir-Black", size: 20.0)
        label.text = "요청서 확인"
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
    
    private lazy var requestSheet = RequestSheet()
    private lazy var lineView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.customColor(.gray)
        view.snp.makeConstraints { make in
            make.height.equalTo(1)
        }
        return view
    }()
    lazy var meetingLocationTextLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15.0)
        label.text = "매칭 장소"
        label.textColor = UIColor.customColor(.blue)
        return label
    }()
    lazy var meetingLoctionLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir-Black", size: 15.0)
        label.textColor = UIColor.customColor(.blue)
        return label
    }()
    private lazy var nextBtn : UIButton = {
        let btn = UIButton()
        btn.backgroundColor = UIColor.customColor(.blue)
        btn.layer.cornerRadius = 8
        btn.setTitle("트레이너 정보 조회", for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.layer.borderWidth = 1
        btn.layer.borderColor = UIColor.customColor(.blue).cgColor
        btn.addTarget(self, action: #selector(nextEvent), for: .touchUpInside)
        return btn
    }()
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        self.setNavigationController()
        setViewHierarchy()
        setConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setRequestSheetData(model: RequestSheetViewController.requestSheetData)
    }
    
    func setViewHierarchy(){
        view.addSubviews(titleLabel,
                         progressView,
                         requestSheet,
                         lineView,
                         meetingLocationTextLabel,
                         meetingLoctionLabel,
                         nextBtn
        )
    }
    
    func setConstraints(){
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(60)
            make.centerX.equalToSuperview()
        }
        progressView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        requestSheet.snp.makeConstraints { make in
            make.top.equalTo(progressView.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.bottom.equalTo(nextBtn.snp.top).offset(-80)
        }
        lineView.snp.makeConstraints { make in
            make.top.equalTo(requestSheet.pickUp.snp.bottom).offset(20)
            make.leading.equalTo(requestSheet.pickUpLabel.snp.leading)
            make.trailing.equalTo(requestSheet.pickUp.snp.trailing)
        }
        meetingLocationTextLabel.snp.makeConstraints { make in
            make.top.equalTo(lineView.snp.bottom).offset(20)
            make.leading.equalTo(requestSheet.pickUpLabel.snp.leading)
            make.trailing.equalTo(requestSheet.pickUp.snp.trailing)
        }
        meetingLoctionLabel.snp.makeConstraints { make in
            make.top.equalTo(lineView.snp.bottom).offset(20)
            make.trailing.equalTo(requestSheet.pickUp.snp.trailing)
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
        LoadingView.showLoading()
        self.getSpecificTrainerServer(trainerIdx: RequestSheetViewController.trainerIndex)
        TrainerDetailViewController.id = RequestSheetViewController.trainerIndex
        let nextVC = TrainerDetailViewController()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            LoadingView.hideLoading()
            self.navigationController?.pushViewController(nextVC, animated: true)
        }
    }
    @objc func backTapped(sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
    //MARK: - Func
    
    func setRequestSheetData(model:MatchSheet){
        requestSheet.meetingEndDate.text = model.matchingFinish
        requestSheet.meetingStartDate.text = model.matchingStart
        requestSheet.hourPriceLabel.text = model.pricePerHour
        requestSheet.totalPriceLabel.text = model.totalPrice
        self.meetingLoctionLabel.text = model.location
        if model.pickUpType == "TRAINER_GO" {
            requestSheet.pickUp.text = "트레이너님이 와주세요."
        }else if model.pickUpType == "CUSTOMER_GO" {
            requestSheet.pickUp.text = "제가 직접 갈게요."
        }else {
            requestSheet.pickUp.text = "매칭 장소를 설정하지 않았습니다."
        }
    }
    func setNavigationController(){
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.topItem?.title = ""
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image:UIImage(named: "leftIcon.svg"), style: .plain, target: self, action: #selector(backTapped))
    }
}

extension RequestSheetViewController {
    func getSpecificTrainerServer(trainerIdx:Int){
        print("getSpecific")
        TrainerAPI.shared.getSpecificTrainerAPI(trainerIdx: trainerIdx) { response in
            guard let specificTrainerResponse = response?.result else { return }
            TrainerDetailViewController.specificTrainer = specificTrainerResponse
            BodyReviewView.previewReviewData = TrainerDetailViewController.specificTrainer.reviewDto ?? [ReviewDto]()
            print(specificTrainerResponse)
        }
    }
}
