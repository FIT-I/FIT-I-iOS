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
    
    private let requestEmptyImage : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named:"requestEmptyImage.svg")
        return imageView
    }()
    
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
    
    
    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear")
        getHeartListServer()
        getMatchingRequestList()
        getFirstTrainerListServer(category:"pt",page:0,size:200,sort:["current"])
        getFirstTrainerListServer(category:"diet",page:0,size:200,sort:["current"])
        getSuccessMatchingListServer()
        requestTableView.reloadData()
        setEmptyImage()
    }
    
    func setViewHierarchy(){
        view.addSubviews(titleLabel,
                         progressView,
                         requestTableView,
                         requestEmptyImage
        )
    }
    
    func setConstraints(){
        requestEmptyImage.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalTo(233)
            make.width.equalTo(173)
        }
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
    
    func setEmptyImage(){
        if CommunityViewController.matchingList.count > 0 {
            requestEmptyImage.isHidden = true
            requestTableView.isHidden = false
        }else {
            requestEmptyImage.isHidden = false
            requestTableView.isHidden = true
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
}

// MARK: - Network

extension CommunityViewController {
    func getMatchingSheetServer(matchingIndex:Int){
        CustomerAPI.shared.getMatchingSheetAPI(matchingIndex: matchingIndex){ response in
            RequestSheetViewController.requestSheetData = response?.result ?? MatchSheet()
        }
    }
    func getMatchingRequestList(){
        CustomerAPI.shared.getMatchingListAPI(){ response in
//            CommunityViewController.matchingList = response?.result ?? [MatchingList]()
            guard let requestListresponse = response?.result else {return}
            if requestListresponse.count != 0 {
                CommunityViewController.matchingList = requestListresponse
            }else {
                CommunityViewController.matchingList = [MatchingList]()
            }
        }
    }
    func getHeartListServer(){
        print("getHeartList")
        MyPageAPI.shared.getHeartListAPI{ response in
            guard let heartListResponse = response?.result else { return }
            TrainerDetailViewController.trainerHeartList = heartListResponse
            HeartListViewController.heartList = heartListResponse
            self.setHeartIcon()
        }
    }
    func getFirstTrainerListServer(category:String,page:Int,size:Int,sort:[String]){
        TrainerAPI.shared.getFirstTrainerListAPI(category: category, page: page, size: size, sort: sort) { response in
            guard let trainerListResponse = response?.result.dto else { return }
            switch category {
            case "pt":
                HomeViewController.trainerList = trainerListResponse
            case "food":
                FoodTrainerViewController.trainerList = trainerListResponse
            case "diet":
                DietTrainerViewController.trainerList = trainerListResponse
            case "rehab":
                RehabilitationTrainerViewController.trainerList = trainerListResponse
            case "friend":
                FriendTrainerViewController.trainerList = trainerListResponse
            default: break
            }
        }
    }
    func getSuccessMatchingListServer(){
        CustomerAPI.shared.getSuccessMatchingListAPI(){ response in
            guard let successMatchingListResponse = response?.result else { return }
            if response?.isSuccess == true {
                MatchViewController.successMatchList = successMatchingListResponse
            }else {
                print("성공된 매칭을 불러오는데 실패했습니다.")
            }
        }
    }
}
