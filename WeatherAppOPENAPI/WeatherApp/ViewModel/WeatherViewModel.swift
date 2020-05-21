//
//  WeatherViewModel.swift
//  CountryWeatherApp
//
//  Created by Taimoor Ali on 09/04/2020.
//  Copyright © 2020 Taimoor Ali. All rights reserved.
//

import Foundation
import SVProgressHUD

public class WeatherViewModel {
    let cityData: Box<GroupResponseModel?> = Box(value: nil)

    func fetchWeatherForLocation(urlString: String) {
        SVProgressHUD.show()
        NetworkService.weatherDataForLocation(URLstr: urlString) {
            [weak self] (response, error) in
            guard error == nil else {
                SVProgressHUD.showError(withStatus: "Something went wrong")
                return
            }
            guard
                let self = self,
                let weatherResponse = response
                else {
                    return
            }
            SVProgressHUD.dismiss()
            self.cityData.value = weatherResponse
        }
    }
    
}
