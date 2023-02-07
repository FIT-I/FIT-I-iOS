//
//  ReportViewController.swift
//  FITI
//
//  Created by 홍준혁 on 2023/02/07.
//

import UIKit

import SnapKit
import Then

class ReportViewController: UIViewController {

    //MARK: - UI Components
    
    private lazy var reportLabel: UILabel = {
        let label = UILabel()
        label.text = "신고하기"
        label.textColor = UIColor.customColor(.blue)
        label.font = UIFont(name: "Noto Sans", size: 20.0)
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        return label
    }()
    private lazy var rectView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.customColor(.boxGray)
        return view
    }()
    private lazy var topLabel: UILabel = {
        let label = UILabel()
        label.text = "신고하기 사유 확인이 불가능한 경우 해당 신고는 무효됩니다."
        label.textAlignment = .center
        label.textColor = UIColor.customColor(.blue)
        label.font = UIFont(name: "Noto Sans", size: 20.0)
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        return label
    }()
    private lazy var requestButton: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = UIColor.customColor(.blue)
        btn.layer.cornerRadius = 10
        btn.setTitle("신고하기", for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 20, weight: .medium)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.layer.borderWidth = 1
        btn.layer.borderColor = UIColor.customColor(.blue).cgColor
        btn.addTarget(self, action: #selector(reportBtnEvent), for: .touchUpInside)
        return btn
    }()
    private lazy var grayView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.customColor(.gray)
        view.layer.cornerRadius = 8
        view.snp.makeConstraints { make in
            make.height.equalTo(70)
        }
        return view
    }()
    private lazy var reportingimgView: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "report.svg")
        return imgView
    }()
    private lazy var middleLabel: UILabel = {
        let label = UILabel()
        label.text = "신고하기 사유 확인이 불가능한 경우 해당 신고는 미조치됩니다."
        label.textColor = UIColor.black
        label.font = UIFont(name: "Noto Sans", size: 5.0)
        label.numberOfLines = 0
        return label
    }()
    private lazy var bottomLabel: UILabel = {
        let label = UILabel()
        label.text = "서비스 진행중 문제가 생겼다면 증빙자료(사진, 녹취록, 대화 내역)와 함께 이메일 fitiofficial@naver.com로 접수해주세요. 신고 결과는 별도의 안내를 드리지 않습니다."
        label.textColor = UIColor.customColor(.gray)
        label.font = UIFont(name: "Noto Sans", size: 15.0)
        label.numberOfLines = 0
        return label
    }()
    private lazy var contentScrollView = UIScrollView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .white
        $0.showsVerticalScrollIndicator = true
    }
    var reportStackView = ReportView()
    
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setBackgroundColor()
        self.topLabel.numberOfLines = 0
        setNavigationController()
        setViewHierarchy()
        setConstraints()

    }

    private func setViewHierarchy() {
        view.addSubviews(reportLabel, rectView, contentScrollView)
        contentScrollView.addSubviews(topLabel, requestButton, grayView, reportingimgView, middleLabel, reportStackView, bottomLabel)
    }

    private func setConstraints() {
        reportStackView.layer.cornerRadius = 8
        requestButton.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.top.equalTo(bottomLabel.snp.bottom).offset(34)
            make.bottom.equalToSuperview().offset(-25)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(15)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-15)
        }
        reportLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(60)
            $0.centerX.equalToSuperview()
        }
        rectView.snp.makeConstraints {
            $0.top.equalTo(reportLabel.snp.bottom).offset(20)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(5)
        }
        contentScrollView.snp.makeConstraints {
            $0.top.equalTo(rectView.snp.bottom)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.equalToSuperview()
        }
        topLabel.snp.makeConstraints { make in
            make.top.equalTo(rectView.snp.bottom).offset(25)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(49)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-48)
            make.height.equalTo(54)
        }
        grayView.snp.makeConstraints { make in
            make.top.equalTo(topLabel.snp.bottom).offset(25)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(15)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-15)
        }
        reportingimgView.snp.makeConstraints { make in
            make.top.equalTo(topLabel.snp.bottom).offset(50)
            make.leading.equalToSuperview().offset(40)
        }
        middleLabel.snp.makeConstraints { make in
            make.top.equalTo(topLabel.snp.bottom).offset(40)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(68)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-29)
        }
        reportStackView.snp.makeConstraints { make in
            make.top.equalTo(grayView.snp.bottom).offset(19)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(15)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-15)
            make.height.equalTo(186)
        }
        bottomLabel.snp.makeConstraints { make in
            make.top.equalTo(reportStackView.snp.bottom).offset(115)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-20)
        }
    }

    // MARK: - @objc Func

    @objc func backTapped(sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    @objc func reportBtnEvent(){
        let reportData = ReportRequest(trainerId: TrainerDetailViewController.id, reason: makeReportReasonString())
        self.reportAlert(reportData: reportData)
    }
    
    // MARK: - Func

    func setNavigationController(){
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.topItem?.title = ""
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image:UIImage(named: "leftIcon.svg"), style: .plain, target: self, action: #selector(backTapped))
    }
    
    func setBackgroundColor(){
        view.backgroundColor = .systemBackground
        reportStackView.backgroundColor = UIColor.customColor(.boxGray)
    }
    
    func reportAlert(reportData:ReportRequest){
        let alert = UIAlertController(title: "신고하기", message: "정말 신고하시겠습니까?", preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "계정신고", style: .default, handler: { okAction in
            self.postReportServer(body: reportData)
            print(reportData)
        })
        let noAction = UIAlertAction(title: "취소", style: .destructive, handler: { okAction in
        })
        alert.addAction(noAction)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    func makeReportReasonString()->String{
        var reportReason = String()
        for i in reportStackView.isFull {
            if i != "" {
                reportReason += (i+" & ")
            }else {
                continue
            }
        }
        return reportReason
    }
}

// MARK: - Network

extension ReportViewController {
    func postReportServer(body:ReportRequest){
        TrainerAPI.shared.reportTrainerAPI(body: body){ response in
            guard let reportResponse = response?.message else {return}
            print(reportResponse)
            self.navigationController?.popViewController(animated: true)
        }
    }
}
