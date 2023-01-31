//
//  ChatViewController.swift
//  FITI
//
//  Created by 홍준혁 on 2023/01/01.
//

import UIKit

import SendbirdUIKit

class ChatViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let groupChannelListVC = SBUGroupChannelListViewController()
        let naviVC = UINavigationController(rootViewController: groupChannelListVC)
        self.present(naviVC, animated: true)
    }

}
