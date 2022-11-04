//
//  LoginService.swift
//  AppCarros
//
//  Created by Suh on 03/11/22.
//

import Foundation

struct LoginService {
    private let network: Network

    init(network: Network = Network.shared) {
        self.network = network
    }

    func fecthLogin(
        onComplete: @escaping (Login) -> Void,
        onError: @escaping (Error) -> Void
    ) {
        let request = Request.init(
            baseURL: Config.baseURL,
            path: "login",
            method: RequestMethod.post
        )

        network.request(request: request, returning: Login.self) { result in
            switch result {
            case .failure(let error):
                onError(error)
            case .success(let user):
                onComplete(user ?? Login(username: "", password: ""))
            }
        }
    }

}
