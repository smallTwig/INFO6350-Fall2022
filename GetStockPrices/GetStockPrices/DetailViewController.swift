//
//  DetailViewController.swift
//  GetStockPrices
//
//  Created by kanra on 12/10/22.
//

import UIKit
import Alamofire
import SwiftyJSON
import SwiftSpinner

class DetailViewController: UIViewController {

    @IBOutlet weak var txtName: UILabel!
    
    @IBOutlet weak var txtSymbol: UILabel!
    
    @IBOutlet weak var txtPrice: UILabel!
    
    var symbol = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var url = "https://us-central1-whatsapp-analytics-2de0e.cloudfunctions.net/app/getstock?symbol=\(symbol)"
        
        SwiftSpinner.show("Getting Stock Details")
        AF.request(url).responseJSON { [self] responseData in
                    print(responseData)
                    
                    SwiftSpinner.hide()
                    
                    if responseData.error != nil {
                        print(responseData.error!)
                        return
                    }
                    
                    let stockJSON = JSON(responseData.data!)
                   
            txtName.text = "Comanpy Name: " + stockJSON["CompanyName"].stringValue
            txtSymbol.text = "Symbol: " + stockJSON["Symbol"].stringValue
            txtPrice.text = "Price: " + stockJSON["Price"].stringValue
//
//

                }
    }

}
