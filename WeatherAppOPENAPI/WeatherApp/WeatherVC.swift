//
//  WeatherVC.swift
//  WeatherApp
//
//  Created by Taimoor Ali on 20/05/2020.
//  Copyright © 2020 Taimoor Ali. All rights reserved.
//

import UIKit

class WeatherVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    

//    private let weatherViewModel = WeatherViewModel()

    let arr = ["london", "peshawar"]
    override func viewDidLoad() {
        super.viewDidLoad()


        // Do any additional setup after loading the view.
        
//        weatherViewModel.tempMin.bind {[weak self] (tempMin) in
//            print("TempMin:",tempMin)
//        }
        
        
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "cell")


    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    

}

extension WeatherVC: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocation = manager.location else { return }
//        self.fetchCity(location: locValue)
        manager.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Failed getting location \(error)")
    }
}

extension WeatherVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        cell.configure(city: arr[indexPath.row])
        return cell
    }
}
