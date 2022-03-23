//
//  ViewControllerChangeUsername.swift
//  Project App
//
//  Created by Adrian Schlegel on 22.03.22.
//

import UIKit

class ViewControllerChangeUsername: ViewController {
  
    @IBOutlet weak var usernameText1: UITextField!
    @IBOutlet weak var usernameText2: UITextField!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func applyButton() {
        if usernameText1.text != "" && usernameText2.text != "" {
            
            if usernameText1.text == usernameText2.text {
                
                    dataUsername[indexUsername] = usernameText2.text!
                    
                let newUsernameData = dataUsername.joined(separator: " ")
                
                
                UserDefaults.standard.set(newUsernameData, forKey: "usernameData")
                performSegue(withIdentifier: "changeUsernameBack", sender: self)
            }
            
            else {
                label.text = "The entered Usernames don't match"
                label.textColor = UIColor.red
                
            }
            
        }
        
        else {
            label.text = "Please fill in all textfields"
            label.textColor = UIColor.red
        }
    }
    
}
