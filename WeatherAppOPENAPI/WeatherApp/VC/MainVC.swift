//
//  MainVC.swift
//  WeatherApp
//
//  Created by Taimoor Ali on 20/05/2020.
//  Copyright © 2020 Taimoor Ali. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnTask1(_ sender: Any){
        let vc = self.storyboard?.instantiateViewController(identifier: "Task1VC") as! Task1VC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func btnTask2(_ sender: Any){
        let vc = self.storyboard?.instantiateViewController(identifier: "Task2VC") as! Task2VC
        self.navigationController?.pushViewController(vc, animated: true)
    }

}
