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
    
    let dictUsersFromDataBase = ["root": "root", "admin": "admin", "log": "pass"]
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        welcomeVC.welcomeUserName = "Welcome, \(userNameTF.text ?? "user")"
    }
    
    @IBAction func logInBtn() {
        guard passwordTF.text ?? "" == dictUsersFromDataBase[userNameTF.text ?? ""] else {
            let alert = UIAlertController(title: "Ошибка!", message: "Вы ввели неверное имя или пароль!", preferredStyle: .alert)
            let okBtn = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okBtn)
            
            present(alert, animated: true, completion: nil)
            return
        }
        performSegue(withIdentifier: "logToWelcome", sender: nil)
    }
    
    
    @IBAction func forgotUserName(_ sender: UIButton) {
        let alert = UIAlertController(title: "Забыли имя?", message: "Ваше имя - root", preferredStyle: .alert)
        let okBtn = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okBtn)
        
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func forgotPasswordButton() {
        let messageForAlert: String
        if let userPass = dictUsersFromDataBase[userNameTF.text ?? ""] {
            UIPasteboard.general.string = userPass
            messageForAlert = "Ваш пароль был скопирован в буфер обмена"
        } else {
            messageForAlert = "Введите верное имя пользователя"
        }
        let alert = UIAlertController(title: "Забыли пароль?", message: messageForAlert, preferredStyle: .alert)
        let okBtn = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okBtn)
        
        
        present(alert, animated: true, completion: nil)
    }
}
