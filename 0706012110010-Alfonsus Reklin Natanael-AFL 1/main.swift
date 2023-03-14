//
//  main.swift
//  0706012110010-Alfonsus Reklin Natanael-AFL 1
//
//  Created by Nael on 28/02/23.
//

import Foundation


// [][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][] //

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

// [][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][] //

// CODE ABOVE IS USED TO DETECT KEYBOARD VALUE, ESPECIALLY TO DETECT RETURN //
// I FOUND EASIER WAY, BUT I DON'T WANT TO DELETE IT JUST YET //


//          PLAYER           //

var playerHealth = 100
var playerMana = 100
var hpPotion = 5
var mpPotion = 5
var name = String("Young Hero") // => Default Name

let Skills = [
    "Physical Attack. No Mana Required. Deal 1pt - 10pt of damage.",
    "Meteor. Use 15pt of MP. Deal 50pt - 100pt of damage.",
    "Shield. Use 10pt of MP. Block enemy's attack in 1 turn.",
    "Potion. Heal HP.",
    "Elixir. Refenerate MP.",
    "Reetttrrreaaatttt!!!!."
]


//          MONSTER           //

// Template Monster
struct monster {
    var name: String
    var level: Int
    var health: Int
}

var rama = monster(name: "Rama", level: 2, health: 100)
var marcell = monster(name: "Marcell", level: 10, health: 100)
var evan = monster(name: "Mr. Evan", level: 999999999999, health: 999999999)

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


//          BATTLE           //

func fight(pilih: String, monsterAcak: monster) -> Int {
    
    // Variable Battle
    var damage: Int = 0
    var damageToPlayer: Int = 0
    
    func EnemyDamage() {
        damageToPlayer = Int.random(in: 0..<11)
        playerHealth -= damageToPlayer
        print()
        print("~~~ Enemy's turn ~~~")
        print("\(monsterAcak.name) deal \(damageToPlayer) damage!!")
        checkHpMp()
    }
    
    print()
    switch pilih {
        
    // Physical Attack
    case "1":
        damage = Int.random(in: 1..<11)
        print("You dealt \(damage) damage!!")
        dropPotion()
        if (monsterAcak.health - damage) > 0 {
            EnemyDamage()
        } else {
            print()
            print("You've defeat \(monsterAcak.name)")
            print()
        }
        
    // Meteor
    case "2":
        if playerMana < 15 {
            print("Your MP is not enough!!!")
        } else {
            damage = Int.random(in: 50..<101)
            print("You dealt \(damage) damage!!")
            dropPotion()
            playerMana -= 15
            if (monsterAcak.health - damage) > 0 {
                EnemyDamage()
            } else {
                print()
                print("You've defeat \(monsterAcak.name)")
                print()
            }
        }
        
    // Shield
    case "3":
        if playerMana < 10 {
            print("Your MP is not enough!!!")
        } else {
            playerMana -= 10
            damage = 0
            damageToPlayer = 0
            print("You block enemy's damage!!")
            print()
        }
        
    // Heal HP
    case "4":
        Heal().healHP()
        EnemyDamage()
        
    case "5":
        Heal().regenerateMP()
        EnemyDamage()
        
    case "6":
        Flee()
        
    // Cheat Killermove - Insta Kill (Development Only)
    case "killermove":
        damage = monsterAcak.health
        print("You get a help from War God ⚡️, Marcell")
        print("The enemy died instantly 🪦")
        
    default:
        print("Please input correctly!")
    }
    return damage
}


//          HEAL & POTION           //

func dropPotion() {
    let dropChance = Int.random(in: 0..<201)
    let totalPotion = Int.random(in: 1..<6)
    print("[\(dropChance)]")
    if (25...76).contains(dropChance) {
        hpPotion += totalPotion
        print("You have obtained HP Potion \(totalPotion)x")
        checkPotion()
    } else if (125...176).contains(dropChance) {
        mpPotion += totalPotion
        print("You have obtained MP Potion \(totalPotion)x")
        checkPotion()
    }
}

func checkHpMp () {
    print()
    print("Your HP: \(playerHealth)")
    print("Your MP: \(playerMana)")
    print()
}

func checkPotion () {
    print()
    print("Your HP Potion: \(hpPotion)")
    print("Your MP Potion: \(mpPotion)")
    print()
}


func Heal() -> (healHP: () -> Void, regenerateMP: () -> Void) {
    
    // This is Tuple of Functions - Coba2 soalnya udah kebanyakan function, next time bakal pecah file aja
    
    func healHP() {
        playerHealth += 20
        print("Your HP healed by 20!")
        checkHpMp()
    }
    
    func regenerateMP() {
        playerMana += 10
        print("Your MP restored by 10!")
        checkHpMp()
    }
    
    return (healHP, regenerateMP)
}


//          SCREEN           //

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

func PlayerStats() {
    while (true) {
        print()
        print("Player name : \(name)")
        print()
        print("HP: \(playerHealth) / 100")
        print("MP: \(playerMana) / 100")
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
        print("- Potion x[\(hpPotion)]. Heal 20pt of your HP.")
        print("- Elixir x[\(mpPotion)]. Regenerate 10pt of your MP.")
        
        print()
        print("Press [return] to go back: ")
        let pilih = readLine()
        if (pilih == "") {
            print("Returning...")
            break
        }
    }
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
        print("============================================")
        print()
        checkHpMp()
        checkPotion()
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
            let damage = fight(pilih: pilih, monsterAcak: monsterAcak)
            monsterAcak.health = monsterAcak.health - damage
        }
        if monsterAcak.health <= 0 || playerHealth <= 0 {
            break
        }
    }
}

func MountainGolem() {
    var monsterAcak = MonsterGenerator()
    print()
    print("As you make your way through the rugged mountain terrain, you can feel the chill of the wind biting at your skin.")
    print("Suddenly, you hear a sound sound that makes you freeze in your tracks. That's when you see it - a massive, snarling Golem emerging from the shadows.")
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
            let damage = fight(pilih: pilih, monsterAcak: monsterAcak)
            monsterAcak.health = monsterAcak.health - damage
        }
        if monsterAcak.health <= 0 || playerHealth <= 0 {
            break
        }
    }
}

func Flee() {
    while (true) {
        print("You feel that if you don't escape soon, you won't be able to continue the fight.")
        print("You look around frantically, searching for a way out. You sprint toward the exit and scream like a little girl.")
        print("You're safe, for now.")
        print("Press [return] to continue:")
        let pilih = readLine()
        if (pilih == "") {
            break
        }
    }
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


//          MAIN VIEW           //

while(true) {
    Opening()
    Welcome()
    JourneyScreen()
}
