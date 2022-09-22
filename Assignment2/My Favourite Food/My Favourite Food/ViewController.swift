//
//  ViewController.swift
//  My Favourite Food
//
//  Created by kanra on 9/21/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
   
    
    
    @IBOutlet weak var tbView: UITableView!
    
    let foods = ["Hot Pot", "Ice Cream", "Pizza", "Hot dog", "Fish", "Salad", "Sandwich", "Banana", "Apple", "Orange Juice"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tbView.delegate = self
        tbView.dataSource = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foods.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "foodTable", for: indexPath)
        cell.textLabel?.text = foods[indexPath.row]
        return cell
    }
}

