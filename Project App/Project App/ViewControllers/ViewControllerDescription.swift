//
//  ViewControllerDescription.swift
//  Project App
//
//  Created by Adrian Schlegel on 22.03.22.
//

var userDescription = ""

import UIKit

class ViewControllerDescription: ViewController {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        if (UserDefaults.standard.object(forKey: "\(dataUsername[indexUsername]) Description") != nil) {
            label.text = "Change your description"
            userDescription = UserDefaults.standard.object(forKey: "\(dataUsername[indexUsername]) Description") as! String
            textView.text = userDescription
        }
    }
    
    @IBAction func applyButton() {
        
        if textView.text.count < 300 {
            textView.textColor = UIColor.white
            userDescription = textView.text
            UserDefaults.standard.set(userDescription, forKey: "\(dataUsername[indexUsername]) Description")
            performSegue(withIdentifier: "descriptionBack", sender: self)
        }
        
        else {
            label.text = "You have entered too many characters"
            label.textColor = UIColor.red
            
        }



    }
    
}
