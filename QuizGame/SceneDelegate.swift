//
//  SceneDelegate.swift
//  QuizGame
//
//  Created by Крылов Данила  on 28.10.2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        window = UIWindow(frame: UIScreen.main.bounds)
        let viewController = StartController()
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()

        guard let windowScene = (scene as? UIWindowScene) else { return }
        window?.windowScene = windowScene

    }

}

