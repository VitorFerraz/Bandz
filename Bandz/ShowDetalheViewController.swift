//
//  ShowDetalheViewController.swift
//  Bandz
//
//  Created by Vitor Ferraz on 23/07/17.
//  Copyright © 2017 Bandz. All rights reserved.
//

import UIKit

class ShowDetalheViewController: UIViewController {

  
  //MARK: -  Outlets
  @IBOutlet weak var imageVenue: UIImageView!
  
  //MARK: -  Propriedades
    var show:Event!
  
  //MARK: -  ViewLifeCycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.title = show.nomeEvento
     self.navigationController?.hidesBarsOnSwipe = true
    
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  //MARK: -  Métodos
  
  
  //MARK: -  Actions

}
