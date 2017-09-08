//
//  ProposalStore.swift
//  Bandz
//
//  Created by Vitor Ferraz on 22/08/17.
//  Copyright © 2017 Bandz. All rights reserved.
//

import UIKit

class ProposalStore{
  var proposals: [Proposal] = []
  
  init() {
    loadProposal()
  }
  
  func loadProposal(){
    for i in 1...7{
      var p = Proposal(nomeBanda: "Banda do Portal", valorCache: 10.0, mensagem: "lreom lorem lorem lorem")
      
      p.status = false
      
      proposals.append(p)
    }
  }
}
