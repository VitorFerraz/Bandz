//
//  Extensions.swift
//  Bandz
//
//  Created by Vitor Ferraz on 13/08/17.
//  Copyright © 2017 Bandz. All rights reserved.
//

import Foundation


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




