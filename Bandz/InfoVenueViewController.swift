//
//  InfoVenueViewController.swift
//  Bandz
//
//  Created by Vitor Ferraz on 21/07/17.
//  Copyright © 2017 Bandz. All rights reserved.
//

import UIKit


class InfoVenueViewController: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource{
    
    
    
    //MARK: -  Outlets
    
  
    @IBOutlet weak var galleryImages: UICollectionView!
    //MARK: -  Propriedades
    var itemIndex = 0
    var imageName = "casa_show2.jpeg"
    var contentImagens = [ "casa_show2.jpeg",  "casa_show.jpeg"]
    
    //MARK: -  ViewLifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.galleryImages.dataSource = self
        self.galleryImages.delegate = self
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return contentImagens.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = galleryImages.dequeueReusableCell(withReuseIdentifier: "galleryImageCell", for: indexPath) as! InfoShowGalleryCell
        cell.imagePlace.image = UIImage(named: contentImagens[indexPath.row])
        
        return cell
    }
    
    //MARK: -  Métodos
    
    //MARK: -  Actions
    
    
    
    
}
