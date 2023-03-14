//
//  main.swift
//  0706012110010-Alfonsus Reklin Natanael-AFL 1
//
//  Created by Nael :( on 28/02/23.
//

import Foundation

//import CoreGraphics // To detect key event
//import Cocoa
//
//class EditorWindow: NSWindow {
//    func keyDown(event: NSEvent) {
//        super.keyDown(with: event)
//        Swift.print("Caught a key down: \(event.keyCode)!")
//    }
//}
//
//extension CGKeyCode
//{
//    // Define whatever key codes you want to detect here
//    static let kVK_return: CGKeyCode = 0x24
//
//    var isPressed: Bool {
//        CGEventSource.keyState(.combinedSessionState, key: self)
//        return true
//    }
//}


// Template Monster
struct monster {
    var name: String
    var level: Int
    var health: Int
}

// Player
var playerHealth = 100
var playerMana = 100

// Monster
var rama = monster(name: "Rama", level: 2, health: 100)
var marcell = monster(name: "Marcell", level: 10, health: 1000)
var evan = monster(name: "Mr. Evan", level: 999999999999, health: 999999999)

let Skills = [
    "Physical Attack. No Mana Required. Deal 1pt - 10pt of damage.",
    "Meteor. Use 15pt of MP. Deal 50pt of damage.",
    "Shield. Use 10pt of MP. Block enemy's attack in 1 turn.",
    "Potion. Heal HP.",
    "Elixir. Refenerate MP.",
    "Reetttrrreaaatttt!!!!."
]

// Variable Repeating Menu
//var pilih: String

// Variable Nama
var name = String("Young Hero")


// Function To-Do
func fight(pilih: String, monsterAcak: monster) -> Int {
    // I may only use this one func to all fight!!
    // Random Damages -> Not necessary but good
    // Critical Chances??
    // Chance to drop item??
    // How much Player lost HP?? -> random?
    var damage: Int = 0
    print()
    switch pilih {
    case "1":
        damage = Int.random(in: 1..<11)
        print("You dealt \(damage) damage!!")
        print("Monster: \(monsterAcak.name)")
    default:
        print("Mohon input yang sesuai")
    }
    return damage
}


func Heal() {
    
}


// Function Fix

func MonsterGenerator() -> monster {
    let random = Int.random(in: 0..<3)
    var mob: monster
    switch random {
    case 0:
        mob = rama
    case 1:
        mob = marcell
    default:
        mob = evan
    }
    return mob
}

func Opening () {
    while(true) {
        print()
        print("Welcome to the Death!! 🪦🪦")
        print()
        print("You got hit by a flying chair 🪑, such a ridiculous achievement I must say! Anyways, I give you a very rare opportunity which I have never offer to anyone but you 🫵🏻. You will be sent to a world 🌏 full of laugh... (sort of)...")
        print()
        print("Ehem. Enjoy your trip, dear")
        print()
        print("Press [return] to continue:")
        let pilih = readLine()
        if (pilih == "") {
            break
        }
    }
}

func Welcome() {
    print()
    print("Oh! One thing, I forgot your name. I believe you remember your name. What is your name?:")
    if let inputName = readLine(), let regex = try? NSRegularExpression(pattern: "^[a-zA-Z]+$"), regex.numberOfMatches(in: inputName, range: NSRange(inputName.startIndex..., in: inputName)) == 1 {
        name = inputName
    } else {
        name = "Young Hero"
    }
    print()
    print("Oh? You will be called \(name) from now then!")
    print("Good Luck \(name)!")
    print()
}

func JourneyScreen() {
    while (true) {
        print()
        print("From here, you can...")
        print()
        print("[C]heck your health and stats")
        print("[H]eal your wounds with potion")
        print()
        
        print("... or choose where you want to go")
        print()
        print("[F]orest of Troll")
        print("[M]ountain of Golem")
        print("[Q]uit Game")
        print()
        print("Your choice?")
        let pilih = readLine()?.uppercased()
        switch pilih {
        case "F":
            ForestTroll()
        case "M":
            MountainGolem()
        case "Q":
            Exit()
        default:
            print()
            print("Please input correctly!")
            print()
        }
    }
}

func PlayerStats() {
    print("Player name : \(name)")
    print()
    print("HP: /100")
    print("MP: /50")
    print()

    print("Skills:")
    for (index, skill) in Skills.enumerated() {
        if (index < 3) {
            print("[\(index + 1)] \(skill)")
            if (index == 2) {
                print()
            }
        }
    }
    
    print()
    print("Items:")
    print("- Potion x[IntPotion]. Heal 20pt of your HP.")
    print("- Elixir x[IntElixir]. Regenerate 10pt of your MP.")
    
//    print("- Physical Attack. No Mana Required. Deal 5pt of damage.")
//    print("- Meteor. Use 15pt of MP. Deal 50pt of damage.")
//    print("- Shield. Use 10pt of MP. Block enemy's attack in 1 turn.")
//    print()
//    print("Items:")
//    print("- Potion x[IntPotion]. Heal 20pt of your HP.")
//    print("- Elixir x[IntElixir]. Regenerate 10pt of your MP.")
    
    print()
    print("Press [return] to go back: ")
}

func ForestTroll() {
    var monsterAcak = MonsterGenerator()
    print()
    print("As you enter the forest, you feel a sense of unease wash over you.")
    print("Suddenly, you hear the sound of twigs snapping behind you. You quickly spin around, and find a Troll emerging from the shadows.")
    while (true) {
        print()
        print("😈 Name: \(monsterAcak.name)")
        print("😈 Level: \(monsterAcak.level)")
        print("😈 Health: \(monsterAcak.health)")
        print()
        print("Choose your action:")
        print()
        for (index, skill) in Skills.enumerated() {
            print("[\(index + 1)] \(skill)")
            if (index == 2) {
                print()
            }
        }
        
        print()
        print("Your choice?")
        if let pilih = readLine() {
//            fight(pilih: pilih, monsterAcak: monsterAcak)
            let damage = fight(pilih: pilih, monsterAcak: monsterAcak)
            monsterAcak.health = monsterAcak.health - damage
        }
    }
}

func MountainGolem() {
    print()
    print("As you make your way through the rugged mountain terrain, you can feel the chill of the wind biting at your skin.")
    print("Suddenly, you hear a sound sound that makes you freeze in your tracks. That's when you see it - a massive, snarling Golem emerging from the shadows.")
    let monsterAcak = MonsterGenerator()
    print()
    print("😈 Name: \(monsterAcak.name)")
    print("😈 Level: \(monsterAcak.level)")
    print("😈 Health: \(monsterAcak.health)")
    print()
    print("Choose your action:")
    print()
    for (index, skill) in Skills.enumerated() {
        print("[\(index + 1)] \(skill)")
        if (index == 2) {
            print()
        }
    }
    
    print()
    print("Your choice?")
}

func Flee() {
    print("You feel that if you don't escape soon, you won't be able to continue the fight.")
    print("You look around frantically, searching for a way out. You sprint toward the exit and scream like a little girl.")
    print("You're safe, for now.")
    print("Press [return] to continue:")
    
}

func Exit() {
    let animationFrames = ["🐼", "🦀", "🦆", "🦜", "🦋", "🐞", "🐣", "🦥"]
                var frameIndex = 0
    
                print()
                print("Exiting...")
    
                // Print animation frames with delay
                for _ in 0..<10 {
                    let frame = animationFrames[frameIndex]
                    print("  \(frame)  Please wait...")
                    frameIndex = (frameIndex + 1) % animationFrames.count
                    usleep(100_000) // Sleep for 100 milliseconds
                }
    
                exit(0)
}


// Main View
while(true) {
    Opening()
    Welcome()
    JourneyScreen()
}


// Homescreen
//while u < 1 {
//
//    // Monster Randomizer
//    let random = Int.random(in: 0..<3)
//    var mob: monster
//    switch random {
//    case 0:
//        mob = rama
//    case 1:
//        mob = marcell
//    default:
//        mob = evan
//    }
//
//
//
//    // Tampilan Awal
//    u2 = 0
//    let home = "Welcome to the Death!! 🪦🪦\n\nYou got hit by a flying chair 🪑, such a ridiculous achievement I must say! Anyways, I give you a very rare opportunity which I have never offer to anyone but you 🫵🏻. You will be sent to a world 🌏 full of laugh... (sort of)...\n\nEhem. Enjoy your trip, dear\n\nPress [ok] to continue:"
//    print(home)
//
//
//    let pilih = readLine()
//
//    switch pilih {
//    case "1" :
//
//        // Game Start
//        while ( u2 < 1 && mob.health > 0) {
//
//            let monsterString = "\n\nMonster kamu: \(mob.name) \nLevel: \(mob.level) \nHealth: \(mob.health)"
//            print(monsterString)
//
//            let menu = "\n\nPilih Aksi: \n1. Pukul \n2. Tendang \n3. Kabur \n\nInput Aksi: "
//            print(menu)
//            let pilih2 = readLine()
//
//            switch pilih2 {
//            case "1":
//                mob.health = mob.health - 10
//            case "2":
//                mob.health = mob.health - 30
//            case "3":
//                u2 = 1
//            case "killermove":
//                mob.health = 0
//            default:
//                print("\nMohon tuliskan 1, 2, atau 3 \nInput \(String(describing: pilih2)) bukan merupakan input yang benar\n\n")
//            }
//
//            if(mob.health <= 0) {
//                print("\n==================================\nCongrats! Anda menang!!\n==================================\n")
//            }
//
//        }
//    case "2":
//
//        // Gacha
//        while u2 < 1 {
//            print("\n\nAnda belum memiliki hero apapun\nKembali? (y/n)")
//            let back = readLine()
//            print("\n")
//
//            switch back {
//            case "y":
//                u2 = 1
//            case "n":
//                u2 = 0
//            default:
//                print("Mohon input dengan benar")
//            }
//        }
//    case "ok":
//
//        //        Plus side from this mehtod is I can handle space, but can't filter all the possibilities of wrong input!!!
//        print("\n\nOh! One thing, I forgot your name. I believe you remember your name. What is your name?:")
//        if let inputName = readLine() {
//            if (inputName.contains("    ") || inputName.isEmpty || inputName.contains("\t")) {
//                name = "Young Hero"
//            } else {
//                name = inputName
//            }
//        }
//        print("\n\nOh? You will be called \(name) from now then!\nGood Luck \(name)!\n\n")
//    case "S":
//
////        Plus side from this mehtod is I can filter all the possibilities of wrong input, but can't handle space!!!
//        print("\n\nOh! One thing, I forgot your name. I believe you remember your name. What is your name?:")
//        if let inputName = readLine(), let regex = try? NSRegularExpression(pattern: "^[a-zA-Z]+$"), regex.numberOfMatches(in: inputName, range: NSRange(inputName.startIndex..., in: inputName)) == 1 {
//            name = inputName
//        } else {
//            name = "Young Hero"
//        }
//        print("\n\nOh? You will be called \(name) from now then!\nGood Luck \(name)!\n\n")
//    case "J":
//        JourneyScreen()
//    case "":
//            //        This doesn't work, it also detect emoji as nil
//            print("This should be [return] statement")
//    case "3":
//
//        // Exit
//        let animationFrames = ["🐼", "🦀", "🦆", "🦜", "🦋", "🐞", "🐣", "🦥"]
//            var frameIndex = 0
//
//            print("Exiting...")
//
//            // Print animation frames with delay
//            for _ in 0..<10 {
//                let frame = animationFrames[frameIndex]
//                print("  \(frame)  Please wait...")
//                frameIndex = (frameIndex + 1) % animationFrames.count
//                usleep(100_000) // Sleep for 100 milliseconds
//            }
//
//            exit(0)
//    default:
//
//        // Error handling
//        print("\nMohon tuliskan 1 atau 2 \nInput \(String(describing: pilih)) bukan merupakan input yang benar\n")
//    }
//}

