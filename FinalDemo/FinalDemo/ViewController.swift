//
//  ViewController.swift
//  FinalDemo
//
//  Created by kanra on 12/9/22.
//

import UIKit
import Alamofire
import SwiftyJSON
import SwiftSpinner

class ViewController: UIViewController {
    
    @IBOutlet weak var lblStock: UILabel!
    @IBOutlet weak var txtStockSymbol: UITextField!
    @IBOutlet weak var tblView: UITableView!
    
    var temps = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func getStockPrice(_ sender: Any) {
        let apiKey="d6e3d62642aea0211a9ee6270730d30e"
        var url = "https://financialmodelingprep.com/api/v3/quote/"
        url += txtStockSymbol.text!
        url += "?apikey="
        url += apiKey
        
        print(url)
        
        SwiftSpinner.show("Getting Stock Values")
        
        AF.request(url).responseJSON{ responseData in
            print(responseData)
            
            SwiftSpinner.hide()
            
            if responseData.error != nil {
                print(responseData.error)
                return
            }
            guard let stock = JSON(responseData.data!).array?.first else{ return }
            
            print(stock["name"].stringValue);
            print(stock["price"].stringValue);
            print(stock["open"].stringValue);
            
            self.temps = [String]()
            
            self.temps.append(stock["name"].stringValue)
            self.temps.append(stock["price"].stringValue)
            self.temps.append(stock["open"].stringValue)
            
            print(self.temps)
            
            self.lblStock.text = " Company: \(stock["name"].stringValue)  Price: \(stock["price"].stringValue)"
        }
        
    }
    
}

