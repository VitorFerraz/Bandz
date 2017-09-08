//
//  User.swift
//  Bandz
//
//  Created by Vitor Ferraz on 22/08/17.
//  Copyright © 2017 Bandz. All rights reserved.
//

import UIKit

class User{
  var id:Int = 1
  
  var first_name:String
  var last_name:String
  
  var email:String?
  
  var type:String?

  //type =
  //b =  band
  //h= host
  init(id:Int,nome:String,sobreNome:String,email:String,type:String) {
    self.id = id
    self.first_name = nome
    self.last_name = sobreNome
    self.email = email
    self.type = type
  }
}
