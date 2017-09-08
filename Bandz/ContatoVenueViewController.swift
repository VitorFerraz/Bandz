//
//  ContatoVenueViewController.swift
//  Bandz
//
//  Created by Vitor Ferraz on 10/08/17.
//  Copyright © 2017 Bandz. All rights reserved.
//

import UIKit

class ContatoVenueViewController: UIViewController {

    
    //MARK: -  Outlets
    @IBOutlet weak var nomeBandaTfd: UITextField!
    
    @IBOutlet weak var cacheShowTfd: UITextField!

    @IBOutlet weak var mensagemTextArea: UITextView!
    //MARK: -  Propriedades
    var nomeBanda:String = ""
    var valorShow:Double?
    var mensagem:String = ""
    
    //MARK: -  ViewLifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: -  Actions


    @IBAction func enviarProposta(_ sender: UIButton) {
        
        if validaCampos() == true {
            
            var proposta = Proposal(nomeBanda: nomeBanda, valorCache: valorShow!, mensagem: mensagem)
          
            //Alert
            let alert  = makeAlert(title: "Proposta Enviada com Sucesso", message: "Logo a casa de show irá entrar em contato com sua banda!", titleAction: "Ok")
            
            self.present(alert, animated: true, completion: nil)
        }
        
   
        
        
      

    }
    
    //MARK: -  Métodos
    
    func validaCampos()->Bool{
        guard nomeBandaTfd.text != "" else {
            nomeBandaTfd.placeholder = "Informe o nome da banda"
            nomeBandaTfd.layer.borderColor = UIColor.red.cgColor
            nomeBandaTfd.layer.borderWidth = 2.0
            print("Informe o nome da banda")
            return false
        }
        
        guard mensagemTextArea.text != "" else {
           
            mensagemTextArea.layer.borderColor = UIColor.red.cgColor
            nomeBandaTfd.layer.borderWidth = 2.0
            print("Informe uma mensagem")
            return false
        }
        
        
        
        
        
        
        return true
        
        
    }
    
    

}
