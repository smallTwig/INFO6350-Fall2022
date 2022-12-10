//
//  ViewController.swift
//  EquipmentMaintainance
//
//  Created by kanra on 10/22/22.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {

    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var lblStatus: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblStatus.isHidden = true
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let keyChain = keychainServices().keyChain
        
        if keyChain.get("uid") != nil {
            performSegue(withIdentifier: "segueLogin", sender: self)
        }
    }

    @IBAction func loginAction(_ sender: Any) {
        guard let email = txtEmail.text else {return}
        guard let password = txtPassword.text else {return}
        
        if email.isEmail == false {
            lblStatus.text = "Please enter valid email"
            lblStatus.isHidden = false
            return
        }
        
        if password.isPsswordStrong == false {
            lblStatus.text = "Please enter valid password"
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password){ [weak self] authResult, error in
            guard let strongSelf = self else {return}
            
            if error != nil {
                strongSelf.lblStatus.text = error?.localizedDescription
                strongSelf.lblStatus.isHidden = false
                return
            }
            strongSelf.txtPassword.text = ""
            strongSelf.performSegue(withIdentifier: "segueLogin", sender: self)
        }
    }
    
}

