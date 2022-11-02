//
//  LoginViewController.swift
//  AppCarros
//
//  Created by Suh on 02/11/22.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var loginLabel: UITextField!
    @IBOutlet weak var passwordLabel: UITextField!

    weak var coordinator: LoginCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        print("==> Abriu a view fofa")
        // view.backgroundColor = .blue
    }

    @IBAction func loginButton(_ sender: UIButton) {

    }

}
