//
//  FeedVC.swift
//  Bandz
//
//  Created by Vitor Ferraz on 29/06/17.
//  Copyright © 2017 Bandz. All rights reserved.
//

import UIKit

class FeedVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
  
  
  
  ////
  var raboDeGato = Band(codigoDaBanda: 1,banda: "Rabo de Gato", estilo: "Punk")
  
  
  var raboDeGato2 = Band(codigoDaBanda: 2,banda: "Rabo de Gato", estilo: "Rock")
  var raboDeGato3 = Band(codigoDaBanda: 3,banda: "Rabo de Gato", estilo: "Axe")
  var raboDeGato4 = Band(codigoDaBanda: 4,banda: "Rabo de Gato", estilo: "Indie")

  var arrayBands = [Band]()
     ////
  
  //MARK: Outlets
  @IBOutlet weak var listaDeShows: UITableView!
  


    override func viewDidLoad() {
        super.viewDidLoad()
     
     arrayBands.append(contentsOf: [raboDeGato,raboDeGato2,raboDeGato3,raboDeGato4])
    }



    // MARK: - Table view data source
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }

  
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayBands.count
    }

  
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
   
        let cell = Bundle.main.loadNibNamed("ShowCardCell", owner: self, options: nil)?.first as! ShowCardCell
        cell.nomeVenue.text = arrayBands[indexPath.row].nome
        cell.genero1.text = arrayBands[indexPath.row].estilo
      cell.imgBand.image = arrayBands[indexPath.row].logo

        return cell
    }
 

   func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 170
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let bandaSelecionada = arrayBands[indexPath.row]
    performSegue(withIdentifier: "DetalheBandaVC", sender: bandaSelecionada)
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      if segue.identifier == "DetalheBandaVC"{
        if let destination = segue.destination as? DetalheShowVC{
          //TODO - Criar classe show e aletar no sander de Band para Show
          if let show = sender as? Band {
            destination.bandaSelecionada = show
          }
        }
      }
  }
}
