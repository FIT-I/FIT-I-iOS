//
//  TrainerDetailViewController.swift
//  FITI
//
//  Created by 홍준혁 on 2023/01/03.
//

import UIKit
import Then
import SnapKit

class TrainerDetailViewController: UIViewController {

    // 스크롤 뷰
    private lazy var contentScrollView = UIScrollView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .white
        $0.showsVerticalScrollIndicator = true
//        $0.backgroundColor = .red
    }
    
    // 하단 탭바 뷰
    private let toolBarContainerView : UIView = {
        let view = UIView()
        return view
    }()
    
    private let matchingRequest : UIButton = {
        let btn = UIButton()
        btn.backgroundColor = UIColor.customColor(.blue)
        btn.layer.cornerRadius = 8
        btn.setTitle("매칭 요청", for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.layer.borderWidth = 1
        btn.layer.borderColor = UIColor.customColor(.blue).cgColor
        btn.addTarget(self, action: #selector(matchingRequestTouched), for: .touchUpInside)
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        // Do any additional setup after loading the view.
        
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.topItem?.title = ""
        
        signInViewAddUI()
        signInViewSetUI()
        
    }
    
    func signInViewAddUI(){
        toolBarContainerView.addSubview(matchingRequest)
        
        view.addSubview(contentScrollView)
        view.addSubview(toolBarContainerView)
    }
    
    func signInViewSetUI(){
        
        contentScrollView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().offset(-110)
        }
        
        toolBarContainerView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.equalTo(contentScrollView.snp.bottom).offset(22)
            make.bottom.equalToSuperview()
        }
        
        matchingRequest.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview().offset(-40)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-14)
        }
    }
    
    @objc func matchingRequestTouched(){
        let alert = UIAlertController(title: "같이 운동해요!", message: "트레이너에게 매칭 요청을 보내겠습니까?", preferredStyle: UIAlertController.Style.alert)

        let okAction = UIAlertAction(title: "예", style: .default, handler: { okAction in
        })
        let noAction = UIAlertAction(title: "아니요", style: .destructive, handler: { okAction in
        })
        
        alert.addAction(noAction)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    


}
