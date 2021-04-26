//
//  SceneDelegate.swift
//  Cloudy
//
//  Created by Bart Jacobs on 15/05/2020.
//  Copyright © 2020 Cocoacasts. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    // MARK: - Properties
    
    var window: UIWindow?

    // MARK: - Scene Life Cycle

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else {
            return
        }
        
        // Configure Window
        window?.tintColor = UIColor(red:0.99, green:0.47, blue:0.44, alpha:1.0)
    }

    func sceneDidDisconnect(_ scene: UIScene) {}

    // MARK: -
    
    func sceneDidBecomeActive(_ scene: UIScene) {}

    func sceneWillResignActive(_ scene: UIScene) {}

    func sceneWillEnterForeground(_ scene: UIScene) {}

    func sceneDidEnterBackground(_ scene: UIScene) {}

}
