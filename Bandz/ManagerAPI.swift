//
//  ManagerAPI.swift
//  Bandz
//
//  Created by Vitor Ferraz on 22/08/17.
//  Copyright © 2017 Bandz. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ManagerAPI{
  let url = "https://bandz-startup.herokuapp.com/api/"
    

  init(){

  }
  func getUsersById(id:String){
    Alamofire.request("\(url)\(id)/").responseJSON { response in
      print("Request: \(String(describing: response.request))")   // original url request
      print("Response: \(String(describing: response.response))") // http url response
      print("Result: \(response.result)")                         // response serialization result
      
      if let json = response.result.value {
        print("JSON: \(json)") // serialized json response
      }
      
      if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
        print("Data: \(utf8Text)") // original server data as UTF8 string
      }
    }
  }
  

  func getMusicGenre(completion: @escaping ([GenreType]?) -> Void){
    Alamofire.request("\(url)music-genres").responseJSON { response in

      
      if let json = response.result.value {
      //  print("JSON: \(json)") // serialized json response
        let json = JSON(json)
        let arrayNames =  json.arrayValue.map({$0["name"].stringValue})
        let arrayID =  json.arrayValue.map({$0["id"].stringValue})
        var genreList:[GenreType]? = []
        for (index,genero) in arrayNames.enumerated(){
          
          genreList?.append(GenreType(nome: genero, id: Int(arrayID[index])!))
        }

        
        completion(genreList)
        return
      }

      if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
        print("Data: \(utf8Text)") // original server data as UTF8 string
        completion(nil)
        return
      }
      

    }


  }
  
  func getPropositions(completion: @escaping () -> Void){
    Alamofire.request("\(url)propositions").responseJSON { response in

      if let json = response.result.value {
        
        let json = JSON(json)
        _ =  json.arrayValue.map({
        
        let bandJSON = $0["band"].stringValue.replacingOccurrences(of: "'", with: "\"")
        print(bandJSON)

        var nome = convertToDictionary(text:bandJSON)
        print("nome",nome)
        print("nome f ",nome!["name"] as! String)
        let nomeBand = nome!["name"] as! String
          let valorCache = Double($0["price"].stringValue)
          let mensagem = $0["message"].stringValue
          let status = Bool($0["confirmed"].stringValue)
          
          
          
          // var band = JSON.parse(bandJSON!)
          // print("teste",nome?["name"] ?? "erro")
          
          let propositon = Proposition(nomeBanda: nomeBand as! String , valorCache: valorCache!, mensagem: mensagem, status: status!)
          
          storeProposition.propositions.append(propositon)
        })

       dump(storeProposition.propositions)
        
     

        completion()
        return
      }
      
      if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
        print("Data: \(utf8Text)") // original server data as UTF8 string
        completion()
        return
      }
    }
  }
  
  func createPropositions(proposition:Proposition){
//  {
//    "band": null,
//    "host": null,
//    "event": null,
//    "message": "",
//    "price": null,
//    "confirmed": null
//    }
    
    let parametersProposition: Parameters = [
      "band":2,
      "host": 1,
      "event": 1,
      "message": proposition.mensagem!,
      "price": proposition.valorCache!,
      "confirmed": proposition.status!
    ]
    
    print(parametersProposition)
    
    Alamofire.request("https://bandz-startup.herokuapp.com/api/propositions/", method: .post, parameters: parametersProposition, encoding: JSONEncoding.default)
    

  }
  
  func createEvent(event:Event){

    let parametersEvent: Parameters = [
      "host": 1, // id
      "music_genres": ["1","2","3"],//array string
      "name": event.nomeEvento, //nome do evento
      "description": event.descricao, //descricao
      "url": "https://www.google.com", // url https://www
      "starts_at": "2017-01-16T20:00:00Z", //
      "ends_at": "2017-03-16T20:00:00Z", //
      "min_age":event.idade, //
      "price": event.valor //

    ]
    print(info.estilos)
    print("Parms")
    dump(parametersEvent)
    
    Alamofire.request("https://bandz-startup.herokuapp.com/api/events/", method: .post, parameters: parametersEvent, encoding: JSONEncoding.default, headers: ["Content-Type" :"application/json"]).responseJSON {
      (response) in
      print(response)
    }

  }
  
  func loadEvents(){
    Alamofire.request("https://bandz-startup.herokuapp.com/api/events/").responseJSON { response in
      print("Request: \(String(describing: response.request))")   // original url request
      print("Response: \(String(describing: response.response))") // http url response
      print("Result: \(response.result)")                         // response serialization result
//      var novoEvento = Event(hostID: 1, estilos: info.estilos, nomeEvento: info.tituloEvento, descricao: mensagem.text, url: "https://www.google.com", dataInicio: info.dataInicioEvento, dataTermino: info.dataFimEvento, idade: Int(idadeMinima.text!)!, valor: Double(valor.text!)!)

      if let json = response.result.value {
        print("JSON: \(json)") // serialized json response
        var dataJSON = JSON(json)
        
        let nameEvent = dataJSON.arrayValue.map({$0["name"].stringValue})
        let url = dataJSON.arrayValue.map({$0["url"].stringValue})
        let dataInicio = dataJSON.arrayValue.map({$0["starts_at"].stringValue})
        let dataFinal = dataJSON.arrayValue.map({$0["ends_at"].stringValue})
        let descricao = dataJSON.arrayValue.map({$0["description"].stringValue})
        let generos = dataJSON.arrayValue.map({$0["music_genres"].stringValue})
        let idade = dataJSON.arrayValue.map({$0["min_age"].stringValue})
        let preco = dataJSON.arrayValue.map({$0["price"].stringValue})
        let status = dataJSON.arrayValue.map({$0["confirmed"].stringValue})
        
         if storeEvent.events.count == 0{
        
        for (index,event) in nameEvent.enumerated(){
        let novoEvento = Event(hostID: 1, estilos: [generos[index]], nomeEvento: event, descricao: descricao[index], url: url[index], dataInicio: Date(), dataTermino: Date(), idade: Int(idade[index])!, valor: Double(preco[index])!)
         
            storeEvent.events.append(novoEvento)

          
          dump(novoEvento)
        }
      }
        print("array events")

      }
      
      if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
        print("Data: \(utf8Text)") // original server data as UTF8 string
      }
    }
  }

  func updatePreposition(){
    
  }
}



func convertToDictionary(text: String) -> [String: Any]? {
  if let data = text.data(using: .utf8) {
    do {
      return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
    } catch {
      print(error.localizedDescription)
    }
  }
  return nil
}

enum Funcionality:String {
  case user = "users"
}
