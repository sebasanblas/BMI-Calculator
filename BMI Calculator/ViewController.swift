//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Sebastian San Blas on 10/06/2021.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    let numberToolbar: UIToolbar = UIToolbar()

    @IBOutlet var heightField: UITextField!

    @IBOutlet var weightField: UITextField!
        
    @IBOutlet var outputBMIField: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        heightField.keyboardType = .numberPad
        weightField.keyboardType = .numberPad
        let toolbar: UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0,  width: self.view.frame.size.width, height: 30))

        let flexSpace = UIBarButtonItem(barButtonSystemItem:    .flexibleSpace, target: nil, action: nil)
        let doneBtn: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(dismissMyKeyboard))

        toolbar.setItems([flexSpace, doneBtn], animated: false)

        toolbar.sizeToFit()

        self.heightField.inputAccessoryView = toolbar
        self.weightField.inputAccessoryView = toolbar
        outputBMIField.text = ""
    }


    @IBAction func calculateBMI(_ sender: Any) {
        print("Calculando")
        let x : Double? = Double(weightField.text!)
        let y : Double? = Double(heightField.text!)
        guard x != nil && y != nil else {
            print("Error")
               return
            }
        let result = calculateBMI(weight: x!, height: y!)
        outputBMIField.text = String(format: "%.2f", result)
        switch result {
        case ..<16:
            print("Severe Thinness")
            outputBMIField.backgroundColor = UIColor(red: 0/255, green: 159/255, blue: 184/255, alpha: 1.0)
        case 16..<17:
            print("Moderate Thinness")
            outputBMIField.backgroundColor = UIColor(red: 0/255, green: 159/255, blue: 184/255, alpha: 1.0)
        case 17..<18.5:
            print("Mild Thinness ")
            outputBMIField.backgroundColor = UIColor(red: 0/255, green: 159/255, blue: 184/255, alpha: 1.0)
        case 18.5..<25:
            print("Normal")
            outputBMIField.backgroundColor = UIColor(red: 0/255, green: 159/255, blue: 184/255, alpha: 1.0)
        case 25..<30:
            print("Overweight")
            outputBMIField.backgroundColor = UIColor(red: 0/255, green: 159/255, blue: 184/255, alpha: 1.0)
        case 30..<35:
            print("Obese Class I")
            outputBMIField.backgroundColor = UIColor(red: 0/255, green: 159/255, blue: 184/255, alpha: 1.0)
        case 35..<40:
            print("Obese Class II")
            outputBMIField.backgroundColor = UIColor(red: 0/255, green: 159/255, blue: 184/255, alpha: 1.0)
        case 40...:
            print("Obese Class III")
            outputBMIField.backgroundColor = UIColor(red: 0/255, green: 159/255, blue: 184/255, alpha: 1.0)
        default:
            fatalError()
        }
    }
    
    @objc func dismissMyKeyboard() {
        view.endEditing(true)
        print("Closing")
    }

    func calculateBMI(weight: Double, height: Double) -> Double {
        var result: Double
        result = (weight/pow(Double((height/100)), 2))
        print(result)
        return result
    }
}
