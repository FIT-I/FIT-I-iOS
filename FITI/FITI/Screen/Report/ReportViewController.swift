//
//  ReportViewController.swift
//  FITI
//
//  Created by 여진홍 on 2023/02/03.
//

import UIKit
import SnapKit
import Then

class ReportViewController: UIViewController {
    
    //MARK: - UI Components
    
    // 상단 제목
    private lazy var reportLabel: UILabel = {
        let label = UILabel()
        label.text = "신고하기"
        label.textColor = UIColor.customColor(.blue)
        label.font = UIFont(name: "Noto Sans", size: 20.0)
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        return label
    }()

    // 상단 회색 바
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
    
    // 신고 버튼
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
    
    // 회색 view
    private lazy var grayView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.customColor(.gray)
        view.layer.cornerRadius = 8
        view.snp.makeConstraints { make in
            make.height.equalTo(70)
        }
        return view
    }()
     
    // 신고 이미지
    private lazy var reportingimgView: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "report.svg")
        return imgView
    }()
    
    // 신고 문구
    private lazy var middleLabel: UILabel = {
        let label = UILabel()
        label.text = "신고하기 사유 확인이 불가능한 경우 해당 신고는 미조치됩니다."
        label.textColor = UIColor.black
        label.font = UIFont(name: "Noto Sans", size: 5.0)
        label.numberOfLines = 0
        return label
    }()
    
    // 안내 문구
    private lazy var bottomLabel: UILabel = {
        let label = UILabel()
        label.text = "서비스 진행중 문제가 생겨다면 증빙자료(사진, 녹취록, 대화 내역)와 함께 이메일 yeossi8@naver.com로 접수해주세요. 신고 결과는 별도의 안내를 드리지 않습니다."
        label.textColor = UIColor.customColor(.gray)
        label.font = UIFont(name: "Noto Sans", size: 15.0)
        label.numberOfLines = 0
        return label
    }()
    
    // 스크롤 뷰
    private lazy var contentScrollView = UIScrollView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .white
        $0.showsVerticalScrollIndicator = true
    }
    
    // 이유 선택
    var reportStackView = ReportView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        reportStackView.backgroundColor = UIColor.customColor(.boxGray)
        
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.topItem?.title = ""
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image:UIImage(named: "multiply.svg"), style: .plain, target: self, action: #selector(backTapped))
        
        self.topLabel.numberOfLines = 0
//        self.middleLabel.numberOfLines = 0
        
        setViewHierarchy()
        setConstraints()
        
    }
    
    private func setViewHierarchy() {
        
        contentScrollView.addSubviews(reportLabel,rectView, topLabel, requestButton, grayView, reportingimgView, middleLabel, reportStackView, bottomLabel)
        view.addSubview(contentScrollView)
//        view.addSubview(reportLabel)
//        view.addSubview(rectView)
//        view.addSubview(topLabel)
//        view.addSubview(requestButton)
//        view.addSubview(grayView)
//        grayView.addSubviews(reportingimgView, middleLabel)
    }
    
    private func setConstraints() {
        reportStackView.layer.cornerRadius = 8
        requestButton.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.top.equalTo(bottomLabel.snp.bottom).offset(34)
         //   make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-25)
            make.bottom.equalToSuperview().offset(-25)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(15)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-15)
        }
        
      //  MARK: - scrollViewLayout
        contentScrollView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.bottom.equalToSuperview()
        }

        
        // MARK: - containerViewLayout
        reportLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.centerX.equalToSuperview()
        }

        rectView.snp.makeConstraints {
            $0.top.equalTo(reportLabel.snp.bottom).offset(18)
            $0.leading.equalTo(view.safeAreaLayoutGuide)
            $0.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(5)
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
           // make.height.equalTo(30)
        }
        
        reportStackView.snp.makeConstraints { make in
            make.top.equalTo(grayView.snp.bottom).offset(19)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(15)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-15)
            make.height.equalTo(276)
        }
        
        bottomLabel.snp.makeConstraints { make in
            make.top.equalTo(reportStackView.snp.bottom).offset(25)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-20)
        //    make.height.equalTo(22)
        }
        
        
    }
    
    
    
    
    @objc func backTapped(sender: UIBarButtonItem) {
            navigationController?.popViewController(animated: true)
        }
    
    @objc func reportBtnEvent(){
   //     let nextVC = ViewController()
   //     navigationController?.pushViewController(nextVC, animated: true)
    }
    

}
