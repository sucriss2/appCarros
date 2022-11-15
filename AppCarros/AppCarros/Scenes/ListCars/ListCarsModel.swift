//
//  ListCarsModel.swift
//  AppCarros
//
//  Created by Suh on 07/11/22.
//

import Foundation

protocol ListCarsModelDelegate: AnyObject {
    func didUpdateListCars()
    func didErrorListCars(message: String)
}

class ListCarsModel {
    private(set) var cars: [Car]
    var service: ListCarsService?
    weak var delegate: ListCarsModelDelegate?

    init() {
        cars = []
    }

    func load() {
        service?.fetch(
            onComplete: { [weak self] cars in
                guard let self = self else {
                    return
                }
                self.cars.append(contentsOf: cars)
                self.delegate?.didUpdateListCars()
            },
            onError: { error in
                self.delegate?.didErrorListCars(message: error.localizedDescription)
            }
        )
    }

}
