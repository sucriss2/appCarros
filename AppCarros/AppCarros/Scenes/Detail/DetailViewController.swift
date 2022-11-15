//
//  DetailViewController.swift
//  AppCarros
//
//  Created by Suh on 08/11/22.
//

import UIKit
import MapKit
import Kingfisher

protocol DetailViewControllerDelegate: AnyObject {
    func showVideo(url: URL)
}

class DetailViewController: UIViewController {

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var nomeLabel: UILabel!
    @IBOutlet weak var tipoLabel: UILabel!
    @IBOutlet weak var descricaoLabel: UILabel!
    @IBOutlet weak var mapaMapView: MKMapView!

    weak var delegate: DetailViewControllerDelegate?
    var model: DetailModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Detalhes"
        showDetail()
    }

    @IBAction func showVideo(_ sender: UIButton) {
        guard let model = model else {
            return
        }
        delegate?.showVideo(url: model.carVideo)
    }

    private func showDetail() {
        guard let model = model else {
            return
        }

        photoImageView.kf.setImage(with: model.carPhoto)
        nomeLabel.text = model.carNome
        tipoLabel.text = model.carTipo
        descricaoLabel.text = model.carDescricao
        showMap()
    }

    private func showMap() {
        guard let model = model else {
            return
        }

        mapaMapView.isHidden = true
        if model.hasCoordinates {
            mapaMapView.isHidden = false
            let coords = CLLocationCoordinate2D(latitude: model.carLat, longitude: model.carLong)
            let span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
            let region = MKCoordinateRegion(center: coords, span: span)
            mapaMapView.region = region
        }

    }

}
