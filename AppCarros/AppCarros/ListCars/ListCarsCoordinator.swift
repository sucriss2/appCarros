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
    private var detailCoordinator: DetailCoordinator?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let listCarsVC = makeListCarsViewController()
        navigationController.pushViewController(listCarsVC, animated: true)
    }

    private func makeListCarsViewController() -> ListCarsViewController {
        let model = ListCarsModel()
        let service = ListCarsService()
        let storyboard = UIStoryboard(name: "ListCarsStoryboard", bundle: nil)
        guard let viewController = storyboard.instantiateViewController(
            withIdentifier: "ListCarsViewController"
        ) as? ListCarsViewController else {
            fatalError()
        }

        model.service = service
        model.delegate = viewController
        viewController.model = model
        viewController.delegate = self

        return viewController
    }

}

extension ListCarsCoordinator: ListCarsViewControllerDelegate {
    func showDetail(car: Car) {
        let detailCoordinator = DetailCoordinator(car: car, navigationController: navigationController)
        detailCoordinator.start()
        self.detailCoordinator = detailCoordinator
    }

}
