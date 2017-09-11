//
//  CriaShowController.swift
//  Bandz
//
//  Created by Vitor Ferraz on 09/08/17.
//  Copyright © 2017 Bandz. All rights reserved.
//

import UIKit

class CriaShowController: UIViewController {

    
    //MARK: -  Outlets
    
    @IBOutlet weak var dateShow: UIDatePicker!
    @IBOutlet weak var descricaoShow: UITextView!
    @IBOutlet weak var capacidadeMaximaShow: UITextField!
    @IBOutlet weak var enderecoShow: UITextField!
    @IBOutlet weak var nomeShow: UITextField!
  
  
  
    //MARK: -  Propriedades
    var nome:String?
    var descricao:String?
    var endereco:String?
    var capacidade:Int?
    var data:String?

  var infoShow:InfoShow = InfoShow()
    //MARK: -  ViewLifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
      let delegateInfo = FormViewController()
      let testing : CGFloat = 1000
      delegateInfo.delegate = self
      
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: -  Métodos
    
    //MARK: -  Actions

    @IBAction func criarShow(_ sender: UIButton) {
        validaCampos()
      
     //   storeEvent.addEvent(newEvent: Event)
  }
    
    func validaCampos(){
        if let nome = nomeShow.text{
            if nome != ""{
                self.nome = nome
                print( self.nome ?? "erro nome")
            }
        }
        
        if let endereco = enderecoShow.text{
            if endereco != ""{
                self.endereco = endereco
                print(self.endereco ?? "erro endereco")
            }
        }
        
        if let capacidade = Int(capacidadeMaximaShow.text!){
            if capacidade > 0{
                self.capacidade = capacidade
                print(self.capacidade ?? "erro capacidade")
            }
        }
        
        if let descricao = descricaoShow.text{
            if descricao != ""{
                self.descricao = descricao
                print(self.capacidade ?? "erro capacidade")
            }
        }
        let data =  dateShow.date.toString(dateFormat: "dd/MM/yyyy")
        self.data = data
        print( self.data ?? "erro data")

        
    }
}


extension CriaShowController: DelegateInfoShow{
  func infoShow(infos: InfoShow) {
    infoShow.tituloEvento = infos.tituloEvento!
    print("teste show delegate",infoShow.tituloEvento)
  }

  

  
  
}
