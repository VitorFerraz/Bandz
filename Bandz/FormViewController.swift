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
  
  @IBOutlet weak var estilosTableView: UITableView!
  @IBOutlet weak var tituloshow: UITextField!
  @IBOutlet weak var dataInicio: UITextField!
  @IBOutlet weak var dataFim: UITextField!
  
  //MARK: -  Propriedades
  var placeID:String?
  //MARK: -  ViewLifeCycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    dataFim.delegate = self
    dataInicio.delegate = self
    tituloshow.delegate = self
    
    estilosTableView.dataSource = self
    estilosTableView.delegate = self
    
    dump(storeEvent.lisfOfGenre)
    
  }
  
  override func viewWillAppear(_ animated: Bool) {
    estilosTableView.reloadData()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  //MARK: -  Métodos
  func datePickerChanged(sender: UIDatePicker) {
    let formatter = DateFormatter()
    formatter.dateStyle = .full
    if sender.tag == 1{
      dataInicio.text = formatter.string(from: sender.date)

    }else{
      dataFim.text = formatter.string(from: sender.date)

    }
    
  }

  //MARK: UITextViewDelegate
  //Metodo disparado quando uma textview entra em foco
  func textFieldDidBeginEditing(_ textField: UITextField) {
   
    let datePicker = UIDatePicker()
    datePicker.locale = Locale(identifier: "pt_BR")
    if dataInicio == textField {
      datePicker.tag = 1
       textField.inputView = datePicker
      
    }else if dataFim == textField{
       datePicker.tag = 2
       textField.inputView = datePicker
    }

    

    datePicker.addTarget(self, action: #selector(datePickerChanged(sender:)), for: .valueChanged)

    
    print("This Worked")
  }
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    if textField == dataFim{
       dataFim.resignFirstResponder()
    }else{
      dataInicio.resignFirstResponder()
    }
   
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
  
  @IBAction func createEvent(_ sender: UIButton) {
    storeEvent.eventTmp = Event()
    storeEvent.eventTmp?.dataInicio = dataInicio.text
    storeEvent.eventTmp?.dataTermino = dataFim.text
    
    storeEvent.eventTmp?.nomeEvent = tituloshow.text
    storeEvent.eventTmp?.estilos?.append("Rock")
    storeEvent.eventTmp?.placeId = placeID
    
   
    
  }

}

extension FormViewController:UITableViewDelegate{
  
}

extension FormViewController:UITableViewDataSource{
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = estilosTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    cell.textLabel?.text = storeEvent.lisfOfGenre[indexPath.row]
    return cell
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return storeEvent.lisfOfGenre.count
  }
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }

  
}

