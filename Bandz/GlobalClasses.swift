//
//  GlobalClasses.swift
//  Bandz
//
//  Created by Vitor Ferraz on 17/07/17.
//  Copyright © 2017 Bandz. All rights reserved.
//

import UIKit

  var store = ShowStore()

func makeAlert(title:String,message:String,titleAction:String)->UIAlertController{
    // create the alert
    let alert = UIAlertController(title: "\(title)", message: "\(message)", preferredStyle: UIAlertControllerStyle.alert)
    
    if titleAction != ""{
        // add an action (button)
        alert.addAction(UIAlertAction(title: "\(titleAction)", style: UIAlertActionStyle.default, handler: nil))
        
        
    }
        
 
    
    return alert
}
