//
//  SecondViewController.swift
//  1_Assign
//
//  Created by 고두영 on 2022/10/07.
//

import UIKit

class SecondViewController: UIViewController {
    
    private let idLabel:UILabel = {
        let label = UILabel(frame: CGRect(x:80, y:100, width:250, height:30))
        label.text = "카카오톡을 시작합니다"
        label.font = .boldSystemFont(ofSize: 25)
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
    
    private let checkTextField:UITextField = {
        let textField = UITextField(frame: CGRect(x:30, y:350, width:300, height:30))
        textField.backgroundColor = .systemGray6
        textField.placeholder = "비밀번호 확인"
        return textField
    }()
    
    private lazy var signinButton:UIButton = {
        let button = UIButton(frame: CGRect(x:30, y:430, width:300, height:35))
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

        // Do any additional setup after loading the view.
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
