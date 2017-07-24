//
//  ShowsFeitosTableViewController.swift
//  Bandz
//
//  Created by Vitor Ferraz on 22/07/17.
//  Copyright © 2017 Bandz. All rights reserved.
//

import UIKit

class ShowsFeitosTableViewController: UITableViewController {
  @IBOutlet var ShowsTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ShowsTableView.dequeueReusableCell(withIdentifier: "ShowsCell", for: indexPath) as! ShowsFeitosVenueCell
      
      cell.imageShow.image = #imageLiteral(resourceName: "casa_show")
         

        return cell
    }
 


}
