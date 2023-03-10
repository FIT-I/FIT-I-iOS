//
//  TabManViewControllerr.swift
//  FITI
//
//  Created by 홍준혁 on 2023/01/09.
//

import Foundation
import UIKit
import Tabman
import Pageboy
import SnapKit
import SwiftUI

class TabManViewController: TabmanViewController {
    
    private let logoImage : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named:"Logo.svg")
        return imageView
    }()
    
    private lazy var heartListButton : UIButton = {
        let btn = UIButton()
        btn.snp.makeConstraints { make in
            make.height.width.equalTo(60)
        }
        btn.addTarget(self, action: #selector(moveToHeartList), for: .touchUpInside)
        return btn
    }()
    
    let customContainer : UIView = {
        let view = UIView()
        return view
    }()
    
    let titleLabel = UILabel().then {
        $0.text = "Home"
        $0.font = UIFont(name: "Avenir-Black", size: 30)
    }
    // Create bar
    let bar = TMBar.ButtonBar()

    
    // 페이징 할 뷰 컨트롤러
    var viewControllers: Array<UIViewController> = [HomeViewController(),DietTrainerViewController(),FoodTrainerViewController(),RehabilitationTrainerViewController(),FriendTrainerViewController()]


    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.dataSource = self
        self.bounces = false
        
        settingTabBar(ctBar: bar)
        
        print("HomeTabView")
        setUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setHeartIcon()
    }
    
    func setUI(){
        view.addSubview(customContainer)
        customContainer.addSubviews(logoImage, heartListButton)

        customContainer.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.height.equalTo(110)
            make.leading.equalToSuperview().offset(25)
            make.trailing.equalToSuperview().offset(-25)
        }
        logoImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(65)
            make.height.equalTo(35)
            make.width.equalTo(60)
            make.leading.equalToSuperview()
        }
        heartListButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(55)
            make.trailing.equalToSuperview()
        }
        addBar(bar, dataSource: self, at: .custom(view: customContainer, layout: { (bar) in
            bar.snp.makeConstraints { make in
                make.top.equalToSuperview().offset(120)
                make.leading.equalToSuperview()
                make.trailing.equalToSuperview()
            }
        }))
    }
    
    @objc func moveToHeartList(){
        let nextVC = HeartListViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    func settingTabBar(ctBar : TMBar.ButtonBar) {
        ctBar.layout.transitionStyle = .snap
        // 왼쪽 여백주기
        ctBar.layout.contentInset = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
        
        // 간격
        ctBar.layout.interButtonSpacing = 20
            
        ctBar.backgroundView.style = .blur(style: .light)
        
        // 선택 / 안선택 색 + font size
        ctBar.buttons.customize { (button) in
            button.tintColor = UIColor.black
            button.selectedTintColor = .black
            button.font = UIFont.systemFont(ofSize: 16)
            button.selectedFont = UIFont.systemFont(ofSize: 16, weight: .medium)
        }
        
        // 인디케이터 (영상에서 주황색 아래 바 부분)
        ctBar.indicator.weight = .custom(value: 2)
        ctBar.indicator.tintColor = UIColor.customColor(.blue)
    }
    
    func setHeartIcon(){
        print(HeartListViewController.heartList)
        if HeartListViewController.heartList.count > 0 {
            self.heartListButton.setImage(UIImage(named: "redHeartFill.svg"), for: .normal)
        }else {
            self.heartListButton.setImage(UIImage(named: "redHeart.svg"), for: .normal)
        }
    }
}

// MARK: - Extension

extension TabManViewController : PageboyViewControllerDataSource, TMBarDataSource {
  
  func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
 
      // MARK: -Tab 안 글씨들
      switch index {
      case 0:
          return TMBarItem(title: "개인 PT")
      case 1:
          return TMBarItem(title: "다이어트")
      case 2:
          return TMBarItem(title: "식단관리")
      case 3:
          return TMBarItem(title: "재활치료")
      case 4:
          return TMBarItem(title: "운동친구")
      default:
          let title = "Page \(index)"
          return TMBarItem(title: title)
      }
  }
  
  func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
      //위에서 선언한 vc array의 count를 반환합니다.
      return viewControllers.count
  }

  func viewController(for pageboyViewController: PageboyViewController,
                      at index: PageboyViewController.PageIndex) -> UIViewController? {
      return viewControllers[index]
  }

  func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
//      return nil
      return .at(index: 0)  // index를 통해 처음에 보이는 탭을 설정할 수 있다.
  }
}
