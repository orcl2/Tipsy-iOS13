//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    var bill: Bill!

    @IBOutlet weak var billValue: UITextField!
    
    @IBOutlet weak var zeroPercentButton: UIButton!
    @IBOutlet weak var tenPercentButton: UIButton!
    @IBOutlet weak var twentyPercentButton: UIButton!
    
    @IBOutlet weak var splitLabel: UILabel!
    
    @IBOutlet weak var stepper: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bill = Bill(totalWithoutTip: 0, percentage: .ten, numberOfPeople: 2)
        updateUI(with: bill)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        if let total = Float(billValue.text ?? "0"), total != 0 {
            
            bill.totalWithoutTip = total
            
            performSegue(withIdentifier: "goToResults", sender: nil)
        }
    }
    
    @IBAction func tipPercentagePressed(_ sender: UIButton) {
        var percentage = sender.currentTitle!
        percentage.removeLast()
        
        let tip = TipPercentage(rawValue: Int(percentage)!)
        
        setPercentageUI(with: tip!)
    }
    
    @IBAction func tipStepperChange(_ sender: UIStepper) {
        setSplitUI(with: Int(sender.value))
    }
    
    func resetButtonBackground() {
        zeroPercentButton.isSelected = false
        tenPercentButton.isSelected = false
        twentyPercentButton.isSelected = false
    }
    
    func setSplitUI(with value: Int) {
        bill.numberOfPeople = value
        splitLabel.text = String(value)
    }
    
    func setPercentageUI(with value: TipPercentage) {
        resetButtonBackground()
        
        bill.percentage = value
        
        switch value {
        case .zero:
            zeroPercentButton.isSelected = true
        case .ten:
            tenPercentButton.isSelected = true
        case .twenty:
            twentyPercentButton.isSelected = true
        }
    }
    
    func updateUI(with bill: Bill) {
        setPercentageUI(with: bill.percentage)
        setSplitUI(with: bill.numberOfPeople)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults" {
            let destinationVC = segue.destination as? ResultsViewController
            destinationVC?.bill = bill
        }
    }
}

