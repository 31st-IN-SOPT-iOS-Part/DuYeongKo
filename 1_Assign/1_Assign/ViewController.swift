//
//  ViewController.swift
//  1_Assign
//
//  Created by 고두영 on 2022/10/06.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    private let mainLabel:UILabel = {
        let label = UILabel()
        label.text = "카카오톡을 시작합니다"
        label.font = .boldSystemFont(ofSize: 22)
        label.textAlignment = .center
        return label
    }()
    
    private let subLabel:UILabel = {
        let label = UILabel()
        
        label.textColor = .gray
        label.text = "사용하던 카카오계정이 있다면\n이메일 또는 전화번호로 로그인해 주세요."
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 15)
        return label
    }()
    
    private let idTextField:UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .systemGray6
        textField.placeholder = "이메일 또는 전화번호"
        return textField
    }()
    
    private let pwTextField:UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .systemGray6
        textField.placeholder = "비밀번호"
        return textField
    }()
    
    private lazy var loginButton:UIButton = {
        let button = UIButton()
        button.setTitle("카카오계정 로그인", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = .systemGray6
        button.addTarget(self, action: #selector(touchupThirdButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var signinButton:UIButton = {
        let button = UIButton()
        button.setTitle("새로운 카카오계정 만들기", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .systemGray6
        button.addTarget(self, action: #selector(touchupNextButton), for: .touchUpInside)
        return button
    }()
    
    private let findLabel:UILabel = {
        let label = UILabel()
        label.text = "카카오계정 또는 비밀번호 찾기"
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 13)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let components:[Any] = [mainLabel, subLabel, idTextField, pwTextField, loginButton, signinButton, findLabel]
        components.forEach{
            view.addSubview($0 as! UIView)
        }
        
        mainLabel.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(40)
            $0.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(89)
            $0.height.equalTo(25)
        }
        
        subLabel.snp.makeConstraints {
            $0.top.equalTo(self.mainLabel.snp.bottom).offset(20)
            $0.leading.equalTo(self.view.safeAreaLayoutGuide.snp.leading).offset(67)
            $0.trailing.equalTo(self.view.safeAreaLayoutGuide.snp.trailing).offset(-68)
            //$0.height.equalTo(49)
        }
        
        idTextField.snp.makeConstraints {
            $0.top.equalTo(self.subLabel.snp.bottom).offset(60)
            $0.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(21)
            $0.height.equalTo(49)
        }
        
        pwTextField.snp.makeConstraints {
            $0.top.equalTo(self.idTextField.snp.bottom).offset(10)
            $0.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(21)
            $0.height.equalTo(49)
        }
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(self.pwTextField.snp.bottom).offset(35)
            $0.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(21)
            $0.height.equalTo(44)
        }
        
        signinButton.snp.makeConstraints {
            $0.top.equalTo(self.loginButton.snp.bottom).offset(10)
            $0.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(21)
            $0.height.equalTo(44)
        }
        
        findLabel.snp.makeConstraints {
            $0.top.equalTo(self.signinButton.snp.bottom).offset(15)
            $0.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(99)
            $0.height.equalTo(29)
        }
    }
    
    private func presentToThirdVC(){
        let thirdVC = ThirdViewController()
        thirdVC.modalPresentationStyle = .formSheet
        self.present(thirdVC, animated: true, completion: nil)
    }
    
    @objc
    private func touchupThirdButton(){
        presentToThirdVC()
    }
    
    private func pushToSecondVC(){
        let secondVC = SecondViewController()
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
    
    @objc
    private func touchupNextButton(){
        pushToSecondVC()
    }

}

