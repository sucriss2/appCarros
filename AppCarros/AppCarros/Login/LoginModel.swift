//
//  LoginModel.swift
//  AppCarros
//
//  Created by Suh on 03/11/22.
//

import Foundation

protocol LoginModelDelegate: AnyObject {
    func loginSuccess()
    func loginFail(message: String)
}

class LoginModel {
    weak var delegate: LoginModelDelegate?
    var service: LoginService?
    private var userSession: UserSession

    init(userSession: UserSession = UserSession.shared) {
        self.userSession = userSession
    }

    func login(username: String, password: String) {
        service?.login(
            username: username,
            password: password,
            onComplete: { [weak self] user in
                self?.userSession.set(user: user)
                self?.delegate?.loginSuccess()
                print("=> Usuario encontrado <=")
            },
            onError: { error in
                self.delegate?.loginFail(message: "Erro de login. Confira seus dados e tente novamente.")
                print(error.localizedDescription)
            }
        )
    }

}
