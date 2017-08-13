//
//  ShowsStore.swift
//  Bandz
//
//  Created by Vitor Ferraz on 09/08/17.
//  Copyright © 2017 Bandz. All rights reserved.
//

import UIKit


class ShowStore{
    var shows:[Show] = []
    
    init() {
        carregaShows()
    }
    func addShow(newShow:Show){
        self.shows.append(newShow)
    }
    
    
    func removeShow(id:String){
        self.shows =  self.shows.filter{$0.id != id}
        
    }
    
    func listaShows()->[Show]{
        return shows
    }
    
    func returnShowAt(index:Int)->Show{
        return shows[index]
    }
    
    
    func carregaShows(){
        for _ in 1...6{
            shows.append(Show())
            
        }
    }
}
