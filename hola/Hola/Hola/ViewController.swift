//
//  ViewController.swift
//  Hola
//
//  Created by Calvin Chang on 2021/1/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var iv: UIImageView!
    @IBOutlet weak var tf: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        config()
    }


    @IBAction func doGo(_ sender: Any) {
        let s = tf.text!
        let s2 = NSAttributedString(string: s, attributes:[.font:UIFont(name: "Georgia", size: 50)!, .foregroundColor: UIColor.blue])
        let sz = iv.image!.size
        let r = UIGraphicsImageRenderer(size: sz)
        iv.image = r.image {
            _ in
            iv.image!.draw(at:.zero)
            s2.draw(at: CGPoint(x:0, y:sz.height - 150))
        }
    }
    
    
    
    @IBAction func doRevert(_ sender: Any) {
        config()
    }
    
    func config() {
        iv.image = UIImage(named: "test")
    }
    
    
}

