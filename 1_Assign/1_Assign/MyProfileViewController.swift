//
//  MyProfileViewController.swift
//  1_Assign
//
//  Created by 고두영 on 2022/10/14.
//

import UIKit
class MyProfileViewController: UIViewController {
    
    let closeImgView = UIImageView()
    let picImgView = UIImageView()
    
    let nameLabel:UILabel = {
        let label = UILabel()
        label.text = "김솝트"
        label.textColor = .white
        label.font = .systemFont(ofSize: 18, weight: .medium)
        return label
    }()
    
    lazy var firstClearButton:UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(touchupFriend1Button), for: .touchUpInside)
        // 터치 영역 구분되는지 확인하기 위한 버튼이벤트(의미없음)
        button.backgroundColor = UIColor(white: 1, alpha: 0)
        // 터치 영역만큼의 투명 버튼을 설정함
        return button
    }()
    let firstImgView = UIImageView()
    let firstLabel:UILabel = {
        let label = UILabel()
        label.text = "나와의 채팅"
        label.textColor = .white
        label.font = .systemFont(ofSize: 10)
        return label
    }()
    
    lazy var secondClearButton:UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(white: 1, alpha: 0)
        return button
    }()
    let secondImgView = UIImageView()
    let secondLabel:UILabel = {
        let label = UILabel()
        label.text = "프로필 편집"
        label.textColor = .white
        label.font = .systemFont(ofSize: 10)
        return label
    }()
    
    lazy var thirdClearButton:UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(white: 1, alpha: 0)
        return button
    }()
    let thirdImgView = UIImageView()
    let thirdLabel:UILabel = {
        let label = UILabel()
        label.text = "카카오스토리"
        label.textColor = .white
        label.font = .systemFont(ofSize: 10)
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red: 135/255, green: 145/255, blue: 152/255, alpha: 1)

        configImageView()
        setLayout()

    }
    
    private func setLayout(){
        view.addSubview(closeImgView)
        closeImgView.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(14)
            $0.leading.equalTo(self.view.safeAreaLayoutGuide).offset(18)
            $0.width.equalTo(13)
            $0.height.equalTo(14)
        }
        
        view.addSubview(picImgView)
        picImgView.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(470)
            $0.leading.equalTo(self.view.safeAreaLayoutGuide).offset(139)
            $0.width.equalTo(97)
            $0.height.equalTo(96)
        }
        
        view.addSubview(nameLabel)
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(self.picImgView.snp.bottom).offset(8)
            $0.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(164)
        }
        
        view.addSubview(firstClearButton)
        firstClearButton.snp.makeConstraints {
            $0.top.equalTo(self.nameLabel.snp.bottom).offset(53)
            $0.leading.equalTo(self.view.safeAreaLayoutGuide).offset(49)
            $0.width.equalTo(92.67)
            $0.height.equalTo(72)
        }
        
        view.addSubview(firstImgView)
        firstImgView.snp.makeConstraints {
            $0.top.equalTo(self.firstClearButton.snp.top).offset(22)
            $0.leading.equalTo(self.firstClearButton.snp.leading).offset(37.65)
            $0.width.equalTo(18.2)
            $0.height.equalTo(17.59)
        }
        
        view.addSubview(firstLabel)
        firstLabel.snp.makeConstraints {
            $0.top.equalTo(self.firstClearButton.snp.top).offset(48)
            $0.leading.equalTo(self.firstClearButton.snp.leading).offset(19.31)
            $0.width.equalTo(54.06)
            $0.height.equalTo(11)
        }
        
        view.addSubview(secondClearButton)
        secondClearButton.snp.makeConstraints {
            $0.top.equalTo(self.firstClearButton.snp.top)
            $0.leading.equalTo(self.firstClearButton.snp.trailing)
            $0.width.equalTo(self.firstClearButton.snp.width)
            $0.height.equalTo(self.firstClearButton.snp.height)
        }
        
        view.addSubview(secondImgView)
        secondImgView.snp.makeConstraints {
            $0.top.equalTo(self.secondClearButton.snp.top).offset(22)
            $0.leading.equalTo(self.secondClearButton.snp.leading).offset(37.65)
            $0.width.equalTo(18.2)
            $0.height.equalTo(17.59)
        }
        
        view.addSubview(secondLabel)
        secondLabel.snp.makeConstraints {
            $0.top.equalTo(self.secondClearButton.snp.top).offset(48)
            $0.leading.equalTo(self.secondClearButton.snp.leading).offset(19.31)
            $0.width.equalTo(54.06)
            $0.height.equalTo(11)
        }
        
        view.addSubview(thirdClearButton)
        thirdClearButton.snp.makeConstraints {
            $0.top.equalTo(self.firstClearButton.snp.top)
            $0.leading.equalTo(self.secondClearButton.snp.trailing)
            $0.width.equalTo(self.firstClearButton.snp.width)
            $0.height.equalTo(self.firstClearButton.snp.height)
        }
        
        view.addSubview(thirdImgView)
        thirdImgView.snp.makeConstraints {
            $0.top.equalTo(self.thirdClearButton.snp.top).offset(22)
            $0.leading.equalTo(self.thirdClearButton.snp.leading).offset(37.65)
            $0.width.equalTo(18.2)
            $0.height.equalTo(17.59)
        }
        
        view.addSubview(thirdLabel)
        thirdLabel.snp.makeConstraints {
            $0.top.equalTo(self.thirdClearButton.snp.top).offset(48)
            $0.leading.equalTo(self.thirdClearButton.snp.leading).offset(19.31)
            $0.width.equalTo(54.06)
            $0.height.equalTo(11)
        }

    }
    
    private func configImageView(){
        closeImgView.image = UIImage(named: "profile_closeBtn")
        picImgView.image = UIImage(named: "friendtab_profileImg")
        firstImgView.image = UIImage(named: "profileTalkImg")
        secondImgView.image = UIImage(named: "profile_editImg")
        thirdImgView.image = UIImage(named: "profileStoryImg")
    }
    
    private func presentToFriend1VC(){
        let friend1VC = FriendListViewController()
        friend1VC.modalPresentationStyle = .fullScreen
        self.present(friend1VC, animated: true, completion: nil)
    }
    
    @objc
    private func touchupFriend1Button(){
        presentToFriend1VC()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
