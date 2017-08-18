//
//  FormViewController.swift
//  Bandz
//
//  Created by Vitor Ferraz on 18/08/17.
//  Copyright © 2017 Bandz. All rights reserved.
//

import UIKit

class FormViewController: UIViewController ,UITextFieldDelegate{

  
  //MARK: -  Outlets
  
  @IBOutlet weak var dataFim: UITextField!
  //MARK: -  Propriedades
  
  //MARK: -  ViewLifeCycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    dataFim.delegate = self
    
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  //MARK: -  Métodos
  func datePickerChanged(sender: UIDatePicker) {
    let formatter = DateFormatter()
    formatter.dateStyle = .full
    dataFim.text = formatter.string(from: sender.date)
    
    print("Try this at home")
  }

  //MARK: UITextViewDelegate
  //Metodo disparado quando uma textview entra em foco
  func textFieldDidBeginEditing(_ textField: UITextField) {
    let datePicker = UIDatePicker()
    textField.inputView = datePicker
    datePicker.addTarget(self, action: #selector(datePickerChanged(sender:)), for: .valueChanged)

    
    print("This Worked")
  }
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    dataFim.resignFirstResponder()
    return true
  }
  
  // MARK: Helper Methods
  func closekeyboard() {
    self.view.endEditing(true)
  }
  
  // MARK: Touch Events
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    closekeyboard()
  }
  
  //MARK: Propriedade de UIResponder
  //Variavel que implementa a mudança de foco entre objetos
  override var canBecomeFirstResponder: Bool{
    return true
  }


  //MARK: -  Actions

}


