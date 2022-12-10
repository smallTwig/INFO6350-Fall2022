//
//  DashboardViewController.swift
//  EquipmentManagement
//
//  Created by kanra on 10/28/22.
//

import UIKit
import FirebaseAuth

class DashboardViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func logoutAction(_ sender: Any) {
        
        let keychain = KeyChainService().keyChain;
        keychain.clear()
        
        do {
            try Auth.auth().signOut()
        }
        catch{
            print("Unable to logout")
        }
        
        self.navigationController?.popViewController(animated: true)
    }
    
}
