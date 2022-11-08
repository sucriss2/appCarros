//
//  DetailCoordinator.swift
//  AppCarros
//
//  Created by Suh on 08/11/22.
//

import Foundation
import UIKit

class DetailCoordinator: Coordinator {
    private let car: Car
    var navigationController: UINavigationController

    init(car: Car, navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.car = car
    }

    func start() {
        let detailVC = makeDetailViewController()
        navigationController.pushViewController(detailVC, animated: true)
    }

    private func makeDetailViewController() -> DetailViewController {
        let model = DetailModel(car: car)
        let storyboard = UIStoryboard(name: "DetailStoryboard", bundle: nil)
        guard let viewController = storyboard.instantiateViewController(
            withIdentifier: "DetailViewController"
        ) as? DetailViewController else {
            fatalError()
        }

        viewController.model = model

        return viewController
    }

}
