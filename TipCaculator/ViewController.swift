//
//  ViewController.swift
//  TipCaculator
//
//  Created by Jason Liu on 12/16/15.
//  Copyright © 2015 Xingjie Liu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billInput: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var percentageSelector: UISegmentedControl!
    
    let tipPercentages = [0.18, 0.20, 0.22]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Setup the percentageSelector.
        percentageSelector.removeAllSegments()
        for (idx, tipPercentage) in tipPercentages.enumerate() {
            percentageSelector.insertSegmentWithTitle("\(Int(tipPercentage * 100))%", atIndex: idx, animated: false)
        }
        percentageSelector.selectedSegmentIndex = 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onBillEdit(sender: AnyObject) {
        let tipPercentage = tipPercentages[percentageSelector.selectedSegmentIndex]
        let billDollar = Double(billInput.text ?? "0") ?? 0.0
        let tipDollar = billDollar * tipPercentage
        let totalDollar = billDollar + tipDollar
        tipLabel.text = String(format: "$%.2f", tipDollar)
        totalLabel.text = String(format: "$%.2f", totalDollar)
    }
    
    @IBAction func onCanvasTapped(sender: AnyObject) {
        view.endEditing(true)
    }
}

