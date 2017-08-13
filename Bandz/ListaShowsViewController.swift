//
//  ListaShowsViewController.swift
//  Bandz
//
//  Created by Vitor Ferraz on 13/08/17.
//  Copyright © 2017 Bandz. All rights reserved.
//

import UIKit

class ListaShowsViewController: UIViewController {

    
    //MARK: -  Outlets
    @IBOutlet weak var tableViewShows: UITableView!
    
    //MARK: -  Propriedades
    
    //MARK: -  ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableViewShows.reloadData()
    }

    //MARK: -  Métodos
    
    //MARK: -  Actions

}

// MARK: - Table view data source
extension ListaShowsViewController:UITableViewDataSource{
     func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return store.listaShows().count
    }
    
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VenueShowCell", for: indexPath)
        let show  = store.returnShowAt(index: indexPath.row)

        cell.textLabel?.text = show.nomeShow
        cell.detailTextLabel?.text = show.data
        
        return cell
    }

}
