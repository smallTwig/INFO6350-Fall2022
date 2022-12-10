//
//  SecondViewController.swift
//  ProtocolAndDelegates
//
//  Created by kanra on 10/8/22.
//

import UIKit

class SecondViewController: UIViewController {

    
    @IBOutlet weak var txtName: UITextField!
    
    var sendNameDelegate : SendNameDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func sendName(_ sender: UIButton) {
        
        guard let name = txtName.text else {return}
        
        sendNameDelegate?.sendName(name: name)
        
        self.navigationController?.popViewController(animated: true)
    }
}
