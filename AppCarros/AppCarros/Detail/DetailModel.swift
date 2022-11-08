//
//  DetailModel.swift
//  AppCarros
//
//  Created by Suh on 08/11/22.
//

import Foundation

class DetailModel {
    private var car: Car

    var carId: Int {
        return car.id
    }

    var carTipo: String {
        return car.tipo.capitalized
    }

    var carNome: String {
        return car.nome
    }

    var carDescricao: String {
        return car.descricao ?? ""
    }

    var carPhoto: String {
        return car.urlFoto ?? ""
    }

    var carVideo: String {
        return car.urlVideo ?? ""
    }

    var carLat: String {
        return car.latitude ?? ""
    }

    var carLong: String {
        return car.longitude ?? ""
    }

    init(car: Car) {
        self.car = car
    }

}
