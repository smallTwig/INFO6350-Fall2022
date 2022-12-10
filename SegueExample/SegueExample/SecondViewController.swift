//
//  SecondViewController.swift
//  SegueExample
//
//  Created by kanra on 10/8/22.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var lblWelcome: UILabel!
    var welcomeStr = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        lblWelcome.text = welcomeStr
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
