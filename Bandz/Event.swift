//
//  Show.swift
//  Bandz
//
//  Created by Vitor Ferraz on 29/06/17.
//  Copyright © 2017 Bandz. All rights reserved.
//


import UIKit



class Event{
    //MARK: -  Propriedades

    var id:String?
    var nomeHost:String?
    var nomeEvent:String?
    var estilos:[String]?
    var logo:UIImage?
    var dataInicio:String?
    var dataTermino:String?
    var endereco:String?
    var placeId:String?
    var imagens:[UIImage]?
    var descricao:String?
    var capacidadeMax:Int?
    var idade:Int?
    var valor:Double?
  
    
    //MARK: -  Inicializador
  
  init() {
      self.id = UUID().uuidString
      self.imagens?.append(contentsOf: [#imageLiteral(resourceName: "casa_show"),#imageLiteral(resourceName: "casa_show2")])
      self.logo = UIImage(named: "logo1bandz.png")

    


  }
    
//    //Dummy init
//  init() {
//        self.id = UUID().uuidString
//        self.endereco = "Rua dos Palmares, 235"
//        self.data = "22/11/1994"
//        self.logo = UIImage(named: "logo1bandz.png")
//        self.estilos.append(contentsOf: ["Rock","Punk","Indie"])
//        self.imagens?.append(contentsOf: [#imageLiteral(resourceName: "casa_show"),#imageLiteral(resourceName: "casa_show2")])
//        self.nomeShow = "Noite das Panteras"
//        self.capacidadeMax = 100
//        self.descricao = "Localizado no bairro da Vila Madalena, há mais de 20 anos o Morrison Rock Bar é um clássico da cidade mais roqueira do Brasil. "
//    }

    
    
    //MARK: -  Métodos
    
    func getEstilos()->[String]{
        return estilos!
    }
    
    
}
