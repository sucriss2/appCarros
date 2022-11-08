//
//  AppCoordinator.swift
//  AppCarros
//
//  Created by Suh on 02/11/22.
//

import UIKit

class AppCoordinator {

    var navigationController: UINavigationController!
    private var window: UIWindow?
    private var childCoordinator: Coordinator?

    init(window: UIWindow) {
        self.window = window
    }

    func start() {
        showLoginCoordinator()
    }

    fileprivate func showLoginCoordinator() {
        let navigationController = UINavigationController()
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()

        let detailCoordinator = DetailCoordinator(navigationController: navigationController)
        detailCoordinator.start()
        childCoordinator = detailCoordinator

//        let loginCoordinator = LoginCoordinator(navigationController: navigationController, loginDelegate: self)
//        loginCoordinator.start()
//        childCoordinator = loginCoordinator
    }

    fileprivate func showHomeCoordinator() {
        let navigationController = UINavigationController()
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()

        let listCarsCoordinator = ListCarsCoordinator(navigationController: navigationController)
        listCarsCoordinator.start()
        childCoordinator = listCarsCoordinator
    }

}

extension AppCoordinator: LoginCoordinatorDelegate {
    func showHomeScreen() {
        showHomeCoordinator()
    }
}
