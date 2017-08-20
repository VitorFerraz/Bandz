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
  
    init() {
        //loadEvents()
      eventTmp = Event()
    }
    func addEvent(newEvent:Event){
        self.events.append(newEvent)
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
    
    
    func loadEvents(){
        for _ in 1...6{
            events.append(Event())
            
        }
    }
}
