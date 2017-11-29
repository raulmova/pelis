//
//  PeliculasTableViewCell.swift
//  PeliculasApp
//
//  Created by Alumno ITESM Toluca on 01/11/17.
//  Copyright © 2017 Alumno ITESM Toluca. All rights reserved.
//

import UIKit

class PeliculasTableViewCell: UITableViewCell {

    @IBOutlet weak var tfNombre: UILabel!
    @IBOutlet weak var tfCompania: UILabel!
    @IBOutlet weak var tfRating: UILabel!
    @IBOutlet weak var ivFoto: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
