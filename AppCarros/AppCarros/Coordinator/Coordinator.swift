//
//  Coordinator.swift
//  AppCarros
//
//  Created by Suh on 02/11/22.
//

import Foundation
import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get set }
    func start()
}
