//
//  StatesTableViewCell.swift
//  COVID-19 - INDIA
//
//  Created by Ramprasath Selvam on 02/04/20.
//  Copyright © 2020 RamprasathSelvam. All rights reserved.
//

import UIKit

class StatesTableViewCell: UITableViewCell {
    
    @IBOutlet var recordView:UIView!
    
    @IBOutlet var ststeLbl:UILabel!
    
    @IBOutlet var conformedlbl:UILabel!
    @IBOutlet var activelbl:UILabel!
    @IBOutlet var recoveredlbl:UILabel!
    @IBOutlet var deathlbl:UILabel!
    
    @IBOutlet var lastUpdatelbl:UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
