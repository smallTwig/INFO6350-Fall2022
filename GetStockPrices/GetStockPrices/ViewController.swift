//
//  ViewController.swift
//  GetStockPrices
//
//  Created by kanra on 12/10/22.
//

import UIKit
import Alamofire
import SwiftyJSON
import SwiftSpinner

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tbView: UITableView!
    var stocksInfo = [String]()
    var symbols = [String]()
    var indexSelected = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var url = "https://us-central1-whatsapp-analytics-2de0e.cloudfunctions.net/app/allstocks"
        
        SwiftSpinner.show("Getting Stock Values")
        AF.request(url).responseJSON { responseData in
                    print(responseData)
                    
                    SwiftSpinner.hide()
                    
                    if responseData.error != nil {
                        print(responseData.error!)
                        return
                    }
                    
                    guard let stocks = JSON(responseData.data!).array else { return }
                    print(stocks)
            
                    self.stocksInfo = [String]()
                    for stock in stocks {
                        let stockJSON = JSON(stock)
                        let symbol = stockJSON["Symbol"].stringValue
                        let price = stockJSON["Price"].stringValue
                        let str = "Symbol: \(symbol) , Price: \(price)"
                        self.stocksInfo.append(str)
                        self.symbols.append(symbol)
                        
                    }
                    print(self.stocksInfo)
                    self.tbView.reloadData()

                }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stocksInfo.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tbView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = stocksInfo[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        indexSelected = indexPath.row
        print (indexPath.row)
        performSegue(withIdentifier: "segueDetails", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "segueDetails"){

        let destVC = segue.destination as! DetailViewController

        let symbol = symbols[indexSelected]

        destVC.symbol = symbol

        }
    }
}

