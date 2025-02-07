import UIKit

/* A retain cycle (also known as a strong reference cycle) occurs when two or more objects hold strong references to each other, preventing either object from being deallocated. In Swift, this usually happens with reference types (classes), where each object keeps a strong reference to the other, leading to memory leaks because neither object can be deallocated by Automatic Reference Counting (ARC).
 
 To avoid retain cycles, you can use weak or unowned references, depending on the context.*/

class Game {
    var name: String
    var player: Player?  // Strong reference to Player
    
    init(name: String) {
        self.name = name
        print("Init for Game")

    }
    
    deinit { print("Game \(name) is deallocated") }
}

class Player {
    var username: String
    weak var game: Game?  // Strong reference to Game (causes retain cycle)
    
    init(username: String) {
        self.username = username
        print("Init for Player")
    }
    
    deinit { print("Player \(username) is deallocated") }
}

var game: Game? = Game(name: "Space Adventure")
var player: Player? = Player(username: "Player1")

game?.player = player
player?.game = game

// Attempting to deallocate
game = nil  // Game is still in memory because Player holds a strong reference
player = nil  // Player is still in memory because Game holds a strong reference

