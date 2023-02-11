//
//  HeartListViewController.swift
//  FITI
//
//  Created by 홍준혁 on 2023/01/08.
//

import UIKit

import SnapKit

class HeartListViewController: UIViewController {
    
    // MARK: - Properties
    
    static var heartList = [HeartList]()
    
    // MARK: - UI Components
    
    var myPageTitleLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir-Black", size: 20.0)
        label.text = "찜 목록"
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
    private let heartListTableView: UITableView = {
        let tableview = UITableView()
        return tableview
    }()
    private lazy var emptyHeartListImage : UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "emptyHeartList.svg")
        return imgView
    }()

    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setTableCell()
        setNavigationController()
        setViewHierarchy()
        setConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.getHeartListServer()
        heartListTableView.reloadData()
        setEmptyImage()
    }

    func setViewHierarchy(){
        view.addSubviews(myPageTitleLabel,
                         progressView,
                         heartListTableView,
                         emptyHeartListImage
        )
    }
    
    func setConstraints(){
        emptyHeartListImage.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalTo(233)
            make.width.equalTo(173)
        }
        myPageTitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(60)
            make.centerX.equalToSuperview()
        }
        progressView.snp.makeConstraints { make in
            make.top.equalTo(myPageTitleLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        heartListTableView.snp.makeConstraints { make in
            make.top.equalTo(progressView.snp.bottom)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    // MARK: - @objc Func
    
    @objc func backTapped(sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Func
    
    func setNavigationController(){
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.topItem?.title = ""
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image:UIImage(named: "leftIcon.svg"), style: .plain, target: self, action: #selector(backTapped))
    }
    func setTableCell(){
        heartListTableView.register(HeartListTableCell.self, forCellReuseIdentifier: HeartListTableCell.identifier)
        heartListTableView.delegate = self
        heartListTableView.dataSource = self
    }
    
    func setEmptyImage(){
        if HeartListViewController.heartList.count > 0 {
            heartListTableView.isHidden = false
            emptyHeartListImage.isHidden = true
        }else {
            heartListTableView.isHidden = true
            emptyHeartListImage.isHidden =  false
        }
    }
    
}

// MARK: - Extension

extension HeartListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("cell did touched")
        LoadingView.showLoading()
        self.getSpecificTrainerServer(trainerIdx: HeartListViewController.heartList[indexPath.row].trainerIdx)
        let trainerDetailVC = TrainerDetailViewController()
        TrainerDetailViewController.id = HeartListViewController.heartList[indexPath.row].trainerIdx
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            LoadingView.hideLoading()
            self.navigationController?.pushViewController(trainerDetailVC, animated: true)
        }
    }
}
extension HeartListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return HeartListViewController.heartList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HeartListTableCell.identifier, for: indexPath) as? HeartListTableCell ?? HeartListTableCell()
        cell.bindingHeartList(model: HeartListViewController.heartList[indexPath.row])
        cell.selectionStyle = .none
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

// MARK: - Network

extension HeartListViewController {
    func getSpecificTrainerServer(trainerIdx:Int){
        print("getSpecific")
        TrainerAPI.shared.getSpecificTrainerAPI(trainerIdx: trainerIdx) { response in
            guard let specificTrainerResponse = response?.result else { return }
            TrainerDetailViewController.specificTrainer = specificTrainerResponse
            BodyReviewView.previewReviewData = TrainerDetailViewController.specificTrainer.reviewDto ?? [ReviewDto]()
            print(specificTrainerResponse)
        }
    }
    func getHeartListServer(){
        print("getHeartList")
        MyPageAPI.shared.getHeartListAPI{ response in
            guard let heartListResponse = response?.result else { return }
            HeartListViewController.heartList = heartListResponse
        }
    }
}
