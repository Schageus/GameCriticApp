//
//  GameData.swift
//  Project App
//
//  Created by Adrian Schlegel on 21.03.22.
//

import Foundation

class GameData {
    // returns an array of games
    class func allGames() -> [Game] {
        var g = [Game]()
        g.append(Game(title: "Battlefield 2042",
                      description: "descr3",
                      score: 40,
                      imageURL: URL(string: "https://m.media-amazon.com/images/I/71PIucvgepL._AC_UY436_QL65_.jpg")!))
        
        g.append(Game(title: "Call of Duty Cold War",
                      description: "descr2",
                      score: 82,
                      imageURL: URL(string: "https://m.media-amazon.com/images/I/81HG4QoeiyL._AC_UY436_QL65_.jpg")!))
        
        g.append(Game(title: "Call of Duty Vanguard",
                      description: "descr1",
                      score: 73,
                      imageURL: URL(string: "https://m.media-amazon.com/images/I/716vq6p+B0L._SX522_.jpg")!))
        
        g.append(Game(title: "Horizon Zero Dawn",
                      description: "descr1",
                      score: 89,
                      imageURL: URL(string: "https://m.media-amazon.com/images/I/81kIo-LKanL._AC_UY436_QL65_.jpg")!))
     
        g.append(Game(title: "Horizon Forbidden West",
                      description: "descr1",
                      score: 90,
                      imageURL: URL(string: "https://m.media-amazon.com/images/I/81tdRcle46L._AC_UY436_QL65_.jpg")!))
        
        g.append(Game(title: "Minecraft",
                      description: "descr3",
                      score: 90,
                      imageURL: URL(string: "https://m.media-amazon.com/images/I/51WSOATtAhL._AC_UY436_QL65_.jpg")!))
        
        g.append(Game(title: "Rust",
                      description: "descr3",
                      score: 69,
                      imageURL: URL(string: "https://m.media-amazon.com/images/I/71j-7Rc+N1L._AC_UY436_QL65_.jpg")!))
        
        g.append(Game(title: "The Last Of Us Remastered",
                      description: "descr3",
                      score: 95,
                      imageURL: URL(string: "https://m.media-amazon.com/images/I/81pHOtx2zjL._AC_UY436_QL65_.jpg")!))
        
        g.append(Game(title: "The Last Of Us Part II",
                      description: "descr3",
                      score: 93,
                      imageURL: URL(string: "https://m.media-amazon.com/images/I/81jOO53m2PL._AC_UY436_QL65_.jpg")!))
        

        return g
    }
}
