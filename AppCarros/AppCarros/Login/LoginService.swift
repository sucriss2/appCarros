//
//  LoginService.swift
//  AppCarros
//
//  Created by Suh on 03/11/22.
//

import Foundation

struct LoginService {

    static private let basepath = "https://carros-springboot.herokuapp.com/api/v2/login"

    static func loadRepository(onComplete: @escaping (Login ) -> Void) {
        guard let url = URL(string: basepath) else { return }
        let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
            if error == nil {
                guard let response = response as? HTTPURLResponse else { return }
                if response.statusCode >= 200 && response.statusCode < 300 {
                    guard let data = data else { return }
                    do {
                        let decode = JSONDecoder()
                        decode.keyDecodingStrategy = .convertFromSnakeCase
                        let user = try decode.decode(Login.self, from: data)
                        onComplete(user)
                    } catch {
                        print(error.localizedDescription)
                    }
                } else {
                    print("Algum status inválido pelo servidor!!")
                }
            } else {
                print(error!)
            }
        }
        dataTask.resume()
    }
}
