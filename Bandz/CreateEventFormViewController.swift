//
//  CreateEventFormViewController.swift
//  Bandz
//
//  Created by Vitor Ferraz on 20/08/17.
//  Copyright © 2017 Bandz. All rights reserved.
//

import UIKit
import GooglePlaces


class CreateEventFormViewController: UIViewController,UITextFieldDelegate {

  
  //MARK: -  Outlets
  
  @IBOutlet weak var urlEvent: UITextField!
  @IBOutlet weak var idadeMinima: UITextField!
  @IBOutlet weak var valor: UITextField!
  @IBOutlet weak var local: UITextField!
  @IBOutlet weak var mensagem: UITextView!
  
  //MARK: -  Propriedades
  var placeID:String?
  
  //MARK: -  ViewLifeCycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.local.delegate = self
    
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  //MARK: -  Métodos
  
  //MARK: -  Actions
  @IBAction func createEvent(_ sender: UIButton) {
    store.eventTmp?.descricao = mensagem.text
    store.eventTmp?.endereco = local.text
    store.eventTmp?.idade = Int(idadeMinima.text!)
    store.eventTmp?.placeId = placeID
    store.eventTmp?.valor = Double(valor.text!)
    
    store.addEvent(newEvent: store.eventTmp!)
    
    
    
    
  }
  
  func textFieldDidBeginEditing(_ textField: UITextField) {
    if textField == local{
      let placePickerController = GMSAutocompleteViewController()
      placePickerController.delegate = self
      present(placePickerController, animated: true, completion: nil)
    }
  }
  
}
  
  extension CreateEventFormViewController: GMSAutocompleteViewControllerDelegate {
    
    // Handle the user's selection.
    func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
      print(place)
      print("Place name: \(place.name)")
      print("Place address: \(String(describing: place.formattedAddress))")
      print("Place attributions: \(String(describing: place.attributions))")
      dismiss(animated: true, completion: nil)
      local.text = place.name
      self.placeID = place.placeID
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
  
  
  



