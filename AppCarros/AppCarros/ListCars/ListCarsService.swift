//
//  ListCarsService.swift
//  AppCarros
//
//  Created by Suh on 07/11/22.
//

import Foundation

struct ListCarsService {
    private let network: Network
    private let userSession: UserSession

    init(network: Network = Network.shared, userSession: UserSession = UserSession.shared) {
        self.network = network
        self.userSession = userSession
    }

    func fetch(
        onComplete: @escaping (ListCars) -> Void,
        onError: @escaping (Error) -> Void
    ) {
        let header: [String: String] = [
            "Content-Type": "text/plain",
            "Accept": "*/*",
            "Authentication" : userSession.bearerToken
        ]

        let request = Request(
            baseURL: Config.baseURL,
            path: "carros",
            method: .get,
            header: header
        )

        network.request(request: request, returning: ListCars.self) { result in
            switch result {
            case .failure(let error):
                onError(error)
            case .success(let cars):
                onComplete(cars ?? ListCars(cars: []))
            }
        }
    }

}
