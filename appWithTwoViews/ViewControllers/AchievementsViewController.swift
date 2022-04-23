//
//  AchievementsViewController.swift
//  appWithTwoViews
//
//  Created by Александр on 22.04.2022.
//

import UIKit

class AchievementsViewController: UIViewController {

    var achievementsList: [Achievement]!
    
    @IBOutlet weak var achievementsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        showAchievements()
    }
    
    private func showAchievements() {
        for achievement in achievementsList {
            achievementsLabel.text?.append("\(returnEmoji(achievement.place))\(achievement.year)\n")
            achievementsLabel.text?.append("- \(achievement.title)\n")
        }
    }

    private func returnEmoji(_ place: Int?) -> String {
        switch place {
        case 1:
            return "🥇"
        case 2:
            return "🥈"
        case 3:
            return "🥉"
        default:
            return "🎗"
        }
    }
}
