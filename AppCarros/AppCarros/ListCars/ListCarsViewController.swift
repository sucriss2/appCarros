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

    override func viewDidLoad() {
        super.viewDidLoad()
        print("~~~> Abriu a SEGUNDA TELA fofa.!!")
    }

}