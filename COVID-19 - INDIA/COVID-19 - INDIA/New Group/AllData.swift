//
//  AllData.swift
//  COVID-19 - INDIA
//
//  Created by Ramprasath Selvam on 02/04/20.
//  Copyright © 2020 RamprasathSelvam. All rights reserved.
//

import Foundation

public class AllData{
    
    //MARK: Properties
    
    public var active : String?
    public var confirmed : String?
    public var deaths : String?
    public var lastupdatedtime : String?
    public var recovered : String?
    public var state : String?

/**
    Returns an array of models based on given dictionary.
    
    Sample usage:
    let UserModelt = UserModel.modelsFromDictionaryArray(someDictionaryArrayFromJSON)

    - parameter array:  NSArray from JSON dictionary.

    - returns: Array of ProjectModel Instances.
*/
    public class func modelsFromDictionaryArray(array:NSArray) -> [AllData]
    {
        var models:[AllData] = []
        for item in array
        {
            models.append(AllData(dictionary: item as! NSDictionary)!)
        }
        return models
    }

//MARK: Initialization
    
    required public init?(dictionary: NSDictionary) {

        active = dictionary["active"] as? String ?? "0"
        confirmed = dictionary["confirmed"] as? String ?? "0"
        deaths = dictionary["deaths"] as? String ?? ""
        lastupdatedtime = dictionary["lastupdatedtime"] as? String ?? ""
        recovered = dictionary["recovered"] as? String ?? ""
        state = dictionary["state"] as? String ?? ""
    }
/**
    Returns the dictionary representation for the current instance.
    
    - returns: NSDictionary.
*/
    public func dictionaryRepresentation() -> NSDictionary {

        let dictionary = NSMutableDictionary()

        dictionary.setValue(self.active, forKey: "active")
        dictionary.setValue(self.confirmed, forKey: "confirmed")
        dictionary.setValue(self.deaths, forKey: "deaths")
        dictionary.setValue(self.lastupdatedtime, forKey: "lastupdatedtime")
        dictionary.setValue(self.recovered, forKey: "recovered")
        dictionary.setValue(self.state, forKey: "state")
       
        return dictionary
    }

}

