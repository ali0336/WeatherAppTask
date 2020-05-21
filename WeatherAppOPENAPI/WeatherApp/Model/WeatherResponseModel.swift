//
//  WeatherData.swift
//  CountryWeatherApp
//
//  Created by Taimoor Ali on 07/04/2020.
//  Copyright © 2020 Taimoor Ali. All rights reserved.
//

import Foundation

struct GroupResponseModel: Decodable {
    var list: [WeatherResponseModel]
}
struct WeatherResponseModel: Decodable {
    var weather: [weatherData]
    var main: mainData
    var wind: windData
    var dt: Double
    var name: String?
}

struct weatherData: Decodable {
    var description: String
}

struct mainData: Decodable {
    var temp_min: Float
    var temp_max: Float
}

struct windData: Decodable {
    var speed: Float
}
