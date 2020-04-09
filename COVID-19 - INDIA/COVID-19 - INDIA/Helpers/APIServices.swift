//
//  APIServices.swift
//  COVID-19 - INDIA
//
//  Created by Ramprasath Selvam on 02/04/20.
//  Copyright © 2020 RamprasathSelvam. All rights reserved.
//

import Foundation

class APIServices: NSObject {
    
    //MARK: GET DATA
    class func getDatafromApi(url: String,completion completionHandler:@escaping(_ response: AnyObject) -> ()){
        
        print(url)
        let request = NSMutableURLRequest(url: NSURL(string: url.addingPercentEncoding( withAllowedCharacters: .urlQueryAllowed)!)! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 20.0)
        request.httpMethod = "GET"
        
        request.allHTTPHeaderFields = [
            "content-type": "application/json"
        ]
        
        print(request.allHTTPHeaderFields as Any)
        
        let session = URLSession.shared
        let task = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            
            guard let responseData = data else {
                completionHandler("error" as AnyObject)
                return
            }
            guard error == nil else {
                print(error?.localizedDescription as Any)
                completionHandler("error" as AnyObject)
                return
            }
            
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {
                print("statusCode is \(httpStatus.statusCode)")
                print("response = \(httpStatus.description)")
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: responseData, options: JSONSerialization.ReadingOptions.allowFragments)
                if let jsonMsg = json as? NSDictionary {
                    
                    DispatchQueue.main.async(execute: { () -> Void in
                        
                    });
                    
                }
                completionHandler(json as AnyObject)
            }
            catch let error as NSError{
                print(error.description)
                completionHandler("error" as AnyObject)
            }
        })
        task.resume()
    }
}
