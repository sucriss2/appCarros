//
//  ListCarsCoordinator.swift
//  AppCarros
//
//  Created by Suh on 04/11/22.
//

import Foundation
import UIKit

class ListCarsCoordinator: Coordinator {
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let listCarsVC = ListCarsViewController()
        navigationController.pushViewController(listCarsVC, animated: true)
    }

}
