//
//  TableViewCell.swift
//  WeatherApp
//
//  Created by Taimoor Ali on 20/05/2020.
//  Copyright © 2020 Taimoor Ali. All rights reserved.
//

import UIKit

class Task1Cell: UITableViewCell {
    
    @IBOutlet weak var lblMinTemp: UILabel!
    @IBOutlet weak var lblMaxTemp: UILabel!
    @IBOutlet weak var lblSpeedTemp: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblCityName: UILabel!
    @IBOutlet weak var lblDate: UILabel!

    private let weatherViewModel = WeatherViewModel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configure(city: WeatherResponseModel) {
        self.lblMinTemp.text = String(format: "%.2f", city.main.temp_min)
        self.lblMaxTemp.text = String(format: "%.2f", city.main.temp_max)
        self.lblDescription.text = city.weather[0].description
        self.lblSpeedTemp.text = String(format: "%.2f", city.wind.speed)
        self.lblCityName.text = city.name ?? ""
        self.lblDate.text = city.dt.getDateStringFromUTC()
    }
    
}
