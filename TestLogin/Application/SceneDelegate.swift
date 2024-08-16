//
//  SceneDelegate.swift
//  TestLogin
//
//  Created by Satoshi on 16.08.2024.
//

import UIKit

// MARK: - SceneDelegate

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    // MARK: - Internal Properties

    var window: UIWindow?
    
    // MARK: - Internal Methods
    
    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = SignUpViewController()
        self.window = window
        window.makeKeyAndVisible()
    }
}

