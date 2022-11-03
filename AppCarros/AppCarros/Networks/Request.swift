//
//  Request.swift
//  AppCarros
//
//  Created by Suh on 03/11/22.
//

import Foundation

enum RequestMethod: String {
    case get = "GET"
    case post = "POST"
}

protocol RequestProtocol {
    var baseURL: String { get }
    var path: String { get }
    var header: [String: String] { get }
    var method: RequestMethod { get }
}

struct Request: RequestProtocol {
    var baseURL: String
    var path: String
    var header: [String: String]
    var method: RequestMethod
}
