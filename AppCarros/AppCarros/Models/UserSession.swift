//
//  UserSession.swift
//  AppCarros
//
//  Created by Suh on 03/11/22.
//

import Foundation

class UserSession: Codable {
    static let shared = UserSession()

    private(set) var user: User?

    var token: String {
        return "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJ1c2VyIiwiZXhwIjoxNjY4NzE0MDE5LCJyb2wiOlsiUk9MRV9VU0VSIl19.orAzvpQeFrRBx3xtCSVgXGYtB0n79zyV71o6gC52t0cME1UUwO9XW6Fc05DCELI7bFBefI19S9yFCgVovYPEbw"
        //return user?.token ?? ""
    }

    var bearerToken: String {
        return "Bearer \(token)"
    }

    private init() {}

    func set(user: User?) {
        self.user = user
        
    }

}
