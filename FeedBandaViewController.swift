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
    self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
    self.navigationController?.hidesBarsOnSwipe = true
    listaDeShows.delegate = self
    listaDeShows.dataSource = self
    dump(storeEvent.events)
    
    api.getPropositions {}
    
  }
  
  override func viewWillAppear(_ animated: Bool) {
   
    print(storeEvent.events)
    print("total",storeEvent.events.count)
    listaDeShows.reloadData()
  }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToDetalheShow"{
            if let destination = segue.destination as? ShowDetalheViewController{
                destination.show = sender as? Event
            }
        }
    }
  
  
  
  // MARK: - Table view data source
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let show  = storeEvent.events[indexPath.row]
        performSegue(withIdentifier: "goToDetalheShow", sender: show)
    }
  
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return storeEvent.events.count
  }
  
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
  
    let cell = listaDeShows.dequeueReusableCell(withIdentifier: "ShowsForBandCell", for: indexPath) as! ShowsForBandCell
    
    let show  = storeEvent.returnEventAt(index: indexPath.row)

    
    cell.logoVenue.image = show.logo
    cell.nomeVenue.text = show.nomeEvento
    
    
//    cell.endereco.text = 
    
    cell.data.text = show.dataInicio.toString(dateFormat: "dd/mm/YYYY")
    
    let estilos = storeEvent.returnEventAt(index: indexPath.row).getEstilos()
    cell.estilo1.text = estilos[0]
    cell.estilo2.text = estilos[1]
    cell.estilo3.text = estilos[2]
    return cell
  }
  //MARK: -  Métodos
  
  
  //MARK: -  Actions
  
  
  
}
