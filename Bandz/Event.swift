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
  
  var hostID:Int?
  var estilos:[String]
  var nomeEvento:String
  var descricao:String
  var url:String
  var dataInicio:Date
  var dataTermino:Date
  var idade:Int
  var valor:Double
  var imagens:[UIImage]
  var logo:UIImage
  
  
  
  //  "host":"", // id
  //  "music_genres": [""],//array string
  //  "name": "", //nome do evento
  //  "description": "", //descricao
  //  "url": 1, // url https://www
  //  "starts_at": "1900-11-11T11:11:00Z", //
  //  "ends_at": "1900-11-11T11:11:00Z", //
  //  "min_age":12, //
  //  "price": 123 //
  
  
  //MARK: -  Inicializador
  
  init(hostID:Int,estilos:[String],nomeEvento:String,descricao:String,url:String,dataInicio:Date,dataTermino:Date,idade:Int,valor:Double) {
    self.hostID = hostID
    self.estilos = estilos
    self.nomeEvento = nomeEvento
    self.descricao = descricao
    self.url = url
    self.dataInicio = dataInicio
    self.dataTermino = dataTermino
    self.idade = idade
    self.valor = valor
    self.imagens =  [UIImage(named: "logo1bandz.png")!,UIImage(named: "logo1bandz.png")!]
    self.logo = UIImage(named: "logo1bandz.png")!
    
    
    
    
  }
  
  //    //Dummy init
  //   init() {
  //        self.id = UUID().uuidString
  //        self.endereco = "Rua dos Palmares, 235"
  //        self.data = "22/11/1994"
  //        self.logo = UIImage(named: "logo1bandz.png")
  //        self.estilos.append(contentsOf: ["Rock","Punk","Indie"])
  //        self.imagens?.append(contentsOf: [#imageLiteral(resourceName: "casa_show"),#imageLiteral(resourceName: "casa_show2")])
  //        self.nomeShow = "Noite das Panteras"
  //        self.capacidadeMax = 100
  //        self.descricao = "Localizado no bairro da Vila Madalena, há mais de 20 anos o Morrison Rock Bar é um clássico da cidade mais roqueira do Brasil. "
  //      self.init()
  //  }
  
  
  
  //MARK: -  Métodos
  
  func getEstilos()->[String]{
    return ["Rock","Punk","Indie"]
  }
  
  
}
