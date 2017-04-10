//
//  ViewController.swift
//
//  GilbertHLam
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var binaryButton : UIButton!
    @IBOutlet var decimalButton : UIButton!
    @IBOutlet var hexButton : UIButton!
    @IBOutlet var result : UITextField!
    @IBAction func binaryButtonClicked(sender : AnyObject) {
        binaryButton.backgroundColor = UIColor.green
        decimalButton.backgroundColor = UIColor.red
        hexButton.backgroundColor = UIColor.red
        binaryButton.tintColor = UIColor.gray
        decimalButton.tintColor = UIColor.blue
        hexButton.tintColor = UIColor.blue
        if(catchError() == true){
            result.backgroundColor = UIColor.white
            let entryString = result.text?.components(separatedBy: ":")
            let type = entryString?[0]
            let number = entryString?[1]
            if type == "d"{
                //Conversion from decimal to boolean
                let resultNumber = String(Int(number!)!, radix : 2)
                result.text = String(describing: "b:" + resultNumber)
            }
            else if type == "h"{
                //Conversion from hex to boolean
                let resultNumber = String(Int(number!, radix: 16)!, radix: 2)
                result.text = String(describing: "b:" + resultNumber)
            }
        }
        else {
            result.text = "ERROR"
            result.backgroundColor = UIColor.red
        }
        
    }
    @IBAction func decimalButtonClicked(sender : AnyObject) {
        binaryButton.backgroundColor = UIColor.red
        decimalButton.backgroundColor = UIColor.green
        hexButton.backgroundColor = UIColor.red
        binaryButton.tintColor = UIColor.blue
        decimalButton.tintColor = UIColor.gray
        hexButton.tintColor = UIColor.blue
        if(catchError() == true) {
            result.backgroundColor = UIColor.white
            let entryString = result.text?.components(separatedBy: ":")
            let type = entryString?[0]
            let number = entryString?[1]
            if type == "b"{
                //Conversion from boolean to decimal
                let resultNumber = Int(String(number!), radix: 2)!
                result.text = String(describing: "d:" + String(resultNumber))
            }
            else if type == "h"{
                //Conversion from hex to decimal
                let resultNumber = Int(String(number!), radix: 16)!
                result.text = String(describing: "d:" + String(resultNumber))
            }
        }
        else {
            result.text = "ERROR"
            result.backgroundColor = UIColor.red
        }
    }
    @IBAction func hexButtonClicked(sender : AnyObject) {
        binaryButton.backgroundColor = UIColor.red
        decimalButton.backgroundColor = UIColor.red
        hexButton.backgroundColor = UIColor.green
        binaryButton.tintColor = UIColor.blue
        decimalButton.tintColor = UIColor.blue
        hexButton.tintColor = UIColor.gray
        if(catchError() == true){
            result.backgroundColor = UIColor.white
            let entryString = result.text?.components(separatedBy: ":")
            let type = entryString?[0]
            let number = Int((entryString?[1])!)
            if type == "b"{
                //Conversion of boolean to hex
                let resultNumber = String(Int(String(number!), radix: 2)!, radix: 16)
                result.text = String(describing: "h:" + String(resultNumber).uppercased())
            }
            else if type == "d"{
                //Conversion of decimal to hex
                let resultNumber = String(number!, radix: 16)
                result.text = String(describing: "h:" + resultNumber.uppercased())
            }
        }
        else {
            result.text = "ERROR"
            result.backgroundColor = UIColor.red
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        binaryButton.layer.cornerRadius = 8
        hexButton.layer.cornerRadius = 8
        decimalButton.layer.cornerRadius = 8
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //This method checks if the input is not valid
    //It will first split the input into an array of its characters
    //Then it will check if it the input starts with "d:","b:",or "h:". If not, it is not valid and returns false
    //It will then create an array of legal characters based on what type the input was supposed to be
    //It will check if all of the characters inputted is a member of the legal character array
    //If any character is not, then it returns false
    //If it goes through the entire array, then it returns true
    func catchError () -> Bool {
        let input = result.text?.characters.map{String($0)}
        if(input?[0] == "d" && input?[1] == ":"){
            let legal = ["0","1","2","3","4","5","6","7","8","9"]
            for number in 2...(input?.count)!-1 {
                if(!legal.contains((input?[number])!)){
                    return false
                }
            }
            return true
            
        }
        else if(input?[0] == "b" && input?[1] == ":"){
            let legal = ["0","1"]
            for number in 2...(input?.count)!-1 {
                if(!legal.contains((input?[number])!)){
                    return false
                }
            }
            return true
            
        }
        else if(input?[0] == "h" && input?[1] == ":"){
            let legal = ["0","1","2","3","4","5","6","7","8","9","A","B","C","D","E","F"]
            for number in 2...(input?.count)!-1 {
                if(!legal.contains((input?[number])!)){
                    return false
                }
            }
            return true
        }
        else {
            return false
        }
    }
    
}



