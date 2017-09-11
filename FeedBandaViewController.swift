//
//  FeedVC.swift
//  Bandz
//
//  Created by Vitor Ferraz on 29/06/17.
//  Copyright © 2017 Bandz. All rights reserved.
//

import UIKit

class FeedBandaViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

  //MARK: -  Propriedades

  
  //MARK: -  Outlets
  @IBOutlet weak var listaDeShows: UITableView!
  
  //MARK: -  ViewLifeCycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    //store.carregaShows()
    self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
    self.navigationController?.hidesBarsOnSwipe = true
    
  }
  
  
  
  // MARK: - Table view data source
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return storeEvent.listEvents().count
  }
  
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = listaDeShows.dequeueReusableCell(withIdentifier: "ShowsForBandCell", for: indexPath) as! ShowsForBandCell
    
    cell.logoVenue.image = storeEvent.returnEventAt(index: indexPath.row).logo
    cell.nomeVenue.text = storeEvent.returnEventAt(index: indexPath.row).nomeEvento
    
    
    cell.endereco.text = "pegar do host"
    
    cell.data.text = "em "
    
    let estilos = storeEvent.returnEventAt(index: indexPath.row).getEstilos()
    cell.estilo1.text = estilos[0]
    cell.estilo2.text = estilos[1]
    cell.estilo3.text = estilos[2]
    return cell
  }
  //MARK: -  Métodos
  
  
  //MARK: -  Actions
  
  
  
}
