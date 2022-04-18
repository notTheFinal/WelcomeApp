//
//  LoginViewController.swift
//  appWithTwoViews
//
//  Created by Александр on 10.04.2022.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    private let dictUsersFromDataBase = ["root": "root", "admin": "admin", "log": "pass"]
    
    override func viewDidLoad() {
        userNameTF.delegate = self
        passwordTF.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        welcomeVC.welcomeUserName = "Welcome, \(userNameTF.text ?? "user")!"
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if (touches.first) != nil {
            view.endEditing(true)
        }
        super.touchesBegan(touches, with: event)
    }
    
    private func showAlert(_ title: String, _ message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okBtn = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okBtn)
        
        present(alert, animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case userNameTF:
            passwordTF.becomeFirstResponder()
            break
        default:
            logInBtn()
        }
        return true
    }

    
    @IBAction func logInBtn() {
        guard passwordTF.text ?? "" == dictUsersFromDataBase[userNameTF.text ?? ""] else {
            showAlert("Ошибка!", "Вы ввели неверное имя или пароль!")
            passwordTF.text = ""
            return
        }
        performSegue(withIdentifier: "logToWelcome", sender: nil)
    }
    
    @IBAction func forgotUserName(_ sender: UIButton) {
        showAlert("Забыли имя?", "Ваше имя - root")
    }
    
    @IBAction func forgotPasswordButton() {
        let messageForAlert: String
        if let userPass = dictUsersFromDataBase[userNameTF.text ?? ""] {
            UIPasteboard.general.string = userPass
            messageForAlert = "Ваш пароль был скопирован в буфер обмена"
        } else {
            messageForAlert = "Введите верное имя пользователя"
        }
        showAlert("Забыли пароль?", messageForAlert)
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameTF.text = ""
        passwordTF.text = ""
    }
}
