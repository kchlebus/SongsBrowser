//
//  AppDelegate.swift
//  SongsBrowser
//
//  Created by Kamil Chlebuś on 21/10/2017.
//  Copyright © 2017 Kamil Chlebuś. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        setNavigationBarAppearance()
        return true
    }

    func setNavigationBarAppearance() {
        UINavigationBar.appearance().barTintColor = UIColor(red: 92/255.0, green: 64/255.0, blue: 56.0/255.0, alpha: 1.0)
        UINavigationBar.appearance().tintColor = UIColor.white
        if let barFont = UIFont(name: "Avenir-Light", size: 18.0) {
            UINavigationBar.appearance().titleTextAttributes = [
                NSAttributedStringKey.foregroundColor: UIColor.white,
                NSAttributedStringKey.font: barFont
            ]
        }
    }

}
