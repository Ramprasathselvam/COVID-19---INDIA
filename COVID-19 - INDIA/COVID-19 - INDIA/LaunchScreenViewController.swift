//
//  LaunchScreenViewController.swift
//  COVID-19 - INDIA
//
//  Created by Ramprasath Selvam on 07/04/20.
//  Copyright © 2020 RamprasathSelvam. All rights reserved.
//

import UIKit

class LaunchScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func countinueBtnTabbed(){
        
        if !(CommonHelper().checkInternet()){
            self.present(CommonHelper().appAlertController(Constants.CommonVaiables.noInternetTitle, message: Constants.CommonVaiables.noInternetMsg), animated: true, completion: nil)
        }else{
            let vc = storyboard?.instantiateViewController(withIdentifier:"TabBarViewController") as! TabBarViewController
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        }
    }
}
