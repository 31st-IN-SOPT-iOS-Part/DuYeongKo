//
//  ViewController.swift
//  1_Assign
//
//  Created by 고두영 on 2022/10/06.
//

import UIKit

class ViewController: UIViewController {

    
    private let mainLabel:UILabel = {
        let label = UILabel(frame:CGRect(x:80, y:100, width:250, height:30))
        label.text = "카카오톡을 시작합니다"
        label.font = .boldSystemFont(ofSize: 25)
        return label
    }()
    
    private let subLabel:UILabel = {
        let label = UILabel(frame: CGRect(x:70, y:150, width:300, height:60))
        
        label.textColor = .gray
        label.text = "사용하던 카카오계정이 있다면\n이메일 또는 전화번호로 로그인해 주세요."
        label.numberOfLines = 0
        label.font = .boldSystemFont(ofSize: 15)
        return label
    }()
    
    private let idTextField:UITextField = {
        let textField = UITextField(frame: CGRect(x:30, y:250, width:300, height:30))
        textField.backgroundColor = .systemGray6
        textField.placeholder = "이메일 또는 전화번호"
        return textField
    }()
    
    private let pwTextField:UITextField = {
        let textField = UITextField(frame: CGRect(x:30, y:300, width:300, height:30))
        textField.backgroundColor = .systemGray6
        textField.placeholder = "비밀번호"
        return textField
    }()
    
    private lazy var loginButton:UIButton = {
        let button = UIButton(frame: CGRect(x:30, y:380, width:300, height:35))
        button.setTitle("카카오계정 로그인", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = .systemGray6
        button.addTarget(self, action: #selector(touchupThirdButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var signinButton:UIButton = {
        let button = UIButton(frame: CGRect(x:30, y:430, width:300, height:35))
        button.setTitle("새로운 카카오계정 만들기", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .systemGray6
        button.addTarget(self, action: #selector(touchupNextButton), for: .touchUpInside)
        return button
    }()
    
    private let findLabel:UILabel = {
        let label = UILabel(frame:CGRect(x:100, y:500, width:200, height:20))
        label.text = "카카오계정 또는 비밀번호 찾기"
        label.font = .boldSystemFont(ofSize: 15)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let components:[Any] = [mainLabel, subLabel, idTextField, pwTextField, loginButton, signinButton, findLabel]
        components.forEach{
            view.addSubview($0 as! UIView)
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

