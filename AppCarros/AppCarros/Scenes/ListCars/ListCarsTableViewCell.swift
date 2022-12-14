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
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    func prepare(model: Car) {
        nameLabel.text = model.name
        let url = URL(string: model.urlPhoto ?? "")
        self.photoImageView.kf.setImage(with: url)
    }

}
