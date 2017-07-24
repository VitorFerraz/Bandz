import UIKit
import Parchment

class ViewController: UIViewController,PagingOptions {

  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Load each of the view controllers you want to embed
    // from the storyboard.
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let firstViewController = storyboard.instantiateViewController(withIdentifier: "InfoVenueViewController")
    let secondViewController = storyboard.instantiateViewController(withIdentifier: "ShowsFeitosVenueViewController")
    let thirdViewController = storyboard.instantiateViewController(withIdentifier: "ContatoVenueViewController")
    
    
      
    // Initialize a FixedPagingViewController and pass
    // in the view controllers.
    let pagingViewController = FixedPagingViewController(viewControllers: [
      firstViewController,
      secondViewController,
      thirdViewController
    ])
    
    // Make sure you add the PagingViewController as a child view
    // controller and contrain it to the edges of the view.
    addChildViewController(pagingViewController)
    view.addSubview(pagingViewController.view)
    view.constrainToEdges(pagingViewController.view)
    pagingViewController.didMove(toParentViewController: self)
    
  }
  
  
  

}


