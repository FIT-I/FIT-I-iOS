//
//  CommunityViewController.swift
//  FITI
//
//  Created by 홍준혁 on 2023/01/01.
//

import UIKit
import SnapKit

class CommunityViewController: UIViewController {
    
    // MARK: - Properties
    
    static var matchingList = [MatchingList]()
    
    var titleLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir-Black", size: 20.0)
        label.text = "보낸 요청 확인"
        label.textColor = UIColor.customColor(.blue)
        return label
    }()
    
    private var progressView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.customColor(.boxGray)
        view.snp.makeConstraints { make in
            make.height.equalTo(5)
        }
        return view
    }()
    private lazy var requestTableView : UITableView = {
        let tableview = UITableView()
        return tableview
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setViewHierarchy()
        setConstraints()
        setTableView()
    }
    
    func setViewHierarchy(){
        view.addSubview(titleLabel)
        view.addSubview(progressView)
        view.addSubview(requestTableView)
    }
    
    func setConstraints(){
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(70)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        progressView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        requestTableView.snp.makeConstraints { make in
            make.top.equalTo(progressView.snp.bottom)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    func setTableView(){
        requestTableView.register(CommunityTableCell.self, forCellReuseIdentifier: CommunityTableCell.identifier)
        requestTableView.delegate = self
        requestTableView.dataSource = self
    }
    
    func setHeartIcon() {
        for i in 0..<TrainerDetailViewController.trainerHeartList.count {
            print(TrainerDetailViewController.trainerHeartList[i].trainerIdx)
            print(TrainerDetailViewController.id)
            if TrainerDetailViewController.trainerHeartList[i].trainerIdx == TrainerDetailViewController.id {
                TrainerDetailViewController.isHeartFull = true
                TrainerDetailViewController.heartBtn.setImage(UIImage(named: "heart.fill.svg"), for: .normal)
            }
        }
    }
}

// MARK: - Extension

extension CommunityViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let touchedCell = tableView.cellForRow(at: indexPath) as! CommunityTableCell
        self.getMatchingSheetServer(matchingIndex: touchedCell.matchingId)
        RequestSheetViewController.trainerIndex  = touchedCell.trainerId
        LoadingView.showLoading()
        let nextVC = RequestSheetViewController()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            LoadingView.hideLoading()
            self.navigationController?.pushViewController(nextVC, animated: true)
        }
    }
}

extension CommunityViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CommunityViewController.matchingList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CommunityTableCell.identifier, for: indexPath) as? CommunityTableCell ?? CommunityTableCell()
        cell.bindingMatchingRequestList(model: CommunityViewController.matchingList[indexPath.row])
        cell.selectionStyle = .none
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

// MARK: - Network

extension CommunityViewController {
    func getMatchingSheetServer(matchingIndex:Int){
        CustomerAPI.shared.getMatchingSheetAPI(matchingIndex: matchingIndex){ response in
            RequestSheetViewController.requestSheetData = response?.result ?? MatchSheet()
        }
    }
    func getHeartListServer(){
        print("getHeartList")
        MyPageAPI.shared.getHeartListAPI{ response in
            guard let heartListResponse = response?.result else { return }
            TrainerDetailViewController.trainerHeartList = heartListResponse
            self.setHeartIcon()
        }
    }
}
