//
//  DashboardViewController.swift
//  PatientHealthChart
//
//  Created by kanra on 11/5/22.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import FirebaseCore
import FirebaseFirestore

class DashboardViewController: UIViewController {
    
    @IBOutlet weak var txtFirstName: UITextField!
    @IBOutlet weak var txtLastName: UITextField!
    @IBOutlet weak var UIDatePicker: UIDatePicker!
    @IBOutlet weak var txtHeightFT: UITextField!
    @IBOutlet weak var txtHeightInch: UITextField!
    @IBOutlet weak var txtWeight: UITextField!
    
    var db = Firestore?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let db = Firestore.firestore()
    }
    

    @IBAction func logoutAction(_ sender: Any) {
        let keychain = KeyChainService().keyChain
                keychain.clear()

                do {
                    try Auth.auth().signOut()
                }
                catch{
                    print("Unable to logout")
                }

                self.navigationController?.popViewController(animated: true)
    }
    

    @IBAction func savePatientDetailsAction(_ sender: Any) {
        
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let firstName = txtFirstName.text else { return }
        guard let lastName = txtLastName.text else { return }
        guard let heightFT = txtHeightFT.text else { return }
        guard let heightInch = txtHeightInch.text else { return }
        guard let weight = txtWeight.text else { return }
        let dob = UIDatePicker.date
        
        // Add a new document with a generated ID
        var ref: DocumentReference? = nil
        guard let db = db else {return}
        db.collection("Patients").document(uid).setData(<#T##[String : Any]#>)
        ref = db.collection("Patients/\(uid)").addDocument(data: [
            "FirstName": "firstName",
            "LastName": "lastName",
            "HeightFT": Int(heightFT) ?? 5,
            "HeightInches": Int(heightInch) ?? 0,
            "WeightLBS": Int(heightInch) ?? 100,
            //"DOB":
            
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
            }
        }
        
    }
}
