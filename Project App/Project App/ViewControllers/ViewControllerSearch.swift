//
//  ViewControllerSearch.swift
//  Project App
//
//  Created by Adrian Schlegel on 21.03.22.
//

import UIKit

class ViewControllerSearch: UIViewController {

    @IBOutlet weak var gameSearchBar: UISearchBar!
    @IBOutlet var tableView: UITableView!
    var shownGames = [Game]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("view loaded")
        
        //shownGames = allGames()

        // assign delegates and data sources
        gameSearchBar.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        
        // use custom tableview cell
        let nib = UINib(nibName: "GameTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "GameTableViewCell")
        tableView.rowHeight = 260.0
        
    }
}

extension ViewControllerSearch: UISearchBarDelegate {
    
    // typing in searchbar
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("searching for: " + searchText)

        // remove leading and trailing whitespaces
        let text = searchText.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if text.count == 0 {
            shownGames = [Game]() // empty the table
            tableView.reloadData() // reload the table
            return
        }

        // loop over all games and check if a title contains the text
        // if it contains it then add it to the visible games in the table
        shownGames = [Game]() // empty the table
        for game in GameData.allGames() {
            if game.title.lowercased().contains(text.lowercased()) {
                print("found game: " + game.title)
                shownGames.append(game)
            }
        }
        
        // reload the table
        tableView.reloadData()
    }
}

extension ViewControllerSearch: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected row: " + String(indexPath.row))
    }
}

extension ViewControllerSearch: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shownGames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let game = shownGames[indexPath.row] // selected game
        
        // set values of the cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "GameTableViewCell", for: indexPath) as! GameTableViewCell
        
        // set color based on score
        if game.score < 50 {
            cell.scoreLabel.textColor = UIColor.red
        } else if game.score < 80 {
            cell.scoreLabel.textColor = UIColor.orange
        } else {
            cell.scoreLabel.textColor = UIColor.green
        }
        
        cell.scoreLabel.text = String(game.score) + "%"
        cell.titleLabel.text = game.title
        cell.gameImageView.remoteLoad(url: game.imageURL)
        return cell
    }
}


// extension which allows loading of a remote URL into an image
extension UIImageView {
    func remoteLoad(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}

