//
//  HomeViewController.swift
//  FITI
//
//  Created by 홍준혁 on 2023/01/01.
//

import UIKit

import SnapKit
import Moya

class HomeViewController: UIViewController {
    
    // MARK: - Properties
    
    static var trainerList = [Dto]()
    
    // MARK: - UI Components
    
    private let trainerEmptyImage : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named:"trainerEmptyImage.svg")
        return imageView
    }()

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
    }

    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear")
        getMyPageServer()
        getHeartListServer()
        self.getFirstTrainerListServer(category: "pt", page: 0, size: 100, sort: ["recent,DESC"])
        self.getFirstTrainerListServer(category: "food", page: 0, size: 100, sort: ["recent,DESC"])
        self.getFirstTrainerListServer(category: "diet", page: 0, size: 100, sort: ["recent,DESC"])
        self.getFirstTrainerListServer(category: "rehab", page: 0, size: 100, sort: ["recent,DESC"])
        self.getFirstTrainerListServer(category: "friend", page: 0, size: 100, sort: ["recent,DESC"])
        self.getMatchingRequestList()
        self.getSuccessMatchingListServer()
        trainerTableView.reloadData()
        setEmptyImage()
    }
    
    func signInViewAddUI(){
        view.addSubview(trainerTableView)
        view.addSubview(trainerEmptyImage)
    }
    
    func signInViewSetUI(){
        trainerEmptyImage.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalTo(125)
            make.width.equalTo(250)
        }
        trainerTableView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(170)
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
    
    func setEmptyImage(){
        if HomeViewController.trainerList.count > 0 {
            trainerTableView.isHidden = false
            trainerEmptyImage.isHidden = true
        }else {
            trainerTableView.isHidden = true
            trainerEmptyImage.isHidden = false
        }
    }
}

// MARK: - Extension

extension HomeViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let touchedCell = tableView.cellForRow(at: indexPath) as! TrainerTableCell
        print(touchedCell.id)
        LoadingView.showLoading()
        self.getSpecificTrainerServer(trainerIdx: touchedCell.id)
        TrainerDetailViewController.id = touchedCell.id
    }
}
extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return HomeViewController.trainerList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TrainerTableCell.identifier, for: indexPath) as? TrainerTableCell ?? TrainerTableCell()
        cell.bindingTrainerList(model: HomeViewController.trainerList[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
}
extension HomeViewController {
    func getMyPageServer(){
        MyPageAPI.shared.getMyPageDataAPI { response in
            guard let myPageResponse = response?.result else { return }
            MyPageViewController.MyInfo.userName = myPageResponse.userName
            MyPageViewController.MyInfo.profile = myPageResponse.profile
            MyPageViewController.MyInfo.email = myPageResponse.email
            MyPageViewController.MyInfo.location = myPageResponse.location ?? "위치 설정을 해주세요."
        }
    }
    func getSpecificTrainerServer(trainerIdx:Int){
        print("getSpecific")
        TrainerAPI.shared.getSpecificTrainerAPI(trainerIdx: trainerIdx) { response in
            guard let specificTrainerResponse = response?.result else { return }
            TrainerDetailViewController.specificTrainer = specificTrainerResponse
            BodyReviewView.previewReviewData = TrainerDetailViewController.specificTrainer.reviewDto ?? [ReviewDto]()
            print(specificTrainerResponse)
            let nextVC = TrainerDetailViewController()
            LoadingView.hideLoading()
            self.navigationController?.pushViewController(nextVC, animated: true)
        }
    }
    func getHeartListServer(){
        print("getHeartList")
        MyPageAPI.shared.getHeartListAPI{ response in
            guard let heartListResponse = response?.result else { return }
            TrainerDetailViewController.trainerHeartList = heartListResponse
        }
    }
    func getMatchingRequestList(){
        CustomerAPI.shared.getMatchingListAPI(){ response in
            guard let requestListresponse = response?.result else {return}
            if requestListresponse.count != 0 {
                CommunityViewController.matchingList = requestListresponse
            }else {
                CommunityViewController.matchingList = [MatchingList]()
            }
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
