//
//  AppDelegate.swift
//  AboutLifeCycle
//
//  Created by i9400506 on 2021/12/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
        
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        print("appdelete - \(#function)")
        return true
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        print("appdelete - \(#function)")
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        print("appdelete - \(#function)")
    }
}

