//
//  WelcomeViewController.swift
//  appWithTwoViews
//
//  Created by Александр on 10.04.2022.
//

import UIKit

class WelcomeViewController: UIViewController {

    
    @IBOutlet weak var welcomeUserLabel: UILabel!
    var welcomeUserName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeGradientBackground()
        
        // Приветствуем юзера по имени из предыдущего view
        welcomeUserLabel.text = "Welcome, \(welcomeUserName ?? "user")!"
    }

    private func makeGradientBackground() {
        // градиентный фон
        let color1 = UIColor(red: 39 / 255, green: 66 / 255, blue: 155 / 255, alpha: 1).cgColor
        let color2 = UIColor(red: 56 / 255, green: 180 / 255, blue: 66 / 255, alpha: 1).cgColor
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [color1, color2]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0, y: 1)
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }


}
