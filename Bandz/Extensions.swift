//
//  Extensions.swift
//  Bandz
//
//  Created by Vitor Ferraz on 13/08/17.
//  Copyright © 2017 Bandz. All rights reserved.
//

import UIKit


//How to use 
//let today = Date()
//today.toString(dateFormat: "dd-MM-YYYY")

extension Date
    {
        func toString( dateFormat format  : String ) -> String
        {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = format
            return dateFormatter.string(from: self)
        }
        
}

func makeAlert(title:String,message:String,titleAction:String)->UIAlertController{
  // create the alert
  let alert = UIAlertController(title: "\(title)", message: "\(message)", preferredStyle: UIAlertControllerStyle.alert)
  
  if titleAction != ""{
    // add an action (button)
    alert.addAction(UIAlertAction(title: "\(titleAction)", style: UIAlertActionStyle.default, handler: nil))
  }
  return alert
}




