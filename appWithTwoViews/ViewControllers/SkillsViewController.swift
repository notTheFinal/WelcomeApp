//
//  SkillsViewController.swift
//  appWithTwoViews
//
//  Created by Александр on 22.04.2022.
//

import UIKit

class SkillsViewController: UIViewController {

    var hardSkillsList: [String]!
    var softSkillsList: [String]!
    
    @IBOutlet weak var skillsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showSkills()
        }
    
    private func showSkills() {
        skillsLabel.text?.append("👤SoftSkills👤\n")
        for softSkill in softSkillsList {
            skillsLabel.text?.append("- \(softSkill)\n")
        }
        
        skillsLabel.text?.append("\n")
        
        skillsLabel.text?.append("🛠HardSkills🛠\n")
        for hardSkill in hardSkillsList {
            skillsLabel.text?.append("- \(hardSkill)\n")
        }
    }
    
    }
    
    


