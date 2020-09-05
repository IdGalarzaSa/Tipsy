//
//  ResultViewController.swift
//  Tipsy
//
//  Created by iOS Dev on 5/9/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
  
  @IBOutlet var totalLabel: UILabel!
  @IBOutlet var settingsLabel: UILabel!
  
  var totalBill: Float = 0
  var tip: Float = 0
  var split: Float = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    print("Total bill \(totalBill)")
    print("tip \(tip)")
    print("split \(split)")
    calculateTip()
    
  }
  
  func calculateTip(){
    let totalPerPerson = (totalBill * tip + totalBill) / split
    totalLabel.text = String(format: "%.2f", totalPerPerson)
    
    let stringSplit = String(format:"%.0f",split)
    let stringTip = String(format: "%.0f", tip * 100)
    settingsLabel.text = "Split between \(stringSplit) people, with \(stringTip)% tip."
  }
  
  @IBAction func recalculatePressed(_ sender: UIButton) {
    dismiss(animated: true, completion: nil)
  }
  
}
