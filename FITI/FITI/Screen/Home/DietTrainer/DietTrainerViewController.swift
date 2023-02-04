//
//  DietTrainerViewController.swift
//  FITI
//
//  Created by 홍준혁 on 2023/01/09.
//

import Foundation
import UIKit
import Moya
import SnapKit

class DietTrainerViewController: UIViewController {
    
    // MARK: - Properties
    
    static var trainerList = [Dto]()
    
    // MARK: - UI Components
    
    let trainerTableView : UITableView = {
        let tableview = UITableView()
        return tableview
    }()
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        signInViewAddUI()
        signInViewSetUI()
        setTableView()
        getMatchingRequestList()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getHeartListServer()
    }
    
    func signInViewAddUI(){
        view.addSubview(trainerTableView)
    }
    func signInViewSetUI(){
        trainerTableView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(120)
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(-15)
            make.bottom.equalToSuperview().offset(-50)
        }
    }
    
    // MARK: - Func
    
    func setTableView(){
        trainerTableView.register(TrainerTableCell.self, forCellReuseIdentifier: TrainerTableCell.identifier)
        trainerTableView.delegate = self
        trainerTableView.dataSource = self
        trainerTableView.showsVerticalScrollIndicator = false
    }

}

// MARK: - Extension

extension DietTrainerViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let touchedCell = tableView.cellForRow(at: indexPath) as! TrainerTableCell
        LoadingView.showLoading()
        self.getSpecificTrainerServer(trainerIdx: touchedCell.id)
        let nextVC = TrainerDetailViewController()
        TrainerDetailViewController.id = touchedCell.id
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            LoadingView.hideLoading()
            self.navigationController?.pushViewController(nextVC, animated: true)
        }
    }
}

extension DietTrainerViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DietTrainerViewController.trainerList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TrainerTableCell.identifier, for: indexPath) as? TrainerTableCell ?? TrainerTableCell()
        cell.bindingTrainerList(model: DietTrainerViewController.trainerList[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
}

// MARK: - Network

extension DietTrainerViewController {
    func getSpecificTrainerServer(trainerIdx:Int){
        print("getSpecific")
        TrainerAPI.shared.getSpecificTrainerAPI(trainerIdx: trainerIdx) { response in
            guard let specificTrainerResponse = response?.result else { return }
            TrainerDetailViewController.specificTrainer = specificTrainerResponse
            BodyReviewView.previewReviewData = TrainerDetailViewController.specificTrainer.reviewDto ?? [ReviewDto]()
            print(specificTrainerResponse)
        }
    }
    func getMatchingRequestList(){
        CustomerAPI.shared.getMatchingListAPI(){ response in
            CommunityViewController.matchingList = response?.result ?? [MatchingList]()
        }
    }
    func getHeartListServer(){
        print("getHeartList")
        MyPageAPI.shared.getHeartListAPI{ response in
            guard let heartListResponse = response?.result else { return }
            TrainerDetailViewController.trainerHeartList = heartListResponse
        }
    }
}
