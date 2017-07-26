//
//  APIManager.swift
//  Bandz
//
//  Created by Vitor Ferraz on 25/07/17.
//  Copyright © 2017 Bandz. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


class APIManager{
  
  func makeRequest(url:String){
    
    Alamofire.request("https://bandz-startup.herokuapp.com/api/events/", method: .get).validate().responseJSON { response in
      switch response.result {
      case .success(let value):
        let json = JSON(value)
        var cont = json.count
        for index in 1...5 {
          
          }
        print("total \(cont)")
        print("JSON: \(json[0]["name"].stringValue)")
      case .failure(let error):
        print(error)
      }
    }
  }
}
