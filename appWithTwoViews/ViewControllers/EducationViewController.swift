//
//  EducationViewController.swift
//  appWithTwoViews
//
//  Created by Александр on 22.04.2022.
//

import UIKit

class EducationViewController: UIViewController {

    var educationList: [Education]!
    
    @IBOutlet weak var educationLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        showEducation()
    }
    
    private func showEducation() {
        for education in educationList {
            educationLabel.text?.append("🎓\(education.year)\n")
            educationLabel.text?.append("\(education.title)\n")
        }
    }

}
