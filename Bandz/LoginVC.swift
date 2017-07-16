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

class LoginVC: UIViewController,FBSDKLoginButtonDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        let loginButton = FBSDKLoginButton()
      
      //TODO: Change to constrains
      loginButton.frame = CGRect(x: 16, y: 400, width: view.frame.width - 32, height: 50)
   
       view.addSubview(loginButton)
      
      //let leadingConstraint = loginButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
      
      loginButton.delegate = self
      loginButton.readPermissions = ["email","public_profile"]
      
   

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
    showEmail()
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
    }

  }
  
  

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
