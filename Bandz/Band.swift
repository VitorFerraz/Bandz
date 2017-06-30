//
//  Band.swift
//  Bandz
//
//  Created by Vitor Ferraz on 29/06/17.
//  Copyright © 2017 Bandz. All rights reserved.
//

import UIKit


class Band{
  var id:Int
   var nome:String
   var estilo:String
   var logo:UIImage?
  
  init(codigoDaBanda id:Int,banda nome:String, estilo:String) {
    self.id = id
    self.nome = nome
    self.estilo = estilo
  }
}
