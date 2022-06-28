//
//  RelultsViewController.swift
//  Tipsy
//
//  Created by Lyudmila Tokar on 3/14/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit

class RelultsViewController: UIViewController {

    @IBOutlet var totalLabel: UILabel!
    @IBOutlet var settingsLabel: UILabel!
    
    var perPerson: String?
    var numberOfPeople: Int?
    var tipsPrc: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        totalLabel.text = perPerson
        settingsLabel.text = "Split between \(numberOfPeople!) people, with \(tipsPrc!)% tip."
    }

    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
