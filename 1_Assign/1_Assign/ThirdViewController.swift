//
//  ThirdViewController.swift
//  1_Assign
//
//  Created by 고두영 on 2022/10/07.
//

import UIKit

class ThirdViewController: UIViewController {
    
    private let welcomeLabel:UILabel = {
        let label = UILabel(frame: CGRect(x:80, y:250, width:250, height:60))
        label.text = "000님\n환영합니다"
        label.font = .boldSystemFont(ofSize: 25)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var okButton:UIButton = {
        let button = UIButton(frame: CGRect(x:30, y:430, width:300, height:35))
        button.setTitle("확인", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .yellow
        button.addTarget(self, action: #selector(touchupBackButton), for: .touchUpInside)
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
    }
    
    @objc
    private func touchupBackButton(){
        if self.navigationController == nil{
            self.dismiss(animated: true, completion: nil)
        }
        else{
            self.navigationController?.popViewController(animated: true)
        }
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
