//
//  MapViewController.swift
//  Bandz
//
//  Created by Vitor Ferraz on 18/08/17.
//  Copyright © 2017 Bandz. All rights reserved.
//

import UIKit
import GooglePlaces


class MapViewController: UIViewController,UISearchBarDelegate {
  
  
  
  //MARK: -  Outlets
  
  //MARK: -  Propriedades
  
  //MARK: -  ViewLifeCycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  //MARK: -  Métodos
  
  //MARK: -  Actions
  @IBAction func autocompleteClicked(_ sender: UIButton) {
    let placePickerController = GMSAutocompleteViewController()
    placePickerController.delegate = self
    present(placePickerController, animated: true, completion: nil)
    }
  }


extension MapViewController: GMSAutocompleteViewControllerDelegate {
  
  // Handle the user's selection.
  func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
    print(place)
    print("Place name: \(place.name)")
    print("Place address: \(String(describing: place.formattedAddress))")
    print("Place attributions: \(String(describing: place.attributions))")
    dismiss(animated: true, completion: nil)
  }
  
  func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
    // TODO: handle the error.
    print("Error: ", error.localizedDescription)
  }
  
  // User canceled the operation.
  func wasCancelled(_ viewController: GMSAutocompleteViewController) {
    dismiss(animated: true, completion: nil)
  }
  
  // Turn the network activity indicator on and off again.
  func didRequestAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
    UIApplication.shared.isNetworkActivityIndicatorVisible = true
  }
  
  func didUpdateAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
    UIApplication.shared.isNetworkActivityIndicatorVisible = false
  }
  
}
