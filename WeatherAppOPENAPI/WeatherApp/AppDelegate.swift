//
//  AppDelegate.swift
//  WeatherApp
//
//  Created by Taimoor Ali on 20/05/2020.
//  Copyright © 2020 Taimoor Ali. All rights reserved.
//

import UIKit
import SVProgressHUD

var cityIds: [List] = []
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        if #available(iOS 13.0, *) {
            window = UIWindow(frame: UIScreen.main.bounds)
            window?.overrideUserInterfaceStyle = .light
        }
        SVProgressHUD.setDefaultStyle(SVProgressHUDStyle.custom)
        SVProgressHUD.setDefaultAnimationType(SVProgressHUDAnimationType.flat)
        SVProgressHUD.setDefaultMaskType(SVProgressHUDMaskType.black)
        SVProgressHUD.setForegroundColor(UIColor(red: 248/255.0, green: 190/255.0, blue: 101/255.0, alpha: 1.0))
        SVProgressHUD.setBackgroundColor(UIColor.white)
        
        //Loading CitiesID from local JSON
        if let cityIDS = loadJson() {
            cityIds = cityIDS
        }

        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    func loadJson() -> [List]? {
        if let url = Bundle.main.url(forResource: "city.list", withExtension: "json") {
                do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode([List].self, from: data)
                return jsonData
            } catch {
                print("error:\(error)")
            }
        }
        return nil
    }
    

}

