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
  

  func getMusicGenre(completion: @escaping ([String]?) -> Void){
    Alamofire.request("\(url)music-genres").responseJSON { response in

      
      if let json = response.result.value {
      //  print("JSON: \(json)") // serialized json response
        let json = JSON(json)
        let arrayNames =  json.arrayValue.map({$0["name"].stringValue})
        completion(arrayNames)
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
        let bandJSON = json[0]["band"].rawString()?.replacingOccurrences(of: "'", with: "\"")
        
        var nome = convertToDictionary(text: bandJSON!)
       // var band = JSON.parse(bandJSON!)
        print("teste",nome?["name"] ?? "erro")

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
    
//    {
//      "host": null,
//      "music_genres": [],
//      "name": "",
//      "description": "",
//      "url": "",
//      "starts_at": null,
//      "ends_at": null,
//      "min_age": null,
//      "price": null
//    }
    
    
    let parametersEvent: Parameters = [
      "host": 1, // id
      "music_genres": [],//array string
      "name": event.nomeEvento, //nome do evento
      "description": event.descricao, //descricao
      "url": "https://www.google.com", // url https://www
      "starts_at": "2017-01-16T20:00:00Z", //
      "ends_at": "2017-03-16T20:00:00Z", //
      "min_age":event.idade, //
      "price": event.valor //

    ]
    print("Parms")
    dump(parametersEvent)
    
    Alamofire.request("https://bandz-startup.herokuapp.com/api/events/", method: .post, parameters: parametersEvent, encoding: JSONEncoding.default, headers: ["Content-Type" :"application/json"]).responseJSON {
      (response) in
      print(response)
    }

    
    
    
    
//    Alamofire.request("https://bandz-startup.herokuapp.com/api/events/", method: .post, parameters: parametersHost, encoding: JSONEncoding.default)

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
