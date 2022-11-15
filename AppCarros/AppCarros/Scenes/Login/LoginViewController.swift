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
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!

    weak var delegate: LoginViewControllerDelegate?
    var model: LoginModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        stopLoading()
        model?.delegate = self
        loginTextField.delegate = self
        passwordTextField.delegate = self
    }

    @IBAction func show(_ sender: UIButton) {
        if validateForm() {
            model?.login(username: loginTextField.text ?? "", password: passwordTextField.text ?? "")
        }
        showLoading()

    }

    private func showLoading() {
        loadingIndicator.isHidden = false
        loadingIndicator.startAnimating()
        loginButton.isEnabled = false
    }

    private func stopLoading() {
        loadingIndicator.isHidden = true
        loadingIndicator.stopAnimating()
        loginButton.isEnabled = true
    }

    private func validateForm() -> Bool {
        if loginTextField.text?.isEmpty == true {
            stopLoading()
            alert(message: "Campo de Usuario deve ser preenchido")
            return false
        }

        if passwordTextField.text?.isEmpty == true {
            stopLoading()
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
            self?.stopLoading()
        }
    }

    func loginFail(message: String) {
        DispatchQueue.main.async {
            self.alert(message: message)
            self.stopLoading()
        }
    }
}
