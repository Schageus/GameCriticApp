//
//  ViewControllerRegister.swift
//  Project App
//
//  Created by Adrian Schlegel on 16.03.22.
//

import UIKit

class ViewControllerRegister: UIViewController {
    
    var dataUsername: [String] = []
    var dataPassword: [String] = []
    var rawDataUsername = ""
    var rawDataPassword = ""
    
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwort1Text: UITextField!
    @IBOutlet weak var password2Text: UITextField!
    @IBOutlet weak var label1: UILabel!
    
    override func viewDidLoad() {
        
        // load all previous log in data
        
        if let usernameGetter = UserDefaults.standard.string(forKey: "usernameData") {
            rawDataUsername = usernameGetter
            dataUsername = rawDataUsername.components(separatedBy: " ")
            if rawDataUsername != "" {print(rawDataUsername + "hello")}
        }
        if let passwordGetter = UserDefaults.standard.object(forKey: "passwordData")
            as? String {
            rawDataPassword = passwordGetter
            dataPassword = rawDataPassword.components(separatedBy: " ")

    }
}
    
    
    @IBAction func submitButtonAction(_ sender: UIButton) {
        
        // if all spaces have text
    
        
        if emailText.text != "" || passwort1Text.text != "" || password2Text.text != "" {
            
            // if the passwords dont match
            
            if password2Text.text != passwort1Text.text {
                label1.text = "The passwords don't match. Please enter them correctly"
                label1.textColor = UIColor.red
                
            }
            
            else if dataUsername.contains(emailText.text!) {

                // check if Username is already taken
                
                label1.text = "This Username is already taken"
                label1.textColor = UIColor.red
                
            }
            
            // if everything works (same password)
            
            else {
                print(rawDataUsername + "hi")
                label1.text = "Account Successfully Created"
                log.verbose(rawDataUsername)
                log.verbose(rawDataUsername + " " + emailText.text!)
                let newUsernameList = rawDataUsername + " " + emailText.text!
                log.error(newUsernameList)
                let newPasswordList = rawDataPassword + " " + passwort1Text.text!
                print(newPasswordList)
                UserDefaults.standard.set(newUsernameList, forKey: "usernameData")
                UserDefaults.standard.set(newPasswordList, forKey: "passwordData")
                label1.textColor = UIColor.green
                self.performSegue(withIdentifier: "fromSignUpToSignIn", sender: self)
                
            }
        }
        
        // if not all text fields were used
        
        else {
            label1.text = "Please fill in all text fields"
            label1.textColor = UIColor.red
        }
    }
    @IBAction func clearAccountsAction(_ sender: Any) {
        UserDefaults.standard.removeObject(forKey: "usernameData")
        UserDefaults.standard.removeObject(forKey: "passwordData")
        label1.textColor = UIColor.green
        label1.text = "Cleared"
        
    }
    
    
    
    
}

