//
//  DetailBodyIntroView.swift
//  FITI
//
//  Created by 홍준혁 on 2023/01/18.
//

import Foundation
import UIKit
import SnapKit
import Then

class DetailBodyIntroViewController: UIViewController {
    
    //MARK: - UI Components
    
    // 상단 회색 바
    private lazy var rectView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.customColor(.boxGray)
        return view
    }()
    
    private var introTextView : UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.backgroundColor = UIColor.customColor(.boxGray)
        textView.textColor = UIColor.customColor(.darkGray)
        textView.layer.cornerRadius = 16
        textView.isEditable = true
        textView.isScrollEnabled = false
        textView.font = UIFont.systemFont(ofSize: 15.0)
        textView.textContainerInset =  UIEdgeInsets(top: 0, left: 18, bottom: 10, right: 18)
        textView.text = "다양한 자격증을 바탕으로습니다.다양한 자격증을 바탕으로 친절하게 지도해드립니다. 스포애니 3년의 경력을 믿어주세요~!운동 지도를 비롯하여 저만의 체계적인 식단관리표를 활용하여 PT를 진행할 예정입니다. 단기간의 다이어트는 물론 장기적으로 신체 변화를 가져오는 것 또한 자신이 있습니다. 주 2회의 대면 지도를 권장하며 자세한 커리큘럼은 쪽지를 통해 상세히 설명해 드리겠습니다.다양한 자격증을 바탕으로 친절하게 지도해드립니다. 스포애니 3년의 경력을 믿어주세요~!운동 지도를 비롯하여 저만의 체계적인 식단관리표를 활용하여 PT를 진행할 예정입니다. 단기간의 다이어트는 물론 장기"
        return textView
    }()

    // 스크롤 뷰
    private lazy var contentScrollView = UIScrollView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .white
        $0.showsVerticalScrollIndicator = true
    }
    
    let introView = DetailBodyIntroView()
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.systemBackground
        
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.topItem?.title = ""
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image:UIImage(named: "leftIcon.svg"), style: .plain, target: self, action: #selector(backTapped))
        
        
        setIntroLayout()
        setViewLayer()
        self.dismissKeyboard()

    }
    
    func setIntroLayout() {
        contentScrollView.addSubviews(introView,introTextView)
        view.addSubview(contentScrollView)

        view.backgroundColor = .systemBackground
        
        introView.backgroundColor = UIColor.customColor(.boxGray)
        introTextView.backgroundColor = UIColor.customColor(.boxGray)
        
    }
    func setViewLayer() {
        introView.layer.cornerRadius = 16

        //MARK: - scrollViewLayout
        contentScrollView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.bottom.equalToSuperview()
        }
        
        introView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(30)
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(15)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).offset(-15)
            $0.height.equalTo(160)
        }
        
        introTextView.snp.makeConstraints {
            $0.top.equalTo(introView.snp.bottom).offset(-95)
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(15)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).offset(-15)
            $0.bottom.equalToSuperview().offset(-20)
        }

    }
    
    
    @objc func backTapped(sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }

    @objc func tapOKBtn(sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
   
}
