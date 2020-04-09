//
//  HelpViewController.swift
//  COVID-19 - INDIA
//
//  Created by Ramprasath Selvam on 06/04/20.
//  Copyright © 2020 RamprasathSelvam. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tblView:UITableView!
        
    let sectionTitle = ["Useful Links","FAQ", "Contribution"]
    
    let qus = [
        [
            "Helpline Number for COVID-19 [INDIA]",
            "Ministry of Health and Family Welfare Government of India",
            "MyGov Government of India",
            "World Health Organization",
            "World Health Organization - Dashboard"
        ],
        [
            "Are you official?",
            "Who Provide Data?",
            "What are your sources? How is the data gathered for this Application?"
        ],
        [
            "Developer"
        ]
    ]
    
    let ans = [
        [
            "https://www.mohfw.gov.in/pdf/coronvavirushelplinenumber.pdf",
            "https://www.mohfw.gov.in/",
            "https://www.mygov.in/covid-19/",
            "https://www.who.int/emergencies/diseases/novel-coronavirus-2019",
            "https://who.sprinklr.com/"
        ],
        [
            "No",
            "covid19india.org - covid19india is Volunteer driven initiative building crowdsourced verified tracker of Covid19 cases in India",
            "Details Provides by covid19india.org"
        ],
        [
            "Developer"
        ]
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.hidesBarsOnSwipe = true
        
        self.tblView.delegate = self
        self.tblView.dataSource = self
        
        self.tblView.rowHeight = UITableView.automaticDimension
        self.tblView.estimatedRowHeight = 120
        
        self.tblView.reloadData()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.panGestureRecognizer.translation(in: scrollView).y < 0 {
            navigationController?.setNavigationBarHidden(true, animated: true)
        } else {
            navigationController?.setNavigationBarHidden(false, animated: true)
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitle.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return qus[section].count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.sectionTitle[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 || indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "InfoTableViewCell", for: indexPath) as! InfoTableViewCell
            cell.quslbl.text = self.qus[indexPath.section][indexPath.row]
            cell.anslbl.text = self.ans[indexPath.section][indexPath.row]
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "InfoDetailsTableViewCell", for: indexPath) as! InfoDetailsTableViewCell
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            guard let url = URL(string: self.ans[indexPath.section][indexPath.row] ) else { return }
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url)
            } else {
                // Fallback on earlier versions
            }
        }
    }
}
