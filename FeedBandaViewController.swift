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
  var store = ShowsStore()
  var api = APIManager()
  
  //MARK: -  Outlets
  @IBOutlet weak var listaDeShows: UITableView!
  
  //MARK: -  ViewLifeCycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    store.carregaShows()
    self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
    self.navigationController?.hidesBarsOnSwipe = true
    api.makeRequest(url: "")
    
  }
  
  
  
  // MARK: - Table view data source
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return store.listaShows.count
  }
  
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = listaDeShows.dequeueReusableCell(withIdentifier: "ShowsForBandCell", for: indexPath) as! ShowsForBandCell
    
    cell.logoVenue.image = store.listaShows[indexPath.row].logo
    cell.nomeVenue.text = store.listaShows[indexPath.row].nomeHost
    // cell.tipoLugar.text = store.listaShows[indexPath.row].tipoLugar
    cell.endereco.text = store.listaShows[indexPath.row].endereco
    cell.data.text = store.listaShows[indexPath.row].data
    cell.estilo1.text = store.listaShows[indexPath.row].estilos[0]
    cell.estilo2.text = store.listaShows[indexPath.row].estilos[1]
    cell.estilo3.text = store.listaShows[indexPath.row].estilos[2]
    
    return cell
  }
  //MARK: -  Métodos
  
  
  //MARK: -  Actions
  
  
  
}
