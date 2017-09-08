//
//  Band.swift
//  Bandz
//
//  Created by Vitor Ferraz on 29/06/17.
//  Copyright © 2017 Bandz. All rights reserved.
//

import UIKit


class Band:User{
   var estilo:String
   var logo:UIImage?
   var codigoDaBanda = 1
  init(banda nome:String,email:String, estilo:String) {
    self.estilo = estilo
    self.logo = UIImage(named: "logo1bandz.png")
    super.init(id: codigoDaBanda, nome: nome, sobreNome: "", email: email, type: "b")
    
  }
}
