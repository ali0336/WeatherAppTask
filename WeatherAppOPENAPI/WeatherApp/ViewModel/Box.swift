//
//  Box.swift
//  CountryWeatherApp
//
//  Created by Taimoor Ali on 07/04/2020.
//  Copyright © 2020 Taimoor Ali. All rights reserved.
//

import Foundation

final class Box<T> {
    typealias Listener = (T) -> Void
    var listener: Listener?
    
    var value: T {
        didSet{
            listener?(value)
        }
    }
    
    init(value: T) {
        self.value = value
    }
    
    func bind(listener: Listener?){
        self.listener = listener
        listener?(value)
    }
}
