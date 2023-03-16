//
//  Battle.swift
//  0706012110010-Alfonsus Reklin Natanael-AFL 1
//
//  Created by Nael on 16/03/23.
//

import Foundation


//                            ===================                  FUNCTION                  ===================                            //

func fight(pilih: String, monsterAcak: monster) -> Int {
    
    // Variable Battle
    var damage: Int = 0             // => This will be passed to ForestOfTroll or MountainOfGolem since I couldn't change the monster HP (constant)
    var damageToPlayer: Int = 0     // => This will be passed to ForestOfTroll or MountainOfGolem since I couldn't change the monster HP (constant)
    
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
        
    //                            ===================       Physical Attack     ===================                            //
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
        
    //                            ===================           Meteor          ===================                            //
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
        
    //                            ===================           Shield          ===================                            //
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
        
    //                            ===================           Heal HP         ===================                            //
    case "4":
        Heal().healHP()
        EnemyDamage()
        
    //                            ===================         Regenerate MP     ===================                            //
    case "5":
        Heal().regenerateMP()
        EnemyDamage()
        
    //                            ===================             Flee          ===================                            //
    case "6":
        Flee()
        
    //                            ===================       Cheat Insta Kill    ===================                            //

    case "killermove":
        damage = monsterAcak.health
        print("You get a help from War God ⚡️, Marcell")
        print("The enemy died instantly 🪦")
        
    default:
        print("Please input correctly!")
    }
    return damage
}



//                            ===================                  FLEE                  ===================                            //
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
