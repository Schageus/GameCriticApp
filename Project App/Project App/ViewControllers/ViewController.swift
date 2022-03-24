//
//  ViewController.swift
//  Project App
//
//  Created by Adrian Schlegel on 16.03.22.
//
var dataUsername: [String] = []
var dataPassword: [String] = []
var indexUsername = 0
var logged = true



import UIKit

class ViewController: UIViewController {
    
    var rawDataUsername = ""
    var rawDataPassword = ""
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidLoad()
        let loggedIn = UserDefaults.standard.bool(forKey: "loggedInState")
            print(loggedIn)
            if loggedIn == true && logged == true {
                print("print")
                self.performSegue(withIdentifier: "fromStartToSearch", sender: self)
                logged = false
                
    }
        
        if let rawDataUsername = UserDefaults.standard.object(forKey: "usernameData") as? String {
            dataUsername = rawDataUsername.components(separatedBy: " ")
            print(dataUsername)
        }
        if let rawDataPassword = UserDefaults.standard.object(forKey: "passwordData")
            as? String {
            dataPassword = rawDataPassword.components(separatedBy: " ")
            print(dataPassword)
    }
        if let rawIndex = UserDefaults.standard.object(forKey: "index") {
            indexUsername = rawIndex as! Int
        }

    
    
}

}
