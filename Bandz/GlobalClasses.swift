//
//  GlobalClasses.swift
//  Bandz
//
//  Created by Vitor Ferraz on 17/07/17.
//  Copyright © 2017 Bandz. All rights reserved.
//

import UIKit

class ShowsStore{
  var listaShows = [Show]()

  func carregaShows(){
    for x in 1...6{
      listaShows.append(Show(nomeHost: "Morrison Rock Bar \(x)", estilos: ["Punk","Rock","Indie"]))
      
    }
    
  }
}
