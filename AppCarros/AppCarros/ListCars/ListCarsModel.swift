//
//  ListCarsModel.swift
//  AppCarros
//
//  Created by Suh on 07/11/22.
//

import Foundation

class ListCarsModel {
    private(set) var cars: [Car]

    init() {
        cars = [ .fixture(), .fixture()]
    }

}
