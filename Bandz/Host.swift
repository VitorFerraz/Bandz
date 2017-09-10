//
//  Host.swift
//  Bandz
//
//  Created by Vitor Ferraz on 22/08/17.
//  Copyright © 2017 Bandz. All rights reserved.
//

import UIKit

class Host:User{
  
  var idHost:Int?
  var max_capacity:Int?
  var locationId:Int?
  init(nome:String,sobreNome:String,email:String) {
    idHost = 1
    super.init(id: idHost!, nome: nome, sobreNome: sobreNome, email: email, type: "h")
  }
}
