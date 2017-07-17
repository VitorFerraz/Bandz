//
//  LoginVC.swift
//  Bandz
//
//  Created by Vitor Ferraz on 13/07/17.
//  Copyright © 2017 Bandz. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import Firebase
import FirebaseAuth

class LoginVC: UIViewController,FBSDKLoginButtonDelegate {

  @IBOutlet weak var emailTxt: UITextField!
  @IBOutlet weak var passwordTxt: UITextField!
  @IBOutlet weak var customBtnFBLogin: UIButton!
  var user:Any?
    override func viewDidLoad() {
        super.viewDidLoad()

        let loginButton = FBSDKLoginButton()
      
      //TODO: Change to constrains
      loginButton.frame = CGRect(x: 16, y: 400, width: view.frame.width - 32, height: 50)
   
       //view.addSubview(loginButton)
      
      customBtnFBLogin.addTarget(self, action: #selector(handleCustomFBLogin), for: .touchUpInside)
      
      loginButton.delegate = self
      loginButton.readPermissions = ["email","public_profile"]
      
   

  }
  
  func handleCustomFBLogin(){
    FBSDKLoginManager().logIn(withReadPermissions: ["email","public_profile"], from: self) { (result, error) in
      if error != nil{
        print("Custom fb login failed",error ?? "")
        return
      }
      print(result?.token.tokenString)
      self.user = result
      self.showEmail()
      self.logged()

      
    }
  }
  func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
    print("Did log out of facebook")
  }
  
  func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
    if error != nil{
      print(error)
      return
    }
    print("Successfully logged in with facebook...")
    self.user = result
    showEmail()
    self.logged()

  }
  
  func showEmail(){
    let accessToken = FBSDKAccessToken.current()
    guard let accessTokenString = accessToken?.tokenString else{
      return
    }
    let credentials = FIRFacebookAuthProvider.credential(withAccessToken: accessTokenString)
    FIRAuth.auth()?.signIn(with: credentials, completion: { (user, error) in
      if error != nil {
        print("Something went wrong with our FB user: ",error ?? "")
        return
      }
      
      print("Successfully logged in with our user",user ?? "")
    })
    FBSDKGraphRequest(graphPath: "/me", parameters: ["fields":"id,name,email"]).start { (connection, result, error) in
      if error != nil{
        print("Failed to start graph request",error ?? "")
        return
      }
      
      print(result ?? "")
      self.user = result
      self.logged()

    }

  }
  
  @IBAction func createAccount(_ sender: UIButton) {
    if let email = emailTxt.text, let password = passwordTxt.text{
      FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: { (user, error) in
        if let fireBaseError = error{
          print(fireBaseError.localizedDescription)
          return
        }
        
        print("You created a new account")
        self.user = user
        self.logged()

      })
    }
  }
  
  @IBAction func loginAccount(_ sender: UIButton) {
    if let email = emailTxt.text, let password = passwordTxt.text{
        FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: { (user, error) in
          if let fireBaseError = error{
            print(fireBaseError.localizedDescription)
            return
          }
          
          print("You sing in with your account")
          self.user = user
          self.logged()
          
        })
    }
  }
  
  func logged(){
    if user != nil{
      performSegue(withIdentifier: "BandzApp", sender: Any?.self)
    }
  }
  
  

}
