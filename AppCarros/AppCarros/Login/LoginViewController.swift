//
//  LoginViewController.swift
//  AppCarros
//
//  Created by Suh on 02/11/22.
//

import UIKit

protocol LoginViewControllerDelegate: AnyObject {
    func showListCars()
}

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!

    weak var coordinator: LoginCoordinator?
    weak var delegate: LoginViewControllerDelegate?
    var model: LoginModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        model?.delegate = self
        loginTextField.delegate = self
        passwordTextField.delegate = self
        print("==> Abriu a view fofa")
    }

    @IBAction func show(_ sender: UIButton) {
        if validateForm() {
            model?.login(username: loginTextField.text ?? "", password: passwordTextField.text ?? "")
        }

    }

    private func validateForm() -> Bool {
        if loginTextField.text?.isEmpty == true {
            alert(message: "Campo de Usuario deve ser preenchido")
            return false
        }

        if passwordTextField.text?.isEmpty == true {
            alert(message: "Campo de Senha deve ser preenchido")
            return false
        }

        return true
    }

    private func alert(message: String) {
        let alert = UIAlertController(title: "Atenção!!", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }

}

extension LoginViewController: LoginModelDelegate {
    func loginSuccess() {
        DispatchQueue.main.async { [weak self] in
            self?.delegate?.showListCars()
            print("----->>>>>>>")
        }
    }

    func loginFail(message: String) {
        DispatchQueue.main.async {
            self.alert(message: message)
        }
    }
}
