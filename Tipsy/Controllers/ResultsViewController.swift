//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Diego Bustos on 2021-01-17.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var tip = 0.0
    var split: Int = 2
    var result = "0.0"
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionLabel.text = "Split between \(split) people, with \(Int(tip*100))% tip."
        totalLabel.text = result
        // Do any additional setup after loading the view.
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
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
