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
        DispatchQueue.main.async {
            // ir para proxima tela
        }
    }

    func loginFail(message: String) {
        DispatchQueue.main.async {
            self.alert(message: message)
        }
    }
}
