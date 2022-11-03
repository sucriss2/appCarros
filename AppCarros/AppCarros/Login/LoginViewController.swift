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

    var login = "user"
    var password = "123"
//    var token = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        print("==> Abriu a view fofa")

    }

    func alert(message: String) {
        let alert = UIAlertController(title: "Atenção!!", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }

    @IBAction func loginButton(_ sender: UIButton) {
        if loginLabel.text == login && passwordLabel.text == password {
//            token = Login.token
//            print(token)
            print("===Sucess===")
        } else {
            alert(message: "Erro de login. Confira seus dados e tente novamente.")
            print("<<< Erro >>>")
        }
    }

}
