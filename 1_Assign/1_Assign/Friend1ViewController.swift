//
//  Friend1ViewController.swift
//  1_Assign
//
//  Created by 고두영 on 2022/10/12.
//

import UIKit
import SnapKit

class Friend1ViewController: UIViewController {

    let friendLabel:UILabel = {
        let label = UILabel()
        label.text = "친구"
        label.font = .systemFont(ofSize: 22, weight: .black)
        return label
    }()
    
    let setImgView = UIImageView()
    
    lazy var imageButton:UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(touchupFriend2Button), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        configImageView()
        configButton()
        setLayout()
        // Do any additional setup after loading the view.
    }
    
    private func setLayout(){
        view.addSubview(friendLabel)
        
        friendLabel.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(12)
            $0.leading.equalTo(self.view.safeAreaLayoutGuide).inset(14)
            $0.width.equalTo(39)
            $0.height.equalTo(26)
        }
        
        view.addSubview(setImgView)
        
        setImgView.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(13)
            $0.leading.equalTo(self.friendLabel.snp.trailing).offset(4)
            // 이부분 유념!
            $0.width.equalTo(21)
            $0.height.equalTo(21)
        }
        
        view.addSubview(imageButton)
        
        imageButton.snp.makeConstraints {
            $0.top.equalTo(self.setImgView.snp.bottom).offset(30)
            $0.leading.equalTo(self.view.safeAreaLayoutGuide).offset(14)
            $0.width.equalTo(59)
            $0.height.equalTo(58)
        }
    }

    private func configImageView(){
        setImgView.image = UIImage(named: "settings 1")
    }
    
    private func configButton(){
        imageButton.setBackgroundImage(UIImage(named: "friendtab_profileImg"), for: .normal)
    }
    
    private func presentToFriend2VC(){
        let friend2VC = Friend2ViewController()
        friend2VC.modalPresentationStyle = .fullScreen
        self.present(friend2VC, animated: true, completion: nil)
    }
    
    @objc
    private func touchupFriend2Button(){
        presentToFriend2VC()
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
