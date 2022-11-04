//
//  LoginModel.swift
//  AppCarros
//
//  Created by Suh on 03/11/22.
//

import Foundation

protocol LoginModelDelegate {
    func loginModelSuccess()
    func loginModelFail(message: String)
}

class LoginModel {
    private(set) var login: Login?
    private(set) var user: User?
    var delegate: LoginModelDelegate?
    var service: LoginService?

    init() {
    }

    func showLogin() {
        service?.fecthLogin(
            onComplete: { result in

                self.login = result
                print(result)
                self.delegate?.loginModelSuccess()
                print("=> Usuario encontrado <=")

            },
            onError: { error in

                self.delegate?.loginModelFail(message: "Erro de login. Confira seus dados e tente novamente.")
                print(error.localizedDescription)
            }
        )
    }

}
