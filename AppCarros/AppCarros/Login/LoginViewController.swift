//
//  LoginViewController.swift
//  AppCarros
//
//  Created by Suh on 02/11/22.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!

    weak var coordinator: LoginCoordinator?
    var model: LoginModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.isEnabled = false
        model?.delegate = self
        loginTextField.delegate = self
        passwordTextField.delegate = self
        print("==> Abriu a view fofa")

    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        if loginTextField.text?.isEmpty == false && passwordTextField.text?.isEmpty == false {
            loginButton.isEnabled = true
        }
    }

    func alert(message: String) {
        let alert = UIAlertController(title: "Atenção!!", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }

    @IBAction func show(_ sender: UIButton) {
    }

}

extension LoginViewController: LoginModelDelegate {
    func loginModelSuccess() {
        print("-> OKOKOK <-")
    }
    func loginModelFail(message: String) {
        alert(message: message)
    }
}
