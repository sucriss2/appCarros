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
    // var model = ListCarsModel()
    var cars = ["Chevrolet", "Toyota", "Hyundai", "Volkswagen", "Jeep", "Renault", "Honda"]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
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
        let cell = UITableViewCell(style: .default, reuseIdentifier: "") // Criando a celula.
    // let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = cars[indexPath.row]
        return cell
    }

}
