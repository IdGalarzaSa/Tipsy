//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
  
  @IBOutlet var billTextField: UITextField!
  @IBOutlet var zeroPctButton: UIButton!
  @IBOutlet var tenPctButton: UIButton!
  @IBOutlet var twentyPctButton: UIButton!
  @IBOutlet var splitNumberLabel: UILabel!
  
  var currentTip: Float = 0.1
  var currentSplit: Int = 2
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  @IBAction func tipChange(_ sender: UIButton) {
    
    cleanSelection()
    billTextField.endEditing(true)
    
    if (sender.currentTitle == "0%"){
      zeroPctButton.isSelected = true
      currentTip = 0.0
    } else if (sender.currentTitle == "10%") {
      tenPctButton.isSelected = true
      currentTip = 0.1
    } else {
      twentyPctButton.isSelected = true
      currentTip = 0.2
    }
  }
  
  func cleanSelection(){
    zeroPctButton.isSelected = false
    tenPctButton.isSelected = false
    twentyPctButton.isSelected = false
  }
  
  @IBAction func stepperValueChanged(_ sender: UIStepper) {
    billTextField.endEditing(true)
    splitNumberLabel.text = String(format: "%.0f", sender.value)
    currentSplit = Int(sender.value)
  }
  
  @IBAction func calculatePressed(_ sender: UIButton) {
    billTextField.endEditing(true)
    performSegue(withIdentifier: "goToResultVC", sender: nil)
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "goToResultVC"{
      let restultViewController = segue.destination as! ResultViewController
      
      let totalBill = billTextField.text ?? "0"
      restultViewController.totalBill = Float(totalBill) ?? 0
      restultViewController.tip = currentTip
      restultViewController.split = Float(currentSplit)
    }
  }
  
  
}

