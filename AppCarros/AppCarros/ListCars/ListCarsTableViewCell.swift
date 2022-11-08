//
//  ListCarsTableViewCell.swift
//  AppCarros
//
//  Created by Suh on 07/11/22.
//

import UIKit
import Kingfisher

class ListCarsTableViewCell: UITableViewCell {

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func prepare(model: Car) {
        nameLabel.text = model.nome
        let url = URL(string: model.urlFoto ?? "")
        self.photoImageView.kf.setImage(with: url)
    }
}
