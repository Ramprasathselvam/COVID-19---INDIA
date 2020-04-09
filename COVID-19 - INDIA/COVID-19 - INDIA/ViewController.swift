//
//  ViewController.swift
//  COVID-19 - INDIA
//
//  Created by Ramprasath Selvam on 02/04/20.
//  Copyright © 2020 RamprasathSelvam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
        
    @IBOutlet var totalComformedlbl:UILabel!
    @IBOutlet var totalActivelbl:UILabel!
    @IBOutlet var totalRecoveredlbl:UILabel!
    @IBOutlet var totalDeathlbl:UILabel!
    
    @IBOutlet var lastUpdateTime:UILabel!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.getAllData()
    }
    
    func getAllData(){
        
        APIServices.getDatafromApi(url: Constants.APIUrls.API_GetAllData, completion: { (response) in
            
            DispatchQueue.main.async {
                if response is NSDictionary {
                    if let jsonData = response["statewise"] as? NSArray {
                        
                        allData = AllData.modelsFromDictionaryArray(array: jsonData)
                        
                        print("\(String(describing: allData[0].state))")
                        
                        for data in allData {
                            if data.state == "Total"{
                                self.totalComformedlbl.text = data.confirmed
                                self.totalActivelbl.text = data.active
                                self.totalRecoveredlbl.text = data.recovered
                                self.totalDeathlbl.text = data.deaths
                                
                                self.lastUpdateTime.text = "Updated at " + self.dateFormatConvert(dateStr: data.lastupdatedtime!)
                            }
                        }
                        
                    }else{
                        self.present(CommonHelper().appAlertController("Error", message: "Somthing Went Wrong"), animated: true, completion: nil)
                    }
                }
            }
        })
    }
    
    func dateFormatConvert(dateStr:String) -> String{
       
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "dd/MM/yyyy HH:mm:ss"
        
        let showDate = inputFormatter.date(from: dateStr)
        inputFormatter.dateFormat = "dd MMM yyyy HH:mm:ss"
        let resultString = inputFormatter.string(from: showDate!)
        print(resultString)
        return resultString
    }
}

