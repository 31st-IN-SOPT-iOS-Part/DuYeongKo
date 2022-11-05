//
//  FriendListViewController.swift
//  1_Assign
//
//  Created by 고두영 on 2022/10/12.
//

import UIKit
import SnapKit
import SwiftyColor

class FriendListViewController: UIViewController {

    let friendLabel:UILabel = {
        let label = UILabel()
        label.text = "친구"
        label.font = .systemFont(ofSize: 22, weight: .medium)
        return label
    }()
    
    let setImgView = UIImageView()
    
    lazy var imageButton:UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(touchupFriend2Button), for: .touchUpInside)
        return button
    }()
    
    let nameLabel:UILabel = {
        let label = UILabel()
        label.text = "김솝트"
        label.font = .systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    let messageLabel:UILabel = {
        let label = UILabel()
        label.text = "상태메세지는 여기에"
        label.font = .systemFont(ofSize: 11)
        label.textColor = UIColor(red: 166/255, green: 166/255, blue: 166/255, alpha: 1)
        return label
    }()
    
    let underLineView:UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray4
        return view
    }()
                          
    private lazy var FriendTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorColor = .clear
        return tableView
    }()
    
    var friendList: [FriendModel] = [
        FriendModel(profileImage: "profileImage1", name: "김솝트", message: "김솝트임다"),
        FriendModel(profileImage: "profileImage2", name: "박솝트", message: "반갑습니당"),
        FriendModel(profileImage: "profileImage3", name: "최솝트", message: "졸려요"),
        FriendModel(profileImage: "profileImage4", name: "이솝트", message: "솝트최고"),
        FriendModel(profileImage: "profileImage5", name: "정솝트", message: "파이팅"),
        FriendModel(profileImage: "profileImage6", name: "오솝트", message: "오솝트임다"),
        FriendModel(profileImage: "profileImage7", name: "백솝트", message: "안녕하세요"),
        FriendModel(profileImage: "profileImage8", name: "한솝트", message: "배고파요"),
        FriendModel(profileImage: "profileImage9", name: "안솝트", message: "살려주세요")

]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        
        FriendTableView.delegate = self
        FriendTableView.dataSource = self
        configImageView()
        configButton()
        register()
        setLayout()
    }
    
    private func setLayout(){
        view.addSubview(friendLabel)
        friendLabel.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(15)
            $0.leading.equalTo(self.view.safeAreaLayoutGuide).inset(14)
            $0.width.equalTo(41)
            $0.height.equalTo(21)
        }
        
        view.addSubview(setImgView)
        setImgView.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(17)
            $0.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(15)
            $0.width.equalTo(19)
            $0.height.equalTo(19)
        }
        
        view.addSubview(imageButton)
        imageButton.snp.makeConstraints {
            $0.top.equalTo(self.setImgView.snp.bottom).offset(30)
            $0.leading.equalTo(self.view.safeAreaLayoutGuide).offset(14)
            $0.width.equalTo(59)
            $0.height.equalTo(58)
        }
        
        view.addSubview(nameLabel)
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(71)
            $0.leading.equalTo(self.view.safeAreaLayoutGuide).offset(86)
        }
        
        view.addSubview(messageLabel)
        messageLabel.snp.makeConstraints {
            $0.top.equalTo(self.nameLabel.snp.bottom).offset(6)
            $0.leading.equalTo(self.nameLabel.snp.leading)
        }
        
        view.addSubview(underLineView)
        underLineView.snp.makeConstraints {
            $0.top.equalTo(self.imageButton.snp.bottom).offset(7)
            $0.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(16)
            $0.width.equalTo(343)
            $0.height.equalTo(1)
        }
        
        view.addSubview(FriendTableView)
        FriendTableView.snp.makeConstraints {
            $0.top.equalTo(self.imageButton.snp.bottom).offset(7)
            $0.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
            $0.bottom.equalToSuperview()
            $0.height.equalTo(65 * friendList.count)
        }
    }
    
    private func register() {
        FriendTableView.register(FriendTableViewCell.self, forCellReuseIdentifier: FriendTableViewCell.identifier)
    }

    private func configImageView(){
        setImgView.image = UIImage(named: "settings 1")
    }
    
    private func configButton(){
        imageButton.setBackgroundImage(UIImage(named: "friendtab_profileImg"), for: .normal)
    }
    
    private func presentToFriend2VC(){
        let friend2VC = MyProfileViewController()
        friend2VC.modalPresentationStyle = .fullScreen
        self.present(friend2VC, animated: true, completion: nil)
    }
    
    @objc
    private func touchupFriend2Button(){
        presentToFriend2VC()
    }

}

extension FriendListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
}

extension FriendListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let friendCell = tableView.dequeueReusableCell(withIdentifier: FriendTableViewCell.identifier, for: indexPath)
                as? FriendTableViewCell else { return UITableViewCell() }
        friendCell.dataBind(model: friendList[indexPath.row])
        return friendCell
    }
    
    
}
