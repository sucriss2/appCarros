//
//  DetailViewController.swift
//  AppCarros
//
//  Created by Suh on 08/11/22.
//

import UIKit
import MapKit
import Kingfisher

class DetailViewController: UIViewController {

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var nomeLabel: UILabel!
    @IBOutlet weak var tipoLabel: UILabel!
    @IBOutlet weak var descricaoLabel: UILabel!
    @IBOutlet weak var mapaMapView: MKMapView!

    weak var coordinator: DetailCoordinator?
    var model: DetailModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        showDetail()
        print("Abriu a 3å tela fofinha")
    }

    private func showDetail() {
        let url = URL(string: model?.carPhoto ?? "")
        self.photoImageView.kf.setImage(with: url)
        nomeLabel.text = model?.carNome
        tipoLabel.text = model?.carTipo
        descricaoLabel.text = model?.carDescricao ?? ""
    }

}
