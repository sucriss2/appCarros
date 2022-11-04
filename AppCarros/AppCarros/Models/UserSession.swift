//
//  UserSession.swift
//  AppCarros
//
//  Created by Suh on 03/11/22.
//

import Foundation

class UserSession {
    static let shared = UserSession()

    private(set) var user: User?

    var token: String {
        return user?.token ?? ""
    }

    private init() {}

    func set(user: User?) {
        self.user = user
    }

}
