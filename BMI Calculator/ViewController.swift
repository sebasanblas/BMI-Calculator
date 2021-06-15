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
        outputBMIField.backgroundColor = UIColor(red: 0/255, green: 185/255, blue: 26/255, alpha: 1.0)
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
            // Rojo R 216, G 36, B 7
            print("Severe Thinness")
            outputBMIField.backgroundColor = UIColor(red: 216/255, green: 36/255, blue: 7/255, alpha: 1.0)
        case 16..<17:
            //Naranja R 234, G 117, B 19
            print("Moderate Thinness")
            outputBMIField.backgroundColor = UIColor(red: 234/255, green: 117/255, blue: 19/255, alpha: 1.0)
        case 17..<18.5:
            //Amarillo R 229, G 203, B 14
            print("Mild Thinness ")
            outputBMIField.backgroundColor = UIColor(red: 229/255, green: 203/255, blue: 14/255, alpha: 1.0)
        case 18.5..<25:
            //Verde R 0, G 185, B 26
            print("Normal")
            outputBMIField.backgroundColor = UIColor(red: 0/255, green: 185/255, blue: 26/255, alpha: 1.0)
        case 25..<30:
            //Amarillo R 229, G 203, B 14
            print("Overweight")
            outputBMIField.backgroundColor = UIColor(red: 229/255, green: 203/255, blue: 14/255, alpha: 1.0)
        case 30..<35:
            //Naranja R 234, G 117, B 19
            print("Obese Class I")
            outputBMIField.backgroundColor = UIColor(red: 234/255, green: 117/255, blue: 19/255, alpha: 1.0)
        case 35..<40:
            //Rojo R 216, G 36, B 7
            print("Obese Class II")
            outputBMIField.backgroundColor = UIColor(red: 216/255, green: 36/255, blue: 7/255, alpha: 1.0)
        case 40...:
            //Bordó R 150, G 12, B 12
            print("Obese Class III")
            outputBMIField.backgroundColor = UIColor(red: 150/255, green: 12/255, blue: 12/255, alpha: 1.0)
        default:
            fatalError()
        }
        dismissMyKeyboard()
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
