//
//  Heal.swift
//  0706012110010-Alfonsus Reklin Natanael-AFL 1
//
//  Created by Nael on 16/03/23.
//

import Foundation


//                            ===================                  FUNCTIONS                  ===================                            //

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


//                            ===================             TUPLE OF FUNCTIONS             ===================                            //
//                           Why use tuple?? To Simplify the getter since I made lots of functions here and there                           //

func Heal() -> (healHP: () -> Void, regenerateMP: () -> Void) {
    
    
    //                            ===================       Heal HP     ===================                            //
    
    func healHP() {
        if hpPotion > 0  && playerHealth != 100 {
            playerHealth += 20
            if playerHealth > 100 {
                playerHealth = 100
            }
            hpPotion -= 1
            print("Your HP healed by 20!")
            checkHpMp()
            checkPotion()
        } else if playerHealth == 100 {
            print()
            print("HP Anda sudah penuh!")
        } else {
            print()
            print("Your HP Potion is not Enough!")
        }
    }
    
    
    //                            ===================    Regenerate MP    ===================                            //
    
    func regenerateMP() {
        if mpPotion > 0 && playerMana != 100{
            playerMana += 10
            if playerMana > 100 {
                playerMana = 100
            }
            mpPotion -= 1
            print("Your MP restored by 10!")
            checkHpMp()
            checkPotion()
        } else if playerMana == 100{
            print()
            print("MP Anda sudah penuh!")
        } else {
            print()
            print("Your MP Potion is not Enough!")
        }
    }
    
    return (healHP, regenerateMP)
}
