//
//  ShowsStore.swift
//  Bandz
//
//  Created by Vitor Ferraz on 09/08/17.
//  Copyright © 2017 Bandz. All rights reserved.
//

import UIKit


class EventStore{
    var events:[Event] = []
    var eventTmp:Event?
  
  var lisfOfGenre:[GenreType] = []
		
  
    init() {
      //  loadEvents()
//      eventTmp = Event()
    }
    func addEvent(newEvent:Event){
        self.events.append(newEvent)
        api.createEvent(event: newEvent)
    }
    
    
    func removeEvent(id:String){
        self.events =  self.events.filter{$0.id != id}
        
    }
    
    func listEvents()->[Event]{
        return events
    }
    
    func returnEventAt(index:Int)->Event{
        return events[index]
    }
  
  
  func loadListOfGenre(){
   
    api.getMusicGenre(completion: { (list) in
      print(list)
    self.lisfOfGenre = list!
   })
    
    

  }
  
    
//    func loadEvents(){
////        for _ in 1...6{
////          var e = Event()
////          e.id = UUID().uuidString
////          e.endereco = "Rua dos Palmares, 235"
////          e.dataInicio = "22/11/1994"
////          e.dataTermino = "22/11/1994"
////
////          e.logo = UIImage(named: "logo1bandz.png")
////          e.estilos?.append(contentsOf: ["Rock","Punk","Indie"])
////          e.imagens?.append(contentsOf: [#imageLiteral(resourceName: "casa_show"),#imageLiteral(resourceName: "casa_show2")])
////          e.nomeEvent = "Noite das Panteras"
////
////          e.capacidadeMax = 100
////          e.descricao = "Localizado no bairro da Vila Madalena, há mais de 20 anos o Morrison Rock Bar é um clássico da cidade mais roqueira do Brasil. "
////            events.append(e)
////          
////            
////        }
//    }
  

}
