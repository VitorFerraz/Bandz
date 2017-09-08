//
//  Proposal.swift
//  Bandz
//
//  Created by Vitor Ferraz on 22/08/17.
//  Copyright © 2017 Bandz. All rights reserved.
//

import UIKit

class Proposal{
  var nomeBanda:String?
  var valorCache:Double?
  var mensagem:String?
  
  var status:Bool?
  
  init(nomeBanda:String,valorCache:Double,mensagem:String) {
    self.nomeBanda = nomeBanda
    self.valorCache = valorCache
    self.mensagem = mensagem
    self.status = false
  }
  
  
  
  
 
}
