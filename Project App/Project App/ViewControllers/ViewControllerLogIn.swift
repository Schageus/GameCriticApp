//
//  ViewControllerLogIn.swift
//  Project App
//
//  Created by Adrian Schlegel on 17.03.22.
//


import UIKit

class ViewControllerLogIn: UIViewController {
    
    var rawDataUsername = ""
    var rawDataPassword = ""
    
    @IBOutlet weak var signInLabel: UILabel!
    
    @IBOutlet weak var usernameTextLogIn: UITextField!
    
    @IBOutlet weak var passwordTextLogIn: UITextField!
    
    override func viewDidLoad() {
        
        // load all previous log in data
        
        if let rawDataUsername = UserDefaults.standard.object(forKey: "usernameData") as? String {
            dataUsername = rawDataUsername.components(separatedBy: " ")
            print(dataUsername)
        }
        if let rawDataPassword = UserDefaults.standard.object(forKey: "passwordData")
            as? String {
            dataPassword = rawDataPassword.components(separatedBy: " ")
            print(dataPassword)
        }
    }
    
    @IBAction func submitButtonLogIn(_ sender: Any) {
        
        // if all spaces have text
    
        
        if usernameTextLogIn.text != "" || passwordTextLogIn.text != "" {
            
            if dataUsername.contains(usernameTextLogIn.text!) {
                
                // find index of
                
                indexUsername = dataUsername.firstIndex(of: usernameTextLogIn.text!)!
                if dataPassword[indexUsername] == passwordTextLogIn.text {
                    
                    // log user in
                    
                    self.performSegue(withIdentifier: "fromSignInToSearch", sender: self)
                    UserDefaults.standard.set(true, forKey: "loggedInState")
                    UserDefaults.standard.set(indexUsername, forKey: "index")
                }
                
                else {
                    
                    // Incorrect password entered
                    
                    signInLabel.text = "The Password you have entered is wrong"
                }
            }
            
            else {
                
                // username not present
                
                signInLabel.text = "The Username you have entered does not exist"
            }
            
            
        }
    }
    
    
}

