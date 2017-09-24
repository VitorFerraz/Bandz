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
  @IBOutlet weak var valorProposta: UILabel!
  
    @IBOutlet weak var stackPrice: UIStackView!
    @IBOutlet weak var mensagem: UITextView!
  
  var divisor :CGFloat!
  //MARK: -  Propriedades
  var currentCardNumber = 0
  //var currentCard = storeProposition.propositions[0]
  
  //MARK: -  ViewLifeCycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    divisor = (view.frame.width/2) / 0.61
  
    // nomeBanda.text = currentCard?.nomeBanda

   
  }
  
  override func viewWillAppear(_ animated: Bool) {
    
    if (storeProposition.propositions.count == 0) || self.currentCardNumber == storeProposition.propositions.count {
        self.noMoreCard()
        
    }else{
      self.nomeBanda.text = storeProposition.propositions[currentCardNumber].nomeBanda
      self.valorProposta.text = "\(String(describing: storeProposition.propositions[currentCardNumber].valorCache!))"
        self.mensagem.text = storeProposition.propositions[currentCardNumber].mensagem
    
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
        self.currentCardNumber += 1

        if (storeProposition.propositions.count == 0) || self.currentCardNumber == storeProposition.propositions.count {
            self.noMoreCard()
            return
        }
        self.stackPrice.isHidden = false

        self.nomeBanda.text = storeProposition.propositions[self.currentCardNumber].nomeBanda
        self.valorProposta.text = "\(String(describing: storeProposition.propositions[self.currentCardNumber].valorCache!))"
        self.mensagem.text = storeProposition.propositions[self.currentCardNumber].mensagem
        print(storeProposition.propositions[self.currentCardNumber].mensagem)
        print(self.currentCardNumber)
        
        
    }) { (voltou) in
        

    }
  }
    func noMoreCard(){
       self.currentCardNumber  = 0
        self.stackPrice.isHidden = true
        self.mensagem.text = "Sem nenhuma nova proposta as propostas"
        self.valorProposta.text = ""
        self.nomeBanda.text = "Acabou as Propostas"
    }
  
    func resetCard(){
      
      print("teste")
      
      
      self.thumbImageView.alpha = 0
      self.card.center = self.view.center
      self.card.alpha = 1
      self.card.transform = CGAffineTransform.identity
      
    }
    
  
  
}
  
  






