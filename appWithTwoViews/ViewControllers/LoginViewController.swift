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
    
    private let user = User.getInfoAboutMe()
    
    override func viewDidLoad() {
        userNameTF.delegate = self
        passwordTF.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tabBarController = segue.destination as! UITabBarController
        guard let viewControllers = tabBarController.viewControllers else { return }
        for viewController in viewControllers {
            if let welcomeVC = viewController as? WelcomeViewController {
                welcomeVC.welcomeUserName = user.person.fullName()
            } else if let educationVC = viewController as? EducationViewController {
                educationVC.educationList = user.person.education
            } else if let skillsVC = viewController as? SkillsViewController {
                skillsVC.hardSkillsList = user.person.hardSkills
                skillsVC.softSkillsList = user.person.softSkills
            } else if let achievementsVC = viewController as? AchievementsViewController {
                achievementsVC.achievementsList = user.person.achievements
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    private func showAlert(_ title: String, _ message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okBtn = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okBtn)
        
        present(alert, animated: true)
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
        guard passwordTF.text ?? "" == user.password else {
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
        if userNameTF.text == user.login {
            UIPasteboard.general.string = user.password
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
