//
//  ConverterViewController.swift
//  conversion-calc-ui
//
//  Created by Jasmine Tan on 7/12/18.
//  Copyright © 2018 Jasmine Tan. All rights reserved.
//

import UIKit

class ConverterViewController: UIViewController {
    var check = 0
    var decimalCheck = 0;
    var num: String = ""

    @IBAction func clearButton(_ sender: UIButton) {
        num = ""
        decimalCheck = 0
        inputDisplay.text = unit
        outputDisplay.text = currentConverter.outputUnit(unit: unit)
    }
    var currentConverter = Converter()
    var unit: String = ""
    @IBOutlet weak var outputDisplay: UITextField!
    @IBOutlet weak var inputDisplay: UITextField!
    @IBAction func numbers(_ sender: UIButton) {
        if(sender.tag < 11){
            unit = String(inputDisplay.text!.suffix(2))
            num += String(sender.tag-1)
            inputDisplay.text = num + " " + unit
        }
        if(sender.tag == 11){
            if(num == "" || decimalCheck == 1) {
                return
            }
            inputDisplay.text = num + "." + " " + unit
            num = num + "."
            decimalCheck = 1
        }
        if(sender.tag == 13 && check == 0){
            if(num.isEmpty){
                return
            }
            inputDisplay.text = "-" + inputDisplay.text!
            num = "-" + num
            check = 1
        }
        else if (sender.tag == 13 && check == 1){
            if(num.isEmpty){
                return
            }
            inputDisplay.text = String(inputDisplay.text!.dropFirst())
            num =  String(num.dropFirst())
            check = 0
        }
        unit = String(inputDisplay.text!.suffix(2))
        outputDisplay.text = String(format: "%.2f", currentConverter.convert(input: num, conversion: unit)) + " " + currentConverter.outputUnit(unit: unit)
    }
 
    @IBAction func click(_ sender: UIButton) {
        let actionSheet = UIAlertController(title: "Choose converter", message: nil, preferredStyle: .actionSheet)
        for currentConverter in currentConverter.array {
            actionSheet.addAction(UIAlertAction(title: currentConverter.label, style: .default) { action in
                self.outputDisplay.text = currentConverter.outputName
                self.inputDisplay.text = currentConverter.inputName
            })
        }
        present(actionSheet, animated: true)
        num = ""
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

         //Do any additional setup after loading the view.
        outputDisplay.text = currentConverter.array[0].outputName
        inputDisplay.text = currentConverter.array[0].inputName
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
