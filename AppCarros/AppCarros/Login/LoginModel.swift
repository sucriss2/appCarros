//
//  LoginModel.swift
//  AppCarros
//
//  Created by Suh on 03/11/22.
//

import Foundation

class LoginModel {
    private let expectedUsername = "Su"
    private let expectedPassword = "123"

    var user: String
    var password: String
//    var delegate: LoginModelDelegate?

    init(){
        user = ""
        password = ""
    }

    func login() {
//        if user == expectedUser && password == expectedPassword {
//            delegate?.loginModelSuccess()
//        }
//        delegate?.loginModelFail(message: "Erro de login. Confira seus dados e tente novamente.")
    }
}
