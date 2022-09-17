//
//  ViewController.swift
//  Multiply Numbers
//
//  Created by kanra on 9/10/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var number1: UITextField!
    
    @IBOutlet weak var number2: UITextField!
    
    @IBOutlet weak var result: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func multiplyFuction(_ sender: Any) {
        let n1 = Int(number1.text ?? "0") ?? 0
        let n2 = Int(number2.text ?? "0") ?? 0
        let product = n1 * n2
        
        result.text = String(product)
    }
}

