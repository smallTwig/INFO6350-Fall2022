//
//  ViewController.swift
//  StockTicker
//
//  Created by kanra on 10/1/22.
//

import UIKit
import Alamofire
import SwiftyJSON
import SwiftSpinner

class ViewController: UIViewController {

    @IBOutlet weak var lblStock: UILabel!
    @IBOutlet weak var txtStockSymbol: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func getStockPrice(_ sender: Any) {
        let apiKey = "d6e3d62642aea0211a9ee6270730d30e"
        var url = "https://financialmodelingprep.com/api/v3/quote/"
        url += txtStockSymbol.text!
        url += "?apikey="
        url += apiKey
        
        
        AF.request(url).responseJSON{
            responseData in print(responseData)
            SwiftSpinner.hide()
            
            if responseData.error != nil {
                print(responseData.error!)
                return
            }
            
            guard let stock = JSON(responseData.data!).array?.first else{return}
            
            print(stock["name"].stringValue)
            print(stock["price"].stringValue)
        }

        
    }
}

