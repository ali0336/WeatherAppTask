//
//  Task1VC.swift
//  WeatherApp
//
//  Created by Taimoor Ali on 20/05/2020.
//  Copyright © 2020 Taimoor Ali. All rights reserved.
//




import UIKit
import Toast_Swift
import SVProgressHUD

let  BASEURL = "http://api.openweathermap.org/data/2.5/"
let  API_KEY = "0a0b8acc5ecffa0f5b5718f62e22cac3"

class Task1VC: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var txtField: UITextField!
    let weatherViewModel = WeatherViewModel()
    var citiesArray: [String] = []
    var idsArray : [Int] = []
    var listArray: [WeatherResponseModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
    
    @IBAction func btnSearchPressed(_ sender: Any){

        //Checking if textfield is Empty
        guard let text = txtField.text, !text.isEmpty else {
            self.view.makeToast("Enter cities", duration: 2.0, position: .center)
            return
        }
        //Getting cities name seperated by comma and checking
        citiesArray = text.components(separatedBy: ",")
        if citiesArray.last == "" {
            citiesArray.removeLast()
        }
        if citiesArray.count < 3 || citiesArray.count > 7{
            self.view.makeToast("Min 3 cities & Max 7 Cities", duration: 2.0, position: .center)
            return
        }


        for city in citiesArray {
            //Trim city name from spaces at start
            let trimmedCityName = city.trimmingCharacters(in: .whitespaces)
            if let item = cityIds.first(where: {$0.name == trimmedCityName}) {
                idsArray.append(item.id)
            }
        }
        //Fetch Data for these IDs
        fetch(idArray: idsArray)
        txtField.text = ""
        txtField.resignFirstResponder()
        idsArray.removeAll()
    }
    

    
}


extension Task1VC: UITableViewDelegate, UITableViewDataSource {
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

extension Task1VC {
    func fetch(idArray: [Int]) {
        let ids = (idArray.map{String($0)}).joined(separator: ",")
        let url = "\(BASEURL)group?id=\(ids)&units=metric&appid=\(API_KEY)"
        self.weatherViewModel.fetchWeatherForLocation(urlString: url)
    }
}
