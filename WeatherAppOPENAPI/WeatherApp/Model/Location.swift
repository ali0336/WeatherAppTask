//
//  Location.swift
//  CountryWeatherApp
//
//  Created by Taimoor Ali on 07/04/2020.
//  Copyright © 2020 Taimoor Ali. All rights reserved.
//

import Foundation
import CoreLocation

struct Location {
    let name: String
    let lat: Double
    let long: Double
    
    var location: CLLocation {
        return CLLocation(latitude: lat, longitude: long)
    }
}
