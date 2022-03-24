//
//  ViewControllerSettings.swift
//  Project App
//
//  Created by Adrian Schlegel on 22.03.22.
//

import UIKit

class ViewControllerSettings: ViewController {
    
    
    
    @IBOutlet weak var tableViewSettings: UITableView!
    
    var settings = ["Change your Profile Picture", "Change Password", "Change Username", "Add or Change Description", "Change to Light Mode (BETA)", "Log Out"]
    
    override func viewDidLoad() {
        tableViewSettings.delegate = self
        tableViewSettings.dataSource = self
        
        /* let dark = UserDefaults.standard.object(forKey: "darkTheme") as? Bool
        darkTheme = dark!
        print(darkTheme) */
        
    }
    
    
}

extension ViewControllerSettings: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            performSegue(withIdentifier: "profilePicsSegue", sender: self)}
        
        else if indexPath.row == 1 {
            performSegue(withIdentifier: "changePasswordSegue", sender: self)
        }
        
        else if indexPath.row == 2 {
            performSegue(withIdentifier: "changeUsernameSegue", sender: self)
        }
        
        else if indexPath.row == 3 {
            performSegue(withIdentifier: "changeDescriptionSegue", sender: self)
        }
        
        
        else if indexPath.row == 4 {
            
            if darkTheme == true {
                settings[4] = "Change to Light Mode"
                darkTheme = false
                //print(darkTheme)
                //UserDefaults.standard.set(false, forKey: "darkTheme")
                tableViewSettings.reloadData()

            }
            
            else if darkTheme == false {
                settings[4] = "Change to Dark Mode"
                //print(darkTheme)
                darkTheme = true
                //UserDefaults.standard.set(true, forKey: "darkTheme")
                tableViewSettings.reloadData()
                
            }
            
            //performSegue(withIdentifier: "toHome", sender: self)
            
            let themeAlert = UIAlertController(title: "In Development", message: "This Function is not completely finished from development. Please excuse the unpleasentries", preferredStyle: UIAlertController.Style.alert)
            
            themeAlert.addAction(UIAlertAction(title: "Okay", style: .default, handler: { (action: UIAlertAction!) in
                print("okay")
            }))
            

            present(themeAlert, animated: true, completion: nil)
        }
        
        
        else if indexPath.row == 5 {
            
            
            let logOutAlert = UIAlertController(title: "Log Out", message: "Are you sure you want to Log Out?", preferredStyle: UIAlertController.Style.alert)
            
            logOutAlert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { (action: UIAlertAction!) in
                print("Canceled")
            }))
            
            logOutAlert.addAction(UIAlertAction(title: "Log Out", style: .destructive, handler: { (action: UIAlertAction!) in
                self.performSegue(withIdentifier: "backToStart", sender: self)
                UserDefaults.standard.set(false, forKey:"loggedInState")
                
            }))

            present(logOutAlert, animated: true, completion: nil)

            
            
        }
        
        
        
        
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewSettings.dequeueReusableCell(withIdentifier: "settingsCell", for: indexPath)
        cell.textLabel?.text = settings[indexPath.row]
        
        if darkTheme == false {
            cell.contentView.backgroundColor = UIColor.white
            tableViewSettings.backgroundColor = UIColor.white
            tableViewSettings.separatorColor = UIColor.black
            view.backgroundColor = UIColor.white
            if settings[indexPath.row] == settings.last {
                cell.textLabel?.textColor = UIColor.red
            }
            else {
                cell.textLabel?.textColor = UIColor.black
            }
        }
        
        
        else if darkTheme == true {
            cell.contentView.backgroundColor = UIColor.black
            tableViewSettings.backgroundColor = UIColor.black
            tableViewSettings.separatorColor = UIColor.white
        if settings[indexPath.row] == settings.last {
            cell.textLabel?.textColor = UIColor.red
        }
        else {
            cell.textLabel?.textColor = UIColor.white
        }
        }
        return cell
    }
    
}
