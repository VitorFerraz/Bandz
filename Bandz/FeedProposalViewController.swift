//
//  FeedProposalViewController.swift
//  Bandz
//
//  Created by Vitor Ferraz on 22/08/17.
//  Copyright © 2017 Bandz. All rights reserved.
//

import UIKit


class FeedProposalViewController: UIViewController {
  
  
  //MARK: -  Outlets
  
  @IBOutlet weak var card: UIView!
  @IBOutlet weak var thumbImageView: UIImageView!
  @IBOutlet weak var nomeBanda: UILabel!
  @IBOutlet weak var estiloBanda: UILabel!
  
  @IBOutlet weak var valorProposta: UILabel!
  var divisor :CGFloat!
  //MARK: -  Propriedades
  var currentCard = storeProposition.propositions[0]
  
  //MARK: -  ViewLifeCycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    divisor = (view.frame.width/2) / 0.61
    // nomeBanda.text = currentCard?.nomeBanda
    
    api.getPropositions {
      
    }
  }
  
  override func viewWillAppear(_ animated: Bool) {
    if (storeProposition.propositions.isEmpty){
      
      self.nomeBanda.text = "Sem nenhuma nova proposta as propostas"
      self.valorProposta.text = ""
      self.estiloBanda.text = ""
    }
  }
  
  
  
  //MARK: -  Métodos
  
  //MARK: -  Actions
  
  @IBAction func panCard(_ sender: UIPanGestureRecognizer) {
    let card = sender.view!
    let point = sender.translation(in: view)
    let xFromCenter = card.center.x - view.center.x
    
    
    card.center = CGPoint(x: view.center.x + point.x, y: view.center.y+point.y)
    
    var scale =  min(100 / abs(xFromCenter),1)
    //100/2 = 50 /0.61 = 81.
    card.transform = CGAffineTransform(rotationAngle: xFromCenter/divisor).scaledBy(x: scale, y: scale)
    
    if xFromCenter > 0 {
      //drag to right
      
      thumbImageView.image = #imageLiteral(resourceName: "like")
      thumbImageView.tintColor = UIColor.green
    }else{
      //drag to left
      thumbImageView.image = #imageLiteral(resourceName: "down")
      thumbImageView.tintColor = UIColor.red
      
    }
    
    thumbImageView.alpha = abs(xFromCenter)/view.center.x
    
    
    
    if sender.state == UIGestureRecognizerState.ended{
      UIView.animate(withDuration: 0.3) {
        if card.center.x < 75{
          //Move totalmente para a esquerda
          UIView.animate(withDuration: 0.3, animations: {
            card.center = CGPoint(x: card.center.x - 200, y: card.center.y + 75)
            card.alpha = 0
            self.nextProposal()
          })
          
          return
        }else if card.center.x > (self.view.frame.width-75){
          //move totalmente para a diretita
          UIView.animate(withDuration: 0.3, animations: {
            card.center = CGPoint(x: card.center.x + 200, y: card.center.y + 75)
            card.alpha = 0
            self.nextProposal()
            
            
            
          })
          return
          
          
        }
        self.resetCard()
        return
        
      }
      
    }
  }
  
  @IBAction func reset(_ sender: UIButton) {
    resetCard()
  }
  
  func nextProposal(){
    UIView.animateKeyframes(withDuration: 0.3, delay: 0.4, options: .calculationModeLinear, animations: {
      self.thumbImageView.alpha = 0
      self.card.center = self.view.center
      self.card.alpha = 1
      self.card.transform = CGAffineTransform.identity
      
    }) { (voltou) in
      if (storeProposition.propositions.count == 0){
        
        self.nomeBanda.text = "Sem nenhuma nova proposta as propostas"
        self.valorProposta.text = ""
        self.estiloBanda.text = ""
      }else{
        self.nomeBanda.text = "\(storeProposition.propositions[0].nomeBanda!)"
        //self.valorProposta.text = "\(storeProposal.proposals[0].valorCache!)"
        // self.estiloBanda.text = "Rock"
      }
    }
  }
  
    func resetCard(){
      
      print("teste")
      
      
      self.thumbImageView.alpha = 0
      self.card.center = self.view.center
      self.card.alpha = 1
      self.card.transform = CGAffineTransform.identity
      
    }
    
  
  
}
  
  






