//
//  InfoDetailsTableViewCell.swift
//  COVID-19 - INDIA
//
//  Created by Ramprasath Selvam on 06/04/20.
//  Copyright © 2020 RamprasathSelvam. All rights reserved.
//

import UIKit

class InfoDetailsTableViewCell: UITableViewCell {
    
    @IBOutlet var covid19orgBtn:UIButton! // https://www.covid19india.org/
    @IBOutlet var instagrambtn:UIButton! // https://www.instagram.com/ramprasathselvam/
    @IBOutlet var githubbtn:UIButton! // https://github.com/Ramprasathselvam/COVID-19---INDIA
    @IBOutlet var developerBtn:UIButton! // http://ramprasathselvam.droppages.com/


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func covid19orgBtnTabbed(){
        self.openURL(URLstr : "https://www.covid19india.org/");
    }
    @IBAction func instagrambtnTabbed(){
        self.openURL(URLstr : "https://www.instagram.com/ramprasathselvam/");
    }
    @IBAction func githubbtnTabbed(){
        self.openURL(URLstr : "https://github.com/Ramprasathselvam/COVID-19---INDIA");
    }
    @IBAction func developerBtnTabbed(){
        self.openURL(URLstr : "http://ramprasathselvam.droppages.com/");
    }
    
    func openURL(URLstr:String){
        guard let url = URL(string: URLstr ) else { return }
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url)
        } else {
            // Fallback on earlier versions
        }
    }

}
