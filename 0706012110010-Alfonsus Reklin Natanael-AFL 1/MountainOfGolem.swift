//
//  MountainOfGolem.swift
//  0706012110010-Alfonsus Reklin Natanael-AFL 1
//
//  Created by Nael on 16/03/23.
//

import Foundation

func MountainGolem() {
    var monsterAcak = MonsterGenerator()
    print()
    print("As you make your way through the rugged mountain terrain, you can feel the chill of the wind biting at your skin.")
    print("Suddenly, you hear a sound sound that makes you freeze in your tracks. That's when you see it - a massive, snarling Golem emerging from the shadows.")
    while (true) {
        print()
        print("😈 Name: \(monsterAcak["name"] as! String)")
        print("😈 Level: \(monsterAcak["level"] as! Int)")
        print("😈 Health: \(monsterAcak["health"] as! Int)")
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
        if let pilih = readLine() {                                         // => This will be passed to Battle to determine which skill to use
            let damage = fight(pilih: pilih, monsterAcak: monsterAcak)
            var updatedMonsterAcak = monsterAcak
                updatedMonsterAcak["health"] = (updatedMonsterAcak["health"] as! Int) - damage
                monsterAcak = updatedMonsterAcak
        }
        if (monsterAcak["health"] as! Int) <= 0 || playerHealth <= 0 {
            break
        }
    }
}
