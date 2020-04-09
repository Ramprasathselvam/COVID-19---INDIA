//
//  Constants.swift
//  COVID-19 - INDIA
//
//  Created by Ramprasath Selvam on 02/04/20.
//  Copyright © 2020 RamprasathSelvam. All rights reserved.
//

import Foundation

class Constants : NSObject {
    
    struct CommonVaiables{
        static let App_Name = "COVID-19 - INDIA"
        static let App_Version = "1.0"
        
        static let errorMsg = "Somthing Went Wrong..!"
        static let noInternetTitle = "No Internet"
        static let noInternetMsg = "Please check your internet connection"
    }
    
    struct APIUrls {
        //MARK: Base
        static let API_Base = "https://api.covid19india.org"
        
        //MARK: 👨‍💻APIs
        static let API_GetAllData = APIUrls.API_Base + "/data.json"
    }
}
