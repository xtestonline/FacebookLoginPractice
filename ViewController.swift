//
//  ViewController.swift
//  FacebookLoginPractice
//
//  Created by Suraj MAC2 on 3/18/16.
//  Copyright © 2016 supaint. All rights reserved.
//

import UIKit

class ViewController: UIViewController,FBSDKLoginButtonDelegate {

    
//TODO: - General
    
    
//TODO: - Controlls
    
//TODO: - Let's Play
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Dynamically create login button
        
        let loginButton : FBSDKLoginButton = FBSDKLoginButton()
        loginButton.center = self.view.center
        loginButton.delegate = self
        loginButton.readPermissions = ["public_profile","email","user_friends"]
        
        if (FBSDKAccessToken.currentAccessToken() != nil)
        {
            //performSegueWithIdentifier("unwindToViewOtherController", sender: self)
        }
        else
        {
            loginButton.readPermissions = ["public_profile", "email", "user_friends"]
        }
        self.view.addSubview(loginButton)
        
    }
    

//TODO: FBSDKLoginButtonDelegate Methods
    
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!){
      // print("Result\(FBSDKLoginManagerLoginResult.valueForKey("email"))")
        if (error != nil){
            //Got result here
        }else if (result.isCancelled){
            //login cancelled by user
        }else{
            
            if result.grantedPermissions.contains("email")
            {
                // Do work
                returnUserData()
            }
        }
       
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!){
        
    }
    
    
//TODO: Method to return user data
    
    func returnUserData(){
        let graphRequest : FBSDKGraphRequest = FBSDKGraphRequest(graphPath: "me", parameters: nil)
        
        graphRequest.startWithCompletionHandler { (connection, result, error) -> Void in
            
            if (error != nil){
                
            }else{
                print("Fetched User data \(result)")
                
                print("Name: \(result.valueForKey("name"))")
                print("Email: \(result.valueForKey("email"))")
                print("birthday: \(result.valueForKey("birthday"))")
                print("gender: \(result.valueForKey("gender"))")
                print("location: \(result.valueForKey("location"))")
               
            }
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

