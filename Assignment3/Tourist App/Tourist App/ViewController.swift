//
//  ViewController.swift
//  Tourist App
//
//  Created by kanra on 9/25/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tbView: UITableView!
    
    let TouristPlacesNames = ["Space Needle", "Pike Place Market", "Seattle Aquarium", "Woodland Park Zoo", "Lake Union","Discovery Park", "Mount Rainier"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        TouristPlacesNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("TouristCell", owner: self)?.first as! TouristCell
        cell.imgView.image = UIImage(named: TouristPlacesNames[indexPath.row])
        cell.labView.text = TouristPlacesNames[indexPath.row]
        return cell
    }

}

