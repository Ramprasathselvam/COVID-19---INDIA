//
//  HelpTableViewCell.swift
//  COVID-19 - INDIA
//
//  Created by Ramprasath Selvam on 06/04/20.
//  Copyright © 2020 RamprasathSelvam. All rights reserved.
//

import UIKit

class InfoTableViewCell: UITableViewCell {
    
    @IBOutlet var quslbl:UILabel!
    @IBOutlet var anslbl:UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        sizeToFit()
        layoutIfNeeded()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
