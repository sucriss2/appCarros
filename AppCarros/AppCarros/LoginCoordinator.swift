//
//  LoginCoordinator.swift
//  AppCarros
//
//  Created by Suh on 02/11/22.
//

import Foundation
import UIKit

class LoginCoordinator: Coordinator {
    var navigationController: UINavigationController
    // private var viewController: LoginViewController?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let loginVC = LoginViewController()
        loginVC.coordinator = self
        navigationController.pushViewController(loginVC, animated: true)
    }

//    private func makeLoginViewController() -> LoginViewController {
//        let storyboard = UIStoryboard(name: "LoginStoryboard", bundle: nil)
//        guard let viewController = storyboard.instantiateViewController(
//            withIdentifier: "LoginViewController"
//        ) as? LoginViewController else {
//            fatalError()
//        }
//
//        viewController.coordinator = self
//
//        return viewController
//    }
}
