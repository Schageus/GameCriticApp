//
//  ViewControllerHome.swift
//  Project App
//
//  Created by Adrian Schlegel on 19.03.22.
//

import UIKit

var darkTheme = true

class ViewControllerHome: ViewController {
    
    @IBOutlet weak var labelUsername: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var profilePic: UIImageView!
    override func viewDidAppear(_ animated: Bool) {
        
        labelUsername.text = dataUsername[indexUsername]
        
        if UserDefaults.standard.object(forKey: "\(dataUsername[indexUsername]) Picture") != nil {
            let profilePicture = UserDefaults.standard.object(forKey: "\(dataUsername[indexUsername]) Picture")
            
            if profilePicture as! String == "image1" {
                profilePic.image = UIImage(named: "image1")
            }
            
            else if profilePicture as! String == "image2" {
                profilePic.image = UIImage(named: "image2")
            }
            
            else if profilePicture as! String == "image3" {
                profilePic.image = UIImage(named: "image3")
            }
            
            else if profilePicture as! String == "image4" {
                profilePic.image = UIImage(named: "image4")
            }
            
        }
        
        if (UserDefaults.standard.object(forKey: "\(dataUsername[indexUsername]) Description") != nil) {
            let description = UserDefaults.standard.object(forKey: "\(dataUsername[indexUsername]) Description")
            descriptionLabel.text = description as? String
            
        }
        
        /* let dark = UserDefaults.standard.object(forKey: "darkTheme") as? Bool
        darkTheme = dark!
        print("initial", darkTheme)
        if darkTheme == false {
        view.backgroundColor = UIColor.white
        } */
        
        
        
    }
    
    @IBAction func copyClipboardAction(_ sender: Any) {
        
        
        let pasteboard = UIPasteboard.general
        pasteboard.string = dataUsername[indexUsername]
        
    
        let copyAlert = UIAlertController(title: "Copy to Clipboard", message: "Your Username has been copied to your clipboard", preferredStyle: UIAlertController.Style.alert)
        
        copyAlert.addAction(UIAlertAction(title: "Okay", style: .default, handler: { (action: UIAlertAction!) in
            print("okay")
        }))
        

        present(copyAlert, animated: true, completion: nil)
        
        
        
    
   }
    
}
