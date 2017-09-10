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
        print("JSON: \(json)") // serialized json response
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
  
 
  
  
  func createEvent(){
    
    let parametersLocation: Parameters = [
      "place_id":"JNKADKJUHR80089fidnh302irnh0",
      "street": "Rua Augusta",
      "number": "243",
      "state": "SP",
      "country": "Brazil",
     
    ]
    
    let parametersHost: Parameters = [
      "name":"Teste Vitor",
      "starts_at": "1990-11-11T11:11:00Z",
      "ends_at": "1900-11-11T11:11:00Z",
      "url": "https://www.google.com",
      "location": 1,
      "host": 1
    ]
      
      Alamofire.request("https://bandz-startup.herokuapp.com/api/events/", method: .post, parameters: parametersLocation, encoding: JSONEncoding.default)
    

    
    
//    Alamofire.request("https://bandz-startup.herokuapp.com/api/events/", method: .post, parameters: parametersHost, encoding: JSONEncoding.default)

  }

}


enum Funcionality:String {
  case user = "users"
}
