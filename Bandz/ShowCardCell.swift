//
//  ShowCardCell.swift
//  Bandz
//
//  Created by Vitor Ferraz on 29/06/17.
//  Copyright © 2017 Bandz. All rights reserved.
//

import UIKit

class ShowCardCell: UITableViewCell {

  @IBOutlet weak var genero1: UILabel!
  @IBOutlet weak var genero2: UILabel!
  @IBOutlet weak var genero3: UILabel!
  @IBOutlet weak var more: UILabel!
  @IBOutlet weak var nomeVenue: UILabel!
  
  @IBOutlet weak var imgBand: UIImageView!
  
  override func awakeFromNib() {
    configCellStyle()
  }

  func configCellStyle(){
    self.imgBand.layer.cornerRadius = self.imgBand.frame.size.width / 2;
    self.imgBand.clipsToBounds = true;
    let cornerLabel  = CGFloat(15)
    
    self.genero1.layer.masksToBounds = true
     self.genero1.layer.cornerRadius = CGFloat(cornerLabel)
    
    self.genero2.layer.masksToBounds = true
    self.genero2.layer.cornerRadius = cornerLabel
    
    self.genero3.layer.masksToBounds = true
    self.genero3.layer.cornerRadius = cornerLabel
    
    self.more.layer.masksToBounds = true
    self.more.layer.cornerRadius = cornerLabel
  }
  
    
}
