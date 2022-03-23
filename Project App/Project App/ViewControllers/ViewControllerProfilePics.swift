//
//  ViewControllerProfilePics.swift
//  Project App
//
//  Created by Adrian Schlegel on 22.03.22.
//

import UIKit

class ViewControllerProfilePics: ViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func button1(){
        UserDefaults.standard.set("image1", forKey:"\(dataUsername[indexUsername]) Picture")
        performSegue(withIdentifier: "profilePicsBack", sender: self)
    }
    
    @IBAction func button2(){
        UserDefaults.standard.set("image2", forKey:"\(dataUsername[indexUsername]) Picture")
        performSegue(withIdentifier: "profilePicsBack", sender: self)
    }
    
    @IBAction func button3(){
        UserDefaults.standard.set("image3", forKey:"\(dataUsername[indexUsername]) Picture")
        performSegue(withIdentifier: "profilePicsBack", sender: self)
    }
    
    @IBAction func button4(){
        UserDefaults.standard.set("image4", forKey:"\(dataUsername[indexUsername]) Picture")
        performSegue(withIdentifier: "profilePicsBack", sender: self)
    }
    
}
