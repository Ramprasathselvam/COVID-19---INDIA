//
//  StatesViewController.swift
//  COVID-19 - INDIA
//
//  Created by Ramprasath Selvam on 02/04/20.
//  Copyright © 2020 RamprasathSelvam. All rights reserved.
//

import UIKit

class StatesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var stateTblView:UITableView!
    
    let colors = ["red", "green", ""]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.stateTblView.delegate = self
        self.stateTblView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "StatesTableViewCell", for: indexPath) as! StatesTableViewCell
        
        let data = allData[indexPath.row]
        if data.state == "Total" {
            
            cell.activelbl.text = "Active - " + data.active!
            cell.conformedlbl.text = "Confirmed - " + data.confirmed!
            cell.recoveredlbl.text = "Recovered - " + data.recovered!
            cell.deathlbl.text = "Deaths - " + data.deaths!
            cell.lastUpdatelbl.text = "Last Updated " + self.dateFormatConvert(dateStr: data.lastupdatedtime!)
            cell.ststeLbl.text = "INDIA"
            
        }else{
            
            cell.activelbl.text = "Active - " + data.active!
            cell.conformedlbl.text = "Confirmed - " + data.confirmed!
            cell.recoveredlbl.text = "Recovered - " + data.recovered!
            cell.deathlbl.text = "Deaths - " + data.deaths!
            cell.lastUpdatelbl.text = "Updated at " + self.dateFormatConvert(dateStr: data.lastupdatedtime!)
            cell.ststeLbl.text = data.state
        }
        
        if (indexPath.row % 5 == 0){
            cell.recordView.backgroundColor = UIColor.red
        }else  if (indexPath.row % 5 == 1){
            cell.recordView.backgroundColor = UIColor.systemGreen
        }else if (indexPath.row % 5 == 2){
            cell.recordView.backgroundColor = UIColor.systemTeal
        }else if (indexPath.row % 5 == 3){
            cell.recordView.backgroundColor = UIColor.gray
        }else if (indexPath.row % 5 == 4){
            cell.recordView.backgroundColor = UIColor.black
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 142
    }
    
    func dateFormatConvert(dateStr:String) -> String{
       
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "dd/MM/yyyy HH:mm:ss"
        
        let showDate = inputFormatter.date(from: dateStr)
        inputFormatter.dateFormat = "dd MMM yyyy HH:mm"
        let resultString = inputFormatter.string(from: showDate!)
        return resultString
    }
    
}
