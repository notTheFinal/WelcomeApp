//
//  LoginViewController.swift
//  appWithTwoViews
//
//  Created by Александр on 10.04.2022.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    

    
    @IBAction func forgotUserName(_ sender: UIButton) {
        let alert = UIAlertController(title: "Забыли имя?", message: "Ваше имя - root", preferredStyle: .alert)
        let okBtn = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okBtn)
        
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func forgotPasswordButton() {
        let alert = UIAlertController(title: "Забыли пароль?", message: "Ваш пароль был скопирован в буфер обмена", preferredStyle: .alert)
        let okBtn = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okBtn)
        
        present(alert, animated: true, completion: nil)
        
        UIPasteboard.general.string = "root"
    }
}
