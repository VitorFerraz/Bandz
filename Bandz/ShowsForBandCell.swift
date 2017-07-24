//
//  ShowsForBandCell.swift
//  Bandz
//
//  Created by Vitor Ferraz on 17/07/17.
//  Copyright © 2017 Bandz. All rights reserved.
//

import UIKit

class ShowsForBandCell: UITableViewCell {

  @IBOutlet weak var logoVenue: UIImageView!
  @IBOutlet weak var nomeVenue: UILabel!
  @IBOutlet weak var estilo1: UILabel!
  @IBOutlet weak var estilo2: UILabel!
  @IBOutlet weak var estilo3: UILabel!

  @IBOutlet weak var tipoLugar: UILabel!
  @IBOutlet weak var endereco: UILabel!
  
  @IBOutlet weak var data: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
      self.logoVenue.layer.cornerRadius = self.logoVenue.frame.size.width / 2
      self.estilo1.layer.cornerRadius = self.logoVenue.frame.size.width / 7
      self.estilo2.layer.cornerRadius = self.logoVenue.frame.size.width / 7
      self.estilo3.layer.cornerRadius = self.logoVenue.frame.size.width / 7
      


      
      
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
