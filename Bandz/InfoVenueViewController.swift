//
//  InfoVenueViewController.swift
//  Bandz
//
//  Created by Vitor Ferraz on 21/07/17.
//  Copyright © 2017 Bandz. All rights reserved.
//

import UIKit

class InfoVenueViewController: UIViewController,UIScrollViewDelegate {
  var indexImage = 0
  var imageName:String = ""{
    didSet{
      if let imageView = imageVenue{
        imageView.image = UIImage(named: imageName)
      }
    }}
  
  var imageCollection = [String]()
  
  
  
  @IBOutlet weak var imageVenue: UIImageView!

  @IBOutlet weak var scrollView: UIScrollView!

  
  @IBOutlet weak var pageImageControl: UIPageControl!
  
    override func viewDidLoad() {
        super.viewDidLoad()
      //  imageVenue.image = #imageLiteral(resourceName: "casa_show")
        // Do any additional setup after loading the view.
    //  imageCollection.append(contentsOf: ["casa_show.jpeg","casa_show.jpeg","casa_show.jpeg"])
      

      
      
     
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  

  
  func setupPageViewController(){
    
    
  }
  

  


}
