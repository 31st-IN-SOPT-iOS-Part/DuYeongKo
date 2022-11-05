//
//  ChatCollectionViewCell.swift
//  1_Assign
//
//  Created by 고두영 on 2022/11/04.
//

import UIKit
import SwiftyColor
import Then

class ChatCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "ChatCollectionViewCell"
    
    private let profileContainerView = UIView()
    private let profileImageView = UIImageView()
    private let nameLabel = UILabel().then {
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 13, weight: .semibold)
    }
    
    private let messageLabel = UILabel().then {
        $0.textColor = UIColor(red: 166/255, green: 166/255, blue: 166/255, alpha: 1)
        $0.font = .systemFont(ofSize: 12)
    }
 
    override init(frame: CGRect){
        super.init(frame: frame)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ChatCollectionViewCell {
    private func layout() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        
        [profileContainerView, profileImageView, nameLabel, messageLabel].forEach{
            contentView.addSubview($0)
        }
        
        profileContainerView.addSubview(profileImageView)
        profileContainerView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(16)
            $0.width.equalTo(48)
            $0.height.equalTo(43)
        }

        profileImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        nameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(15)
            $0.leading.equalTo(profileContainerView.snp.trailing).offset(11)
        }

        messageLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(3)
            $0.leading.equalTo(nameLabel)
        }
    }
    
    func dataBind(model: FriendModel){
        nameLabel.text = model.name
        messageLabel.text = model.message
        profileImageView.image = UIImage(named: model.profileImage)
    }
}
