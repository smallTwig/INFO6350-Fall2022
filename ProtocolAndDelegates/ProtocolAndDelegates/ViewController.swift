//
//  ViewController.swift
//  ProtocolAndDelegates
//
//  Created by kanra on 10/8/22.
//

import UIKit

class ViewController: UIViewController, SendNameDelegate {

    @IBOutlet weak var lblWelcome: UILabel!
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func goToSecondVC(_ sender: Any) {
        performSegue(withIdentifier: "segueSecondVC", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueSecondVC" {
            let secondVC = segue.destination as! SecondViewController
            secondVC.sendNameDelegate = self
        }
    }
    
    func sendName(name: String){
        lblWelcome.text = "Welcome \(name)!!"
    }
    
}

