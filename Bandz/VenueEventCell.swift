//
//  VenueShowCell.swift
//  Bandz
//
//  Created by Vitor Ferraz on 13/08/17.
//  Copyright © 2017 Bandz. All rights reserved.
//

import UIKit

class VenueEventCell: UITableViewCell {

  @IBOutlet weak var data: UILabel!
  @IBOutlet weak var titulo: UILabel!
  @IBOutlet weak var imageEvent: UIImageView!
  
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
      imageEvent.layer.cornerRadius = imageEvent.frame.size.width/2

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
