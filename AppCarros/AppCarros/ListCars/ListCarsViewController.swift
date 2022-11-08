//
//  ListCarsViewController.swift
//  AppCarros
//
//  Created by Suh on 04/11/22.
//

import UIKit

class ListCarsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!

    weak var coordinator: ListCarsCoordinator?
    var model: ListCarsModel?
    var cars: [Car] {
        model?.cars ?? []
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        model?.load()
        print("~~~> Abriu a SEGUNDA TELA fofa.!!")
    }

}

extension ListCarsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cars.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "cell", for: indexPath
        ) as? ListCarsTableViewCell else {
            fatalError()
        }
        let car = cars[indexPath.row]
        cell.prepare(model: car)
        return cell
    }

}

extension ListCarsViewController: ListCarsModelDelegate {
    func didUpdateListCars() {
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }

    func didErrorListCars(message: String) {
        DispatchQueue.main.async {
            print(message)
        }
    }

}
