//
//  AppCoordinator.swift
//  AppCarros
//
//  Created by Suh on 02/11/22.
//

import UIKit

class AppCoordinator: Coordinator {

    var navigationController: UINavigationController
    private var window: UIWindow?
    private var childCoordinator: Coordinator?

    init(navigationController: UINavigationController, window: UIWindow) {
        self.navigationController = navigationController
        self.window = window
    }

    func start() {
        let navigationController = UINavigationController()
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()

        showLoginCoordinator(navigationController)
    }

    fileprivate func showLoginCoordinator(_ navigationController: UINavigationController) {
        let loginCoordinator = LoginCoordinator(navigationController: navigationController)
        loginCoordinator.start()
        childCoordinator = loginCoordinator
    }

}
