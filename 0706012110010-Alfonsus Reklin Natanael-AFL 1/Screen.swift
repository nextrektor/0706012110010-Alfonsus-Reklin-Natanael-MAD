//
//  Screen.swift
//  0706012110010-Alfonsus Reklin Natanael-AFL 1
//
//  Created by Nael on 16/03/23.
//

import Foundation




//                            ===================                  OPENING                  ===================                            //

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




//                            ===================                  WELCOME                  ===================                            //

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




//                            ===================                  JOURNEY SCREEN                  ===================                            //

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
        case "C":
            PlayerStats()
        case "H":
            Heal().healHP()
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
        
        if playerHealth <= 0 {
            print()
            print("You died!")
            break
        }
    }
}


//                            ===================                  EXIT                  ===================                            //

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
