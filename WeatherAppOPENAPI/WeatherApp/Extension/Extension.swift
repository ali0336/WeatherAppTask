//
//  Extension.swift
//  WeatherApp
//
//  Created by Taimoor Ali on 20/05/2020.
//  Copyright © 2020 Taimoor Ali. All rights reserved.
//

import Foundation
import CoreLocation

extension CLLocation {
    func fetchCityAndCountry(completion: @escaping (_ city: String?, _ error: Error?) -> ()) {
        CLGeocoder().reverseGeocodeLocation(self) { completion($0?.first?.locality, $1) }
    }
}

extension Double {
    func getDateStringFromUTC() -> String {
        let date = Date(timeIntervalSince1970: self)

        let dateFormatter = DateFormatter()
//        dateFormatter.locale = Locale(identifier: "en_US")
//        dateFormatter.dateStyle = .long
        dateFormatter.dateFormat = "hh:mm aa, EEEE, MMM d"


        return dateFormatter.string(from: date)
    }
}
