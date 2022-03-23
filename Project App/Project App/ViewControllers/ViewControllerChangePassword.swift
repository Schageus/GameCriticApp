//
//  ViewControllerChangePassword.swift
//  Project App
//
//  Created by Adrian Schlegel on 22.03.22.
//

import UIKit

class ViewControllerChangePassword: ViewController {
    
    @IBOutlet weak var newPassword1: UITextField!
    @IBOutlet weak var oldPassword: UITextField!
    @IBOutlet weak var newPassword2: UITextField!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func applyButton() {
        
        if newPassword1.text != "" && oldPassword.text != "" && newPassword2.text != "" {
            
            if oldPassword.text == dataPassword[indexUsername] {
                
                if newPassword1.text == newPassword2.text {

                    dataPassword[indexUsername] = newPassword2.text!
                    let newPasswordData = dataPassword.joined(separator: " ")
                    UserDefaults.standard.set(newPasswordData, forKey: "passwordData")
                
                    
                    performSegue(withIdentifier: "changePasswordBack", sender: self)
                }
                
                else {
                    label.text = "The passwords don't match"
                    label.textColor = UIColor.red}
                
                
            }
            
            else {
                label.text = "That is not the old password"
                label.textColor = UIColor.red}
            }
            

            
        
        else {
            label.text = "Please fill in all text fields"
            label.textColor = UIColor.red
        }
        
    }
    
}
