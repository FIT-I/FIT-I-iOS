//
//  ChatViewController.swift
//  FITI
//
//  Created by 홍준혁 on 2023/01/01.
//

import UIKit

import SnapKit

class MatchViewController: UIViewController {
    
    static var successMatchList = [SuccessMatchSheet]()
    
    private let matchEmptyImage : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named:"matchEmptyImage.svg")
        return imageView
    }()
    
    lazy var titleLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir-Black", size: 20.0)
        label.text = "매칭 내역 확인"
        label.textColor = UIColor.customColor(.blue)
        return label
    }()
    lazy var progressView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.customColor(.boxGray)
        view.snp.makeConstraints { make in
            make.height.equalTo(5)
        }
        return view
    }()
    private lazy var matchTableView : UITableView = {
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
        self.getMatchingRequestList()
        self.getFirstTrainerListServer(category: "pt", page: 0, size: 100, sort: ["recent,DESC"])
        self.getFirstTrainerListServer(category: "food", page: 0, size: 100, sort: ["recent,DESC"])
        self.getFirstTrainerListServer(category: "diet", page: 0, size: 100, sort: ["recent,DESC"])
        self.getFirstTrainerListServer(category: "rehab", page: 0, size: 100, sort: ["recent,DESC"])
        self.getFirstTrainerListServer(category: "friend", page: 0, size: 100, sort: ["recent,DESC"])
        matchTableView.reloadData()
        setEmptyImage()
    }
    func setViewHierarchy(){
        view.addSubviews(titleLabel,
                         progressView,
                         matchTableView,
                         matchEmptyImage
        )
        
    }
    func setConstraints(){
        matchEmptyImage.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalTo(265)
            make.width.equalTo(243)
        }
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(70)
            make.leading.equalToSuperview().offset(20)
        }
        progressView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        matchTableView.snp.makeConstraints { make in
            make.top.equalTo(progressView.snp.bottom)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    func setTableView(){
        matchTableView.register(MatchTableCell.self, forCellReuseIdentifier: MatchTableCell.identifier)
        matchTableView.delegate = self
        matchTableView.dataSource = self
    }
    
    func setEmptyImage(){
        if MatchViewController.successMatchList.count > 0 {
            matchEmptyImage.isHidden = true
            matchTableView.isHidden = false
        }else {
            matchEmptyImage.isHidden = false
            matchTableView.isHidden = true
        }
    }
}

extension MatchViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let touchedCell = tableView.cellForRow(at: indexPath) as! MatchTableCell
        print(touchedCell.trainerId)
        LoadingView.showLoading()
        self.getSpecificTrainerServer(trainerIdx: touchedCell.trainerId)
        let nextVC = TrainerDetailViewController()
        TrainerDetailViewController.id = touchedCell.trainerId
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            LoadingView.hideLoading()
            self.navigationController?.pushViewController(nextVC, animated: true)
        }
    }
}

extension MatchViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MatchViewController.successMatchList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MatchTableCell.identifier, for: indexPath) as? MatchTableCell ?? MatchTableCell()
        cell.bindingMatchingRequestList(model: MatchViewController.successMatchList[indexPath.row])
        cell.selectionStyle = .none
        cell.accessoryType = .disclosureIndicator
        return cell
    }
}

extension MatchViewController {
    func getSpecificTrainerServer(trainerIdx:Int){
        print("getSpecific")
        TrainerAPI.shared.getSpecificTrainerAPI(trainerIdx: trainerIdx) { response in
            guard let specificTrainerResponse = response?.result else { return }
            TrainerDetailViewController.specificTrainer = specificTrainerResponse
            BodyReviewView.previewReviewData = TrainerDetailViewController.specificTrainer.reviewDto ?? [ReviewDto]()
            print(specificTrainerResponse)
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
        
    func getMatchingRequestList(){
        CustomerAPI.shared.getMatchingListAPI(){ response in
//            guard let matchingListResponse = response?.result else { return }
//            if response?.isSuccess == true {
//                CommunityViewController.matchingList = matchingListResponse
//            }else {
//                print("매칭 보낸 목록을 불러오는데 실패했습니다.")
//            }
            guard let requestListresponse = response?.result else {return}
            if requestListresponse.count != 0 {
                CommunityViewController.matchingList = requestListresponse
            }else {
                CommunityViewController.matchingList = [MatchingList]()
            }
        }
    }
}

