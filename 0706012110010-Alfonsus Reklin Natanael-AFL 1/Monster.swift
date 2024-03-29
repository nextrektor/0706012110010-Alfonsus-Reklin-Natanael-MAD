//
//  Monster.swift
//  0706012110010-Alfonsus Reklin Natanael-AFL 1
//
//  Created by Nael on 16/03/23.
//

import Foundation

var monsters = [
    ["name": "Icel", "level": 2, "health": 200],
    ["name": "Marhaaadr", "level": 10, "health": 1000],
    ["name": "Joada", "level": 9, "health": 900],
    ["name": "Ddakl", "level": 8, "health": 920]
]


// Template Monster
//struct monster {
//    var name: String
//    var level: Int
//    var health: Int
//}
//
//var rama = monster(name: "Rama", level: 2, health: 100)
//var marcell = monster(name: "Marcell", level: 10, health: 100)
//var evan = monster(name: "Mr. Evan", level: 999999999999, health: 999999999)


//func MonsterGenerator() -> monster {
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
//    return mob
//}

func MonsterGenerator() -> [String: Any] {
    let random = Int.random(in: 0..<3)
    var mob: [String: Any]
    switch random {
    case 0:
        mob = ["name": "Marhaaadr", "level": 10, "health": 1000]
    case 1:
        mob = ["name": "Joada", "level": 9, "health": 900]
    case 2:
        mob = ["name": "Ddakl", "level": 8, "health": 920]
    default:
        mob = ["name": "Icel", "level": 2, "health": 200]
    }
    return mob
}
