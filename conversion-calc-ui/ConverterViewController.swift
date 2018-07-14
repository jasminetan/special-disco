//
//  ConverterViewController.swift
//  conversion-calc-ui
//
//  Created by Jasmine Tan on 7/12/18.
//  Copyright © 2018 Jasmine Tan. All rights reserved.
//

import UIKit
struct Converter{
    let label: String
    let inputName: String
    let outputName: String
}

class ConverterViewController: UIViewController {

    @IBOutlet weak var outputDisplay: UITextField!
    @IBOutlet weak var inputDisplay: UITextField!
    let array = [Converter(label: "farenheit to celcius", inputName: "°F", outputName: "°C"),
                 Converter(label: "celcius to farenheit", inputName: "°C", outputName: "°F"),
                 Converter(label: "celcius to farenheit", inputName: "°C", outputName: "°F"),
                 Converter(label: "miles to kilometers", inputName: "mi", outputName: "km"),
                 Converter(label: "kilometers to miles", inputName: "km", outputName: "mi")]
   
    var currentConverter: Converter?
    @IBAction func click(_ sender: UIButton) {
        let actionSheet = UIAlertController(title: "Choose converter", message: nil, preferredStyle: .actionSheet)
        for converter in array {
            actionSheet.addAction(UIAlertAction(title: converter.label, style: .default) { action in
                self.outputDisplay.text = converter.outputName
                self.inputDisplay.text = converter.inputName
            })
        }
        present(actionSheet, animated: true)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

         //Do any additional setup after loading the view.
        outputDisplay.text = array[0].outputName
        inputDisplay.text = array[0].inputName
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
