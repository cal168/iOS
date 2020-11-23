//
//  ViewController.swift
//  calc
//
//  Created by Calvin Chang on 2020/11/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var LabelLed: UILabel!
    
    var calcTmp: Double = 0.0
    
    var calcTmp2: Double = 0.0
    
    var equalsStatus: Int = 0
    
    var isPressMath: Int = 0
    
    var mathType: String = "+"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnZero(_ sender: Any) {
//        appendLabelLed(dig: "0")
//        setCalcTmp()
    }
    
    @IBAction func btnOne(_ sender: Any) {
//        appendLabelLed(dig: "1")
//        setCalcTmp()
    }
    
    @IBAction func btnTwo(_ sender: Any) {
//        appendLabelLed(dig: "2")
//        setCalcTmp()
    }
    
    @IBAction func btnThree(_ sender: Any) {
//        appendLabelLed(dig: "3")
//        setCalcTmp()
    }
    
    @IBAction func btnFour(_ sender: Any) {
//        appendLabelLed(dig: "4")
//        setCalcTmp()
    }
    
    @IBAction func btnFive(_ sender: Any) {
//        appendLabelLed(dig: "5")
//        setCalcTmp()
    }
    
    @IBAction func btnSix(_ sender: Any) {
//        appendLabelLed(dig: "6")
//        setCalcTmp()
    }
    
    @IBAction func btnSeven(_ sender: Any) {
//        appendLabelLed(dig: "7")
//        setCalcTmp()
    }
    
    @IBAction func btnEight(_ sender: Any) {
//        appendLabelLed(dig: "8")
//        setCalcTmp()
    }
    
    @IBAction func btnNine(_ sender: Any) {
//        appendLabelLed(dig: "9")
//        setCalcTmp()
    }
    
    @IBAction func btnClear(_ sender: Any) {
        LabelLed.text! = ""
        calcTmp = 0.0
        calcTmp2 = 0.0
        isPressMath = 0
        mathType = ""
        equalsStatus = 0
    }
    
    func appendLabelLed(dig: String) {
        LabelLed.text!.append(dig)
        let allStr = LabelLed.text!
        if(allStr.count==2) {
            if(allStr[allStr.startIndex] == "0") {
                LabelLed.text = String(allStr[allStr.index(after: allStr.startIndex)])
            }
        }
    }
    
    @IBAction func btnEquals(_ sender: Any) {
        if let labelLedText = LabelLed.text ,let labelLedDouble = Double(labelLedText) {
                if isPressMath == 0 {
                    calcTmp += labelLedDouble
                
                let calcTmpInt: Int = Int(calcTmp)
                
                if calcTmp - Double(calcTmpInt) == 0.0 {
                    LabelLed.text = String(calcTmpInt)
                } else {
                    LabelLed.text = String(calcTmp)
                    
                }
            }
            
            
            if isPressMath == 1 {
                var finalTmp: String = String(calcTmp2)
                finalTmp.append(mathType)
                finalTmp.append(String(calcTmp))
                
                let exp: NSExpression = NSExpression(format: finalTmp)
                let result: Double = exp.expressionValue(with:nil, context: nil) as! Double
                
                print("finalTmp is \(finalTmp) \(result)" )
                
                
                let resultTmpInt: Int = Int(result)
                
                if result - Double(resultTmpInt) == 0.0 {
                    LabelLed.text = String(resultTmpInt)
                } else {
                    LabelLed.text = String(result)
                    
                }
                
                calcTmp = result
                calcTmp2 = 0
                isPressMath = 0
                mathType = ""
            }
            
        }
        
        
       
        
        //若按了等號，就註記 equalsStatus = 1
        equalsStatus = 1
    }
    
    
    @IBAction func btnMnP(_ sender: Any) {
        if let labelLedText = LabelLed.text, let labelLedDouble = Double(labelLedText) {
            if !LabelLed.text!.contains("-") {
                var tmpStr = "-"
                tmpStr.append(String(labelLedDouble))
                LabelLed.text = tmpStr
            } else if LabelLed.text!.contains("-") {
                LabelLed.text = labelLedText.replacingOccurrences(of: "-", with: "")
            }
        }
        //setCalcTmp()
    }
    
    @IBAction func digDot(_ sender: Any) {
        if !LabelLed.text!.contains(".") {LabelLed.text!.append(".")}
    }
    
    @IBAction func btnPrec(_ sender: Any) {
        if let labelLedText = LabelLed.text ,let labelLedDouble = Double(labelLedText) {
            LabelLed.text = String(labelLedDouble/100)
        }
        //setCalcTmp()
    }
    
    @IBAction func doCheckEqualsAndSetLabelClear(_ sender: UIButton) {
        print("sender.tag:\(sender.tag),equalsStatus:\(equalsStatus)")
        if sender.tag == -1,equalsStatus == 1 {
            //按小數點，且已按過等於，直接顯示小數點
            if sender.tag != -1 {
                LabelLed.text = String(sender.tag)
            }
            if sender.tag == -1 {
                if !LabelLed.text!.contains(".") {LabelLed.text!.append(".")}
            }
        } else if sender.tag == -1,equalsStatus == 0  {
            
            if sender.tag != -1 {
                appendLabelLed(dig:String(sender.tag))
            }
            if sender.tag == -1 {
                if !LabelLed.text!.contains(".") {LabelLed.text!.append(".")}
            }
        } else if equalsStatus == 1 {
            if sender.tag != -1 {
                LabelLed.text = String(sender.tag)
            }
            if sender.tag == -1 {
                if !LabelLed.text!.contains(".") {LabelLed.text!.append(".")}
            }
            equalsStatus = 0
        } else {
            appendLabelLed(dig: String(sender.tag))
        }
        if let labelLedText = LabelLed.text ,let labelLedDouble = Double(labelLedText) {
            calcTmp = labelLedDouble
        }
        
        
    }
    
    @IBAction func setCalcTmp() {
        if let labelLedText = LabelLed.text ,let labelLedDouble = Double(labelLedText) {
            
            calcTmp = labelLedDouble
            print("LabelLed Text is \( LabelLed.text!),calcTmp is \(calcTmp)")
            
        }
        
    }
    
    @IBAction func doPressMath(_ sender: UIButton){
        //按加減乘除時，將calcTmp 的值存到 calcTmp2後將calcTmp設為0 ，並將 LabelLed的內容清除。
        //預設 isPressMath = 0 代表未按，注記為 1
        //運算種類 /:-5, *:-4, -:-3, +:-2 ， 預設 +
        
        
        switch sender.tag {
        case -5:
            mathType = "/"
        case -4:
            mathType = "*"
        case -3:
            mathType = "-"
        case -2:
            mathType = "+"
        default:
            break
        }
        
        if isPressMath == 0 {
            calcTmp2 = calcTmp
            LabelLed.text = ""
            calcTmp = 0
            isPressMath = 1
        }
        
        print("calcTmp is \(calcTmp) , calcTmp2 is \(calcTmp2), mathType is \(mathType)")
        
    }
    
}

