//
//  PhotoGridViewController.swift
//  1_Assign
//
//  Created by 고두영 on 2022/10/31.
//

import UIKit

class PhotoGridViewController: UIViewController {
    
    let chatLabel:UILabel = {
        let label = UILabel()
        label.text = "채팅"
        label.font = .systemFont(ofSize: 22, weight: .medium)
        return label
    }()
    
    let openChatLabel:UILabel = {
        let label = UILabel()
        label.text = "오픈채팅"
        label.font = .systemFont(ofSize: 22, weight: .medium)
        label.textColor = UIColor(red: 166/255, green: 166/255, blue: 166/255, alpha: 1)
        return label
    }()
    
    lazy var plusButton:UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(touchupGalleryButton), for: .touchUpInside)
        return button
    }()
    
    let setImgView = UIImageView()
    let bannerImgView = UIImageView()
    
    private lazy var PhotoCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isScrollEnabled = true
        collectionView.showsVerticalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
    var FriendList: [FriendModel] = [
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
    
    final let kFriendInset: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    final let kFriendLineSpacing: CGFloat = 0
    final let kFriendInterItemSpacing: CGFloat = 21
    final let kCellHeight: CGFloat = 65

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        register()
        setLayout()
        configImageView()
        configButton()
    }
}

extension PhotoGridViewController {
    private func setLayout() {
        view.addSubview(chatLabel)
        chatLabel.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(15)
            $0.leading.equalTo(self.view.safeAreaLayoutGuide).offset(14)
        }
        
        view.addSubview(openChatLabel)
        openChatLabel.snp.makeConstraints {
            $0.top.equalTo(self.chatLabel.snp.top)
            $0.leading.equalTo(self.chatLabel.snp.trailing).offset(7)
        }
        
        view.addSubview(plusButton)
        plusButton.snp.makeConstraints {
            $0.top.equalTo(self.chatLabel.snp.top)
            $0.trailing.equalTo(self.view.safeAreaLayoutGuide.snp.trailing).inset(46)
            $0.width.equalTo(19)
            $0.height.equalTo(19)
        }
        
        view.addSubview(setImgView)
        setImgView.snp.makeConstraints {
            $0.top.equalTo(self.chatLabel.snp.top)
            $0.trailing.equalTo(self.view.safeAreaLayoutGuide.snp.trailing).inset(15)
            $0.width.equalTo(19)
            $0.height.equalTo(19)
        }
        
        view.addSubview(bannerImgView)
        bannerImgView.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(52)
            $0.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(16)
            $0.width.equalTo(343)
            $0.height.equalTo(71.06)
        }
        
        view.addSubview(PhotoCollectionView)
        PhotoCollectionView.snp.makeConstraints {
            $0.top.equalTo(self.bannerImgView.snp.bottom).offset(8.94)
            $0.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
            $0.bottom.equalToSuperview()
            $0.height.equalTo(calculateCellHeight())
        }
    }
    
    private func calculateCellHeight() -> CGFloat {
        let count = CGFloat(FriendList.count)
        let heightCount = count / 2 + count.truncatingRemainder(dividingBy: 2)
        return heightCount * kCellHeight + (heightCount - 1) * kFriendLineSpacing + kFriendInset.top + kFriendInset.bottom
    }
    
    private func register() {
        PhotoCollectionView.register(ChatCollectionViewCell.self, forCellWithReuseIdentifier: ChatCollectionViewCell.identifier)
    }
    
    private func configImageView(){
        setImgView.image = UIImage(named: "settings 1")
        bannerImgView.image = UIImage(named: "image 1")
    }
    
    private func configButton(){
        plusButton.setBackgroundImage(UIImage(named: "iconPlus"), for: .normal)
    }
    
    private func presentToGalleryVC(){
        let GalleryVC = GalleryCollectionViewController()
        GalleryVC.modalPresentationStyle = .fullScreen
        self.present(GalleryVC, animated: true, completion: nil)
    }
    
    @objc
    private func touchupGalleryButton(){
        presentToGalleryVC()
    }
}

extension PhotoGridViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width
        let doubleCellWidth = screenWidth - kFriendInset.left - kFriendInset.right - kFriendInterItemSpacing
        return CGSize(width: screenWidth, height: 65)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return kFriendLineSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return kFriendInterItemSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return kFriendInset
    }
}

extension PhotoGridViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return FriendList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let FriendCell = collectionView.dequeueReusableCell(withReuseIdentifier: ChatCollectionViewCell.identifier, for: indexPath)
                as? ChatCollectionViewCell else { return UICollectionViewCell() }
        FriendCell.dataBind(model: FriendList[indexPath.item])
        return FriendCell
    }
}
