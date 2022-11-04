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
        let listCarsVC = makeListCarsViewController()
        navigationController.pushViewController(listCarsVC, animated: true)
    }

    private func makeListCarsViewController() -> ListCarsViewController {
        let storyboard = UIStoryboard(name: "ListCarsStoryboard", bundle: nil)
        guard let viewController = storyboard.instantiateViewController(
            withIdentifier: "ListCarsViewController"
        ) as? ListCarsViewController else {
            fatalError()
        }
        return viewController
    }

}
