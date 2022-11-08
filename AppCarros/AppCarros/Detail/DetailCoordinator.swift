//
//  DetailCoordinator.swift
//  AppCarros
//
//  Created by Suh on 08/11/22.
//

import Foundation
import UIKit

class DetailCoordinator: Coordinator {
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let detailVC = DetailViewController()
        navigationController.pushViewController(detailVC, animated: true)
    }

}
