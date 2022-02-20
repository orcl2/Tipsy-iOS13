//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by William Daniel da Silva Kuhs on 20/02/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    var bill: Bill!
    
    @IBOutlet weak var valuePerPersonLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateUI()
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func updateUI() {
        valuePerPersonLabel.text = String(format: "%.2f", bill.perPerson)
        descriptionLabel.text = "Split between \(bill.numberOfPeople) people, with \(bill.percentage.rawValue)% tip."
    }
}
