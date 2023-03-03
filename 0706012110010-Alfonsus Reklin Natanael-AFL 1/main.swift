//
//  main.swift
//  0706012110010-Alfonsus Reklin Natanael-AFL 1
//
//  Created by MacBook Pro on 28/02/23.
//

import Foundation


// Template Monster
struct monster {
    var type: String
    var level: Int
    var health: Int
}

// Monster
let rama = monster(type: "Rama", level: 2, health: 100)
let marcell = monster(type: "Marcell", level: 10, health: 1000)
let evan = monster(type: "Mr. Evan", level: 999999999999, health: 999999999)

// Variable Repeating Menu
var u = Int(0)
var u2 = Int(0)

// Variable Nama
var name = String("Young Hero")

// Homescreen
while u < 1 {
    
    // Monster Randomizer
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
    
    // Story
    // Welcome to the Death, my friend!
    // You got hit by a flying chair, such a ridiculous achievement I must say! Anyways, I give you a very rare opportunity which I have never offer to anyone but you. You will be sent to a world full of laugh... (sort of)...
    // Ehem. Enjoy your trip dear
    // Press [return] to continue
    
    // Tampilan Awal
    u2 = 0
    let home = "Welcome to the Death!! 🪦🪦\n\nYou got hit by a flying chair 🪑, such a ridiculous achievement I must say! Anyways, I give you a very rare opportunity which I have never offer to anyone but you 🫵🏻. You will be sent to a world 🌏 full of laugh... (sort of)...\n\nEhem. Enjoy your trip, dear\n\nPress [ok] to continue:"
    print(home)
    let pilih = readLine()
    
    switch pilih {
    case "1":
        // Game Start
        while ( u2 < 1 && mob.health > 0) {
            
            let monsterString = "\n\nMonster kamu: \(mob.type) \nLevel: \(mob.level) \nHealth: \(mob.health)"
            print(monsterString)
            
            let menu = "\n\nPilih Aksi: \n1. Pukul \n2. Tendang \n3. Kabur \n\nInput Aksi: "
            print(menu)
            let pilih2 = readLine()
            
            switch pilih2 {
            case "1":
                mob.health = mob.health - 10
            case "2":
                mob.health = mob.health - 30
            case "3":
                u2 = 1
            case "killermove":
                mob.health = 0
            default:
                print("\nMohon tuliskan 1, 2, atau 3 \nInput \(String(describing: pilih2)) bukan merupakan input yang benar\n\n")
            }
            
            if(mob.health <= 0) {
                print("\n==================================\nCongrats! Anda menang!!\n==================================\n")
            }
            
        }
    case "2":
        // Gacha
        while u2 < 1 {
            print("\n\nAnda belum memiliki hero apapun\nKembali? (y/n)")
            let back = readLine()
            print("\n")
            
            switch back {
            case "y":
                u2 = 1
            case "n":
                u2 = 0
            default:
                print("Mohon input dengan benar")
            }
        }
    case "ok":
        print("\n\nOh! One thing, I forgot your name. I believe you remember your name. What is your name?:")
        if let inputName = readLine() {
            if (inputName.contains("    ") || inputName.isEmpty || inputName.contains("\t")) {
                name = "Young Hero"
            } else {
                name = inputName
            }
        }
        print("\n\nOh? You will be called \(name) from now then!\nGood Luck \(name)!\n\n")
    case "S":
        print("\n\nOh! One thing, I forgot your name. I believe you remember your name. What is your name?:")
        if let inputName = readLine(), let regex = try? NSRegularExpression(pattern: "^[a-zA-Z]+$"), regex.numberOfMatches(in: inputName, range: NSRange(inputName.startIndex..., in: inputName)) == 1 {
            name = inputName
        } else {
            name = "Young Hero"
        }
        print("\n\nOh? You will be called \(name) from now then!\nGood Luck \(name)!\n\n")
    case "3":
        // Exit
        let animationFrames = ["🐼", "🦀", "🦆", "🦜", "🦋", "🐞", "🐣", "🦥"]
            var frameIndex = 0
            
            print("Exiting...")
            
            // Print animation frames with delay
            for _ in 0..<10 {
                let frame = animationFrames[frameIndex]
                print("  \(frame)  Please wait...")
                frameIndex = (frameIndex + 1) % animationFrames.count
                usleep(100_000) // Sleep for 100 milliseconds
            }
            
            exit(0)
    default:
        // Error handling
        print("\nMohon tuliskan 1 atau 2 \nInput \(String(describing: pilih)) bukan merupakan input yang benar\n")
    }
}

