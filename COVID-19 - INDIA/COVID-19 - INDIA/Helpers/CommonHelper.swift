//
//  CommonHelper.swift
//  COVID-19 - INDIA
//
//  Created by Ramprasath Selvam on 02/04/20.
//  Copyright © 2020 RamprasathSelvam. All rights reserved.
//

import Foundation
import UIKit
import SystemConfiguration

class CommonHelper : NSObject {
    
    //MARK: App Alert
    func appAlertController(_ title:String, message:String) -> UIAlertController {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        return alertController
    }
    
    //MARK: CHECK INTERNET CONNECTION
    func checkInternet() -> Bool{
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout<sockaddr_in>.size)
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        guard let defaultRouteReachability = withUnsafePointer(to: &zeroAddress, {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {
                SCNetworkReachabilityCreateWithAddress(nil, $0)
            }
        }) else {
            return false
        }
        var flags: SCNetworkReachabilityFlags = []
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags) {
            return false
        }
        let isReachable = flags.contains(.reachable)
        let needsConnection = flags.contains(.connectionRequired)
        
        return isReachable && !(needsConnection)
    }
}
