//
//  SecondViewController.swift
//  1_Assign
//
//  Created by 고두영 on 2022/10/07.
//

import UIKit

class SecondViewController: UIViewController {
    
    private let idLabel:UILabel = {
        let label = UILabel()
        label.text = "카카오톡을 시작합니다"
        label.font = .boldSystemFont(ofSize: 22)
        label.textAlignment = .center
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
    
    private let checkTextField:UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .systemGray6
        textField.placeholder = "비밀번호 확인"
        return textField
    }()
    
    private lazy var signinButton:UIButton = {
        let button = UIButton()
        button.setTitle("새로운 카카오계정 만들기", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .systemGray6
        button.addTarget(self, action: #selector(touchupThirdButton), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let components:[Any] = [idLabel, idTextField, pwTextField, checkTextField, signinButton]
        components.forEach{
            view.addSubview($0 as! UIView)
        }
        
        idLabel.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(40)
            $0.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(89)
            $0.height.equalTo(25)
        }
        
        idTextField.snp.makeConstraints {
            $0.top.equalTo(self.idLabel.snp.bottom).offset(116)
            $0.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(21)
            $0.height.equalTo(49)
        }
        
        pwTextField.snp.makeConstraints {
            $0.top.equalTo(self.idTextField.snp.bottom).offset(10)
            $0.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(21)
            //self.idTextField랑 leading trailing 하고싶은데 어떻게 할 수 있을지
            $0.height.equalTo(49)
        }
        
        checkTextField.snp.makeConstraints {
            $0.top.equalTo(self.pwTextField.snp.bottom).offset(10)
            $0.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(21)
            $0.height.equalTo(49)
        }
        
        signinButton.snp.makeConstraints {
            $0.top.equalTo(self.checkTextField.snp.bottom).offset(26)
            $0.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(21)
            $0.height.equalTo(44)
        }

        // Do any additional setup after loading the view.
        // 26
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
