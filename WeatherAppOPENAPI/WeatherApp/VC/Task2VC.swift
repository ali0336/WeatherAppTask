//
//  Task2VC.swift
//  WeatherApp
//
//  Created by Taimoor Ali on 21/05/2020.
//  Copyright © 2020 Taimoor Ali. All rights reserved.
//

import UIKit
import CoreLocation

class Task2VC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let locationManager = CLLocationManager()
    let geoCoder = CLGeocoder()
    
    private let weatherViewModel = WeatherViewModel()
    var listArray: [WeatherResponseModel] = []
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //For use in background
        locationManager.requestAlwaysAuthorization()
        //For use in foreground
        locationManager.requestWhenInUseAuthorization()
        
        //Check if user allows
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
        
        tableView.register(UINib(nibName: "Task1Cell", bundle: nil), forCellReuseIdentifier: "cell")
        
        //API response
        self.weatherViewModel.cityData.bind { (data) in
            guard let data = data else {
                return
            }
            self.listArray = data.list
            self.tableView.reloadData()
        }
        
    }
    
    func fetchCity(location: CLLocation){
        //Get City Name
        location.fetchCityAndCountry { city, error in
            guard let city = city, error == nil else { return }
            self.title = city
            //API Call for city
            let url = "\(BASEURL)forecast?q=\(city)&appid=\(API_KEY)"
            self.weatherViewModel.fetchWeatherForLocation(urlString: url)
        }
    }
}

extension Task2VC: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocation = manager.location else { return }
        self.fetchCity(location: locValue)
        manager.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Failed getting location \(error)")
    }
}

extension Task2VC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? Task1Cell else { return UITableViewCell()}
        cell.configure(city: listArray[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90.0
    }
}
