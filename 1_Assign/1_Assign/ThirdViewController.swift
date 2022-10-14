//
//  ThirdViewController.swift
//  1_Assign
//
//  Created by 고두영 on 2022/10/07.
//

import UIKit
import SnapKit

class ThirdViewController: UIViewController {
    
    private let welcomeLabel:UILabel = {
        let label = UILabel()
        label.text = "000님\n환영합니다"
        label.font = .boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var okButton:UIButton = {
        let button = UIButton()
        button.setTitle("확인", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .yellow
        button.addTarget(self, action: #selector(touchupFriend1Button), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let components:[Any] = [welcomeLabel, okButton]
        components.forEach{
            view.addSubview($0 as! UIView)
        }
        // Do any additional setup after loading the view.
        
        welcomeLabel.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(197)
            $0.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(144)
            $0.height.equalTo(60)
        }
        
        okButton.snp.makeConstraints {
            $0.top.equalTo(self.welcomeLabel.snp.bottom).offset(117)
            $0.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(21)
            $0.height.equalTo(44)
        }
    }
    
    private func presentToFriend1VC(){
        let Friend1VC = Friend1ViewController()
        Friend1VC.modalPresentationStyle = .fullScreen
        self.present(Friend1VC, animated: true, completion: nil)
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
