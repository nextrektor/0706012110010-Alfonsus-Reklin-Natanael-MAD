//
//  Player.swift
//  0706012110010-Alfonsus Reklin Natanael-AFL 1
//
//  Created by MacBook Pro on 16/03/23.
//

import Foundation

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
