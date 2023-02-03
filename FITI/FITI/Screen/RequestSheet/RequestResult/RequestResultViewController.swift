//
//  RequestResultViewController.swift
//  FITI
//
//  Created by 홍준혁 on 2023/01/04.
//

import UIKit
import SnapKit

struct meetSheet {
    var price: String = "0"
    var startDate: String = "시작일"
    var endDate: String = "종료일"
    var pickStyle: String = "픽업 형태를 선택해주세요."
}

class RequestResultViewController: UIViewController {

    // MARK: - Properties

    static var meetingSheet = meetSheet()
    private lazy var matchingRequestData = RequestMatchingRequest()
    
    // MARK: - UI Components
    
    private lazy var titleLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir-Black", size: 20.0)
        label.text = "매칭요청 확인"
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
    private lazy var requestSheetView = RequestSheet()
    private lazy var nextBtn : UIButton = {
        let btn = UIButton()
        btn.backgroundColor = UIColor.customColor(.blue)
        btn.layer.cornerRadius = 8
        btn.setTitle("요청하기", for: .normal)
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
        setNavigationController()
        setViewHierarchy()
        setConstraints()
    }
    override func viewWillAppear(_ animated: Bool) {
        setData()
    }
    
    func setViewHierarchy(){
        view.addSubviews(titleLabel,
                         nextBtn,
                         progressView,
                         requestSheetView
        )
    }
    
    func setConstraints(){
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(70)
            make.centerX.equalToSuperview()
        }
        progressView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(38)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        nextBtn.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.leading.equalToSuperview().offset(14)
            make.trailing.equalToSuperview().offset(-14)
            make.bottom.equalToSuperview().offset(-30)
        }
        requestSheetView.snp.makeConstraints { make in
            make.top.equalTo(progressView.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.bottom.equalTo(nextBtn.snp.top).offset(-100)
        }
    }
    
    // MARK: - @objc
    
    @objc func nextEvent(){
        setRequestData()
        let alert = UIAlertController(title: "매칭 요청", message: "매칭을 요청하시겠습니까? 작성해주신 매칭 요청서가 트레이너에게 전달됩니다.", preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "요청", style: .default, handler: { okAction in
            self.requestMatchSheetServer(trainerIndex: TrainerDetailViewController.id, body: self.matchingRequestData)
        })
        let noAction = UIAlertAction(title: "취소", style: .destructive, handler: { okAction in
        })
        alert.addAction(noAction)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    @objc func backTapped(sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Func
    
    func setNavigationController(){
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.topItem?.title = ""
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image:UIImage(named: "leftIcon.svg"), style: .plain, target: self, action: #selector(backTapped))
    }
    
    func metchingSuccessAlert(){
        let alert = UIAlertController(title: "매칭 요청", message: "매칭을 요청에 성공하였습니다. 트레이너가 매칭을 수락하면 매칭이 진행됩니다.", preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "확인", style: .default, handler: { okAction in
            self.getMatchingRequestList()
            let nextVC = TabBarController()
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5) {
                self.navigationController?.pushViewController(nextVC, animated: true)
            }
        })
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    func metchingFailAlert(message:String){
        let alert = UIAlertController(title: "매칭 실패", message: message + "보낸 매칭내역을 확인해주세요.", preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "확인", style: .default, handler: { okAction in
        })
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    func setData(){
        requestSheetView.hourPriceLabel.text = RequestResultViewController.meetingSheet.price + "원"
        requestSheetView.totalPriceLabel.text = RequestResultViewController.meetingSheet.price + "원"
        requestSheetView.pickUp.text = RequestResultViewController.meetingSheet.pickStyle
        requestSheetView.meetingStartDate.text = RequestResultViewController.meetingSheet.startDate
        requestSheetView.meetingEndDate.text = RequestResultViewController.meetingSheet.endDate
    }
    
    func setRequestData(){
        matchingRequestData.startAt = requestSheetView.meetingStartDate.text ?? ""
        matchingRequestData.finishAt = requestSheetView.meetingEndDate.text ?? ""
        if requestSheetView.pickUp.text == "제가 직접 갈게요." {
            matchingRequestData.type = "CUSTOMER_GO"
        }else {
            matchingRequestData.type = "TRAINER_GO"
        }
    }
}

// MARK: - Network

extension RequestResultViewController {
    func requestMatchSheetServer(trainerIndex:Int, body:RequestMatchingRequest){
        CustomerAPI.shared.requestMatchAPI(trainerIndex: trainerIndex, body: body){ response in
            if response?.isSuccess == true {
                self.metchingSuccessAlert()
            }else if response?.isSuccess == false {
                self.metchingFailAlert(message: response?.message ?? "")
            }
        }
    }
    func getMatchingRequestList(){
        print("getMatchingRequest")
        CustomerAPI.shared.getMatchingListAPI(){ response in
            CommunityViewController.matchingList = response?.result ?? [MatchingList]()
        }
    }
}
