//
//  TableViewCell.swift
//  FoodImages
//
//  Created by kanra on 9/24/22.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var imgFood: UIImageView!
    
    @IBOutlet weak var lblFood: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
