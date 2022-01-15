//
//  AppDelegate.swift
//  TransartistryApp
//
//  Created by Матвей Бойков on 02.01.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        self.window = UIWindow()
        let photoPickerVC: Presentable = PhotoPickerModuleAssembly()
        window?.rootViewController = photoPickerVC.configureModule()
        window?.makeKeyAndVisible()
        return true
    }
}
