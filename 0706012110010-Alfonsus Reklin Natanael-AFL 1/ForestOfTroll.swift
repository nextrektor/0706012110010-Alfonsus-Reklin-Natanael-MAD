//
//  ForestOfTroll.swift
//  0706012110010-Alfonsus Reklin Natanael-AFL 1
//
//  Created by Nael on 16/03/23.
//

import Foundation


//func ForestTroll() {
//    let monster = Monster().MonsterGenerator()
//    var monsterAcak = Monster(name: monster.name, level: monster.level, health: monster.level)
//    print()
//    print("As you enter the forest, you feel a sense of unease wash over you.")
//    print("Suddenly, you hear the sound of twigs snapping behind you. You quickly spin around, and find a Troll emerging from the shadows.")
//    while (true) {
//        print()
////        print("😈 Name: \(monsterAcak["name"] as! String)")
////        print("😈 Level: \(monsterAcak["level"] as! Int)")
////        print("😈 Health: \(monsterAcak["health"] as! Int)")
//        print("😈 Name: \(monsterAcak.name)")
//        print("😈 Level: \(monsterAcak.level)")
//        print("😈 Health: \(monsterAcak.health)")
//        print()
//        print("============================================")
//        print()
//        checkHpMp()
//        checkPotion()
//        print()
//        print("Choose your action:")
//        print()
//        for (index, skill) in Skills.enumerated() {
//            print("[\(index + 1)] \(skill)")
//            if (index == 2) {
//                print()
//            }
//        }
//        
//        print()
//        print("Your choice?")
//        if let pilih = readLine() {                                         // => This will be passed to Battle to determine which skill to use
//            let damage = fight(pilih: pilih, monsterAcak: monsterAcak)
//            var updatedMonsterAcak = monsterAcak
//            updatedMonsterAcak.health = (updatedMonsterAcak.health) - damage
//                monsterAcak = updatedMonsterAcak
//        }
//        if (monsterAcak.health) <= 0 || playerHealth <= 0 {
//            break
//        }
//    }
//}
