//
//  Monster.swift
//  0706012110010-Alfonsus Reklin Natanael-AFL 1
//
//  Created by Nael on 16/03/23.
//

import Foundation

class Monster {
    
    var name: String
    var level: Int
    var health: Int
    
    init(name: String, level: Int, health: Int) {
        self.name = name
        self.level = level
        self.health = health
    }
    
    var monsters = [
        ["name": "Icel", "level": 2, "health": 200],
        ["name": "Marhaaadr", "level": 10, "health": 1000],
        ["name": "Joada", "level": 9, "health": 900],
        ["name": "Ddakl", "level": 8, "health": 920]
    ]
    
    func MonsterGenerator() -> Monster {
        let randomIndex = Int.random(in: 0..<monsters.count)
        let monsterDict = monsters[randomIndex]
        let mob = Monster(
            name: monsterDict["name"]! as! String,
            level: monsterDict["level"]! as! Int,
            health: monsterDict["health"]! as! Int)
        return mob
    }

//    var rama = (name: "Rama", level: 2, health: 100)
//    var marcell = (name: "Marcell", level: 10, health: 100)
//    var evan = (name: "Mr. Evan", level: 1, health: 999999999)

    
    
    // Method

//    func MonsterGenerator() -> Monster {
//        let random = Int.random(in: 0..<3)
//        var mob: Monster
//        switch random {
//        case 0:
//            mob = rama
//        case 1:
//            mob = marcell
//        default:
//            mob = evan
//        }
//        return mob
//    }
    
    
}



//                                                               ======= AFL 1 =======                                                                 //


//func MonsterGenerator() -> [String: Any] {
//    let random = Int.random(in: 0..<3)
//    var mob: [String: Any]
//    switch random {
//    case 0:
//        mob = ["name": "Marhaaadr", "level": 10, "health": 1000]
//    case 1:
//        mob = ["name": "Joada", "level": 9, "health": 900]
//    case 2:
//        mob = ["name": "Ddakl", "level": 8, "health": 920]
//    default:
//        mob = ["name": "Icel", "level": 2, "health": 200]
//    }
//    return mob
//}
