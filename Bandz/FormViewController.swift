//
//  FormViewController.swift
//  Bandz
//
//  Created by Vitor Ferraz on 18/08/17.
//  Copyright © 2017 Bandz. All rights reserved.
//

import UIKit


struct InfoShow {
  var estilos:[String] = []
  var dataInicioEvento:Date!
  var dataFimEvento:Date!
  var tituloEvento:String!
}

class FormViewController: UIViewController ,UITextFieldDelegate{

  
  //MARK: -  Outlets
  
  @IBOutlet weak var estilosTableView: UITableView!
  @IBOutlet weak var tituloshow: UITextField!
  @IBOutlet weak var dataInicio: UITextField!
  @IBOutlet weak var dataFim: UITextField!
  
  //MARK: -  Propriedades
  let datePicker = UIDatePicker()
  
  var delegate:DelegateInfoShow?
  //MARK: -  ViewLifeCycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    dataFim.delegate = self
    dataInicio.delegate = self
    tituloshow.delegate = self
    
    estilosTableView.dataSource = self
    estilosTableView.delegate = self
    datePicker.locale = Locale(identifier: "pt_BR")
    datePicker.datePickerMode = .date

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
    formatter.dateFormat = "dd/MM/yyyy"
    if sender.tag == 1{
      dataInicio.text = formatter.string(from: sender.date)

    }else{
      dataFim.text = formatter.string(from: sender.date)

    }
    
  }

  //MARK: UITextViewDelegate
  //Metodo disparado quando uma textview entra em foco
  func textFieldDidBeginEditing(_ textField: UITextField) {
   
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
  
  @IBAction func pegaInfoEvent(_ sender: UIButton) {
    info = InfoShow()
      if let dataFim = dataFim.text?.stringToDate(){
        info.dataFimEvento = dataFim
    }
    
    if let dataInicio = dataInicio.text?.stringToDate(){
      info.dataInicioEvento = dataInicio
    }
    
    
    info.estilos.append("Indie")
    
    if let nomeEvento =  tituloshow.text{
      info.tituloEvento = nomeEvento

    }
    
    print("show info",info)

    self.delegate?.infoShow(infos: info)
   
    
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

protocol DelegateInfoShow {
  func infoShow(infos:InfoShow)
}

