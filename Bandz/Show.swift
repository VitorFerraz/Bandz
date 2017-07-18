//
//  Show.swift
//  Bandz
//
//  Created by Vitor Ferraz on 29/06/17.
//  Copyright © 2017 Bandz. All rights reserved.
//


import UIKit


class Show{
  var id:String
  var nomeHost:String
  var estilos = [String]()
  var logo:UIImage?
  var data:String
  var tipoLugar:String? //Casa de Show, Bar , Parque etc..
  
  var endereco:String?
  
  init(nomeHost :String, estilos:[String]) {
    self.id = UUID().uuidString
    self.nomeHost = nomeHost
    self.estilos = estilos
    self.tipoLugar = "Bar"
    self.endereco = "Rua dos Palmares, 235"
    self.data = "22/11/1994"
    self.logo = UIImage(named: "logo1bandz.png")
  }
}
