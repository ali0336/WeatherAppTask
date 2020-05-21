//
//  NetworkService.swift
//  CountryWeatherApp
//
//  Created by Taimoor Ali on 07/04/2020.
//  Copyright © 2020 Taimoor Ali. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case invalidResponse
    case noData
    case failedRequest
    case invalidData
}


class NetworkService {
    typealias WeatherDataCompletion = (GroupResponseModel?, NetworkError?) -> ()
    
    static func weatherDataForLocation(URLstr: String, completion: @escaping WeatherDataCompletion) {

        let urlString = URLstr.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let url = URL(string: urlString!)
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
          //execute completion handler on main thread
          DispatchQueue.main.async {
            guard error == nil else {
                completion(nil, .failedRequest)
                return
            }
            guard let data = data else {
                completion(nil, .invalidData)
                return
            }
            guard let response = response as? HTTPURLResponse else {
                completion(nil, .invalidResponse)
                return
            }
            do{
                print(response)
                let decoder = JSONDecoder()
                let weatherRes = try
                    decoder.decode(GroupResponseModel.self, from: data)
                completion(weatherRes, nil)
            }catch {
                completion(nil, .invalidData)
            }
          }
        }.resume()
    }
}
