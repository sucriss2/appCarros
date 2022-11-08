//
//  Car.swift
//  AppCarros
//
//  Created by Suh on 07/11/22.
//
// swiftlint:disable line_length

import Foundation

struct Car: Codable {
    var id: Int
    var nome: String
    var tipo: String
    var descricao: String?
    var urlFoto: String?
    var urlVideo: String?
    var latitude: String?
    var longitude: String?
}

extension Car {
    static func fixture(
        id: Int = 13381,
        nome: String = "Ferrari FF",
        tipo: String = "esportivos",
        descricao: String? = "Desc Maserati Grancabrio Sport",
        urlFoto: String? = "https://s3-sa-east-1.amazonaws.com/videos.livetouchdev.com.br/esportivos/Maserati_Grancabrio_Sport.png",
        urlVideo: String? = "https://s3-sa-east-1.amazonaws.com/videos.livetouchdev.com.br/esportivos/renault_megane.mp4",
        latitude: String? = nil,
        longitude: String? = nil
    ) -> Car {
        Car(id: id, nome: nome, tipo: tipo, descricao: descricao, urlFoto: urlFoto, urlVideo: urlVideo, latitude: latitude, longitude: longitude)
    }
}
