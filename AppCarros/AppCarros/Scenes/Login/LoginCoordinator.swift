//
//  LoginCoordinator.swift
//  AppCarros
//
//  Created by Suh on 02/11/22.
//

import Foundation
import UIKit

protocol LoginCoordinatorDelegate: AnyObject {
    func showHomeScreen()
}

class LoginCoordinator: Coordinator {
    var navigationController: UINavigationController
    private var listCarsCoordinator: ListCarsCoordinator?
    weak var loginDelegate: LoginCoordinatorDelegate?

    init(navigationController: UINavigationController, loginDelegate: LoginCoordinatorDelegate?) {
        self.navigationController = navigationController
        self.loginDelegate = loginDelegate
    }

    func start() {
        let loginVC = makeLoginViewController()
        navigationController.pushViewController(loginVC, animated: true)
    }

    private func makeLoginViewController() -> LoginViewController {
        let model = LoginModel()
        let service = LoginService()
        let storyboard = UIStoryboard(name: "LoginStoryboard", bundle: nil)
        guard let viewController = storyboard.instantiateViewController(
            withIdentifier: "LoginViewController"
        ) as? LoginViewController else {
            fatalError()
        }

        model.service = service
        model.delegate = viewController
        viewController.model = model
        viewController.delegate = self

        return viewController
    }

}

extension LoginCoordinator: LoginViewControllerDelegate {
    func showListCars() {
        loginDelegate?.showHomeScreen()
    }
}
