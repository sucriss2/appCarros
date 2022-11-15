//
//  DetailCoordinator.swift
//  AppCarros
//
//  Created by Suh on 08/11/22.
//

import Foundation
import UIKit
import SafariServices

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
        viewController.delegate = self

        return viewController
    }

    private func makeVideoController(url: URL) {
        let safariViewController = SFSafariViewController(url: url)
        navigationController.pushViewController(safariViewController, animated: true)
    }

}

extension DetailCoordinator: DetailViewControllerDelegate {
    func showVideo(url: URL) {
        makeVideoController(url: url)
    }
}
