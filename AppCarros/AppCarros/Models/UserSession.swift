//
//  UserSession.swift
//  AppCarros
//
//  Created by Suh on 03/11/22.
//
// swiftlint:disable line_length

import Foundation

class UserSession: Codable {
    static let shared = UserSession()

    private(set) var user: User?

    var token: String {
        return "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJ1c2VyIiwiZXhwIjoxNjY4Nzc2MDExLCJyb2wiOlsiUk9MRV9VU0VSIl19.mVjzxeZOUGyI1xMXjRmYCtfswRErja12C_BRNw8FWqkc1yLGY3eTL4-uMMyGzS22Kj16e9FGD01KTS4FEfUCiw"
        // return user?.token ?? ""
    }

    var bearerToken: String {
        return "Bearer \(token)"
    }

    private init() {}

    func set(user: User?) {
        self.user = user
    }

}
