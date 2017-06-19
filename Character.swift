//
//  Character.swift
//  CharacterManager
//
//  Created by Brent Fordham on 4/25/17.
//  Copyright © 2017 Brent Fordham. All rights reserved.
//

import Foundation

enum CharacterCondition: CustomStringConvertible {
    case conscious
    case incapacitated
    
    var description: String {
        switch self {
        case .conscious:
            return "Conscious"
        case .incapacitated:
            return "Incapacitated"
        }
    }
}

class PlayerCharacter: Equatable {
    var className: String
    
    var name: String
    var maxHP: Int {
        return con
    }
    var currentHP: Int
    var maxMP: Int {
        return wis
    }
    var currentMP: Int
    
    var charLevel: Int
    var charXP: Int
    
    var str: Int
    var dex: Int
    var con: Int
    var int: Int
    var wis: Int
    var cha: Int
    
    var status: CharacterCondition {
        switch currentHP {
        case 1...Int.max:
            return .conscious
        default:
            return .incapacitated
        }
    }
    
    init(name: String) {
        self.name = name
        self.className = "None"
        self.str = 10
        self.dex = 10
        self.con = 10
        self.int = 10
        self.wis = 10
        self.cha = 10
        self.currentMP = 10
        self.currentHP = 10
        self.charLevel = 0
        self.charXP = 0
    }
    
    internal init(name: String, str: Int, dex: Int, con: Int, int: Int, wis: Int, cha: Int, currentMP: Int, currentHP: Int, charLevel: Int, charXP: Int) {
        self.className = "None"
        self.name = name
        self.str = str
        self.dex = dex
        self.con = con
        self.int = int
        self.wis = wis
        self.cha = cha
        self.currentMP = currentMP
        self.currentHP = currentHP
        self.charLevel = charLevel
        self.charXP = charXP
    }
    
    var jsonObject: [String: Any] {
        return [PlayerCharacter.nameKey: name,
                PlayerCharacter.strKey: str,
                PlayerCharacter.dexKey: dex,
                PlayerCharacter.conKey: con,
                PlayerCharacter.intKey: int,
                PlayerCharacter.wisKey: wis,
                PlayerCharacter.chaKey: cha,
                PlayerCharacter.currentMPKey: currentMP,
                PlayerCharacter.currentHPKey: currentHP,
                PlayerCharacter.charLevelKey: charLevel,
                PlayerCharacter.charXPKey: charXP]
    }
    
    convenience init?(jsonObject: [String: Any]) {
        guard let name = jsonObject[PlayerCharacter.nameKey] as? String,
            let str = jsonObject[PlayerCharacter.strKey] as? Int,
        let dex = jsonObject[PlayerCharacter.dexKey] as? Int,
        let con = jsonObject[PlayerCharacter.conKey] as? Int,
        let int = jsonObject[PlayerCharacter.intKey] as? Int,
        let wis = jsonObject[PlayerCharacter.wisKey] as? Int,
        let cha = jsonObject[PlayerCharacter.chaKey] as? Int,
        let currentMP = jsonObject[PlayerCharacter.currentMPKey] as? Int,
        let currentHP = jsonObject[PlayerCharacter.currentHPKey] as? Int,
        let charLevel = jsonObject[PlayerCharacter.charLevelKey] as? Int,
            let charXP = jsonObject[PlayerCharacter.charXPKey] as? Int
            else {
                return nil
        }
        self.init(name: name, str: str, dex: dex, con: con, int: int, wis: wis, cha: cha, currentMP: currentMP, currentHP: currentHP, charLevel: charLevel, charXP: charXP)
    }
    
    public static let nameKey = "name"
    public static let strKey = "str"
    public static let dexKey = "dex"
    public static let conKey = "con"
    public static let intKey = "int"
    public static let wisKey = "wis"
    public static let chaKey = "cha"
    public static let currentHPKey = "currentHP"
    public static let currentMPKey = "currentMP"
    public static let charLevelKey = "charLevel"
    public static let charXPKey = "charXP"
    
    public static func == (lhs: PlayerCharacter, rhs: PlayerCharacter) -> Bool {
        return lhs.name == rhs.name && lhs.str == rhs.str && lhs.dex == rhs.dex && lhs.con == rhs.con && lhs.int == rhs.int && lhs.wis == rhs.wis && lhs.cha == rhs.cha && lhs.charLevel == rhs.charLevel
    }
    
    func reduceHPBy(_ int: Int) {
        if (self.currentHP - int) >= 0 {
            self.currentHP -= int
        } else {
            self.currentHP = 0
        }
    }
    
    func increaseHPBy(_ int: Int) {
        if (self.currentHP + int) <= self.maxHP {
            self.currentHP += int
        } else {
            self.currentHP = self.maxHP
        }
    }
}

class Fighter: PlayerCharacter {
    override init(name: String) {
        super.init(name: name)
        self.className = "Fighter"
        self.name = name
        self.str = 12
        self.dex = 10
        self.con = 12
        self.int = 8
        self.wis = 8
        self.cha = 10
        self.currentMP = 8
        self.currentHP = 12
        self.charLevel = 1
        self.charXP = 0
    }
    
    internal override init(name: String, str: Int, dex: Int, con: Int, int: Int, wis: Int, cha: Int, currentMP: Int, currentHP: Int, charLevel: Int, charXP: Int) {
        super.init(name: name, str: str, dex: dex, con: con, int: int, wis: wis, cha: cha, currentMP: currentMP, currentHP: currentHP, charLevel: charLevel, charXP: charXP)
    }
    
    convenience init?(jsonObject: [String: Any]) {
        guard let name = jsonObject[PlayerCharacter.nameKey] as? String,
            let str = jsonObject[PlayerCharacter.strKey] as? Int,
            let dex = jsonObject[PlayerCharacter.dexKey] as? Int,
            let con = jsonObject[PlayerCharacter.conKey] as? Int,
            let int = jsonObject[PlayerCharacter.intKey] as? Int,
            let wis = jsonObject[PlayerCharacter.wisKey] as? Int,
            let cha = jsonObject[PlayerCharacter.chaKey] as? Int,
            let currentMP = jsonObject[PlayerCharacter.currentMPKey] as? Int,
            let currentHP = jsonObject[PlayerCharacter.currentHPKey] as? Int,
            let charLevel = jsonObject[PlayerCharacter.charLevelKey] as? Int,
            let charXP = jsonObject[PlayerCharacter.charXPKey] as? Int
            else {
                return nil
        }
        self.init(name: name, str: str, dex: dex, con: con, int: int, wis: wis, cha: cha, currentMP: currentMP, currentHP: currentHP, charLevel: charLevel, charXP: charXP)
    }
}

class Expert: PlayerCharacter {
    override init(name: String) {
        super.init(name: name)
        self.className = "Expert"
        self.name = name
        self.str = 8
        self.dex = 12
        self.con = 8
        self.int = 10
        self.wis = 10
        self.cha = 12
        self.currentMP = 10
        self.currentHP = 8
        self.charLevel = 1
        self.charXP = 0
    }
    
    internal override init(name: String, str: Int, dex: Int, con: Int, int: Int, wis: Int, cha: Int, currentMP: Int, currentHP: Int, charLevel: Int, charXP: Int) {
        super.init(name: name, str: str, dex: dex, con: con, int: int, wis: wis, cha: cha, currentMP: currentMP, currentHP: currentHP, charLevel: charLevel, charXP: charXP)
    }
    
    convenience init?(jsonObject: [String: Any]) {
        guard let name = jsonObject[PlayerCharacter.nameKey] as? String,
            let str = jsonObject[PlayerCharacter.strKey] as? Int,
            let dex = jsonObject[PlayerCharacter.dexKey] as? Int,
            let con = jsonObject[PlayerCharacter.conKey] as? Int,
            let int = jsonObject[PlayerCharacter.intKey] as? Int,
            let wis = jsonObject[PlayerCharacter.wisKey] as? Int,
            let cha = jsonObject[PlayerCharacter.chaKey] as? Int,
            let currentMP = jsonObject[PlayerCharacter.currentMPKey] as? Int,
            let currentHP = jsonObject[PlayerCharacter.currentHPKey] as? Int,
            let charLevel = jsonObject[PlayerCharacter.charLevelKey] as? Int,
            let charXP = jsonObject[PlayerCharacter.charXPKey] as? Int
            else {
                return nil
        }
        self.init(name: name, str: str, dex: dex, con: con, int: int, wis: wis, cha: cha, currentMP: currentMP, currentHP: currentHP, charLevel: charLevel, charXP: charXP)
    }
}

class Mage: PlayerCharacter {
    override init(name: String) {
        super.init(name: name)
        self.className = "Mage"
        self.name = name
        self.str = 10
        self.dex = 8
        self.con = 10
        self.int = 12
        self.wis = 12
        self.cha = 8
        self.currentMP = 12
        self.currentHP = 10
        self.charLevel = 1
        self.charXP = 0
    }
    
    internal override init(name: String, str: Int, dex: Int, con: Int, int: Int, wis: Int, cha: Int, currentMP: Int, currentHP: Int, charLevel: Int, charXP: Int) {
        super.init(name: name, str: str, dex: dex, con: con, int: int, wis: wis, cha: cha, currentMP: currentMP, currentHP: currentHP, charLevel: charLevel, charXP: charXP)
    }
    
    convenience init?(jsonObject: [String: Any]) {
        guard let name = jsonObject[PlayerCharacter.nameKey] as? String,
            let str = jsonObject[PlayerCharacter.strKey] as? Int,
            let dex = jsonObject[PlayerCharacter.dexKey] as? Int,
            let con = jsonObject[PlayerCharacter.conKey] as? Int,
            let int = jsonObject[PlayerCharacter.intKey] as? Int,
            let wis = jsonObject[PlayerCharacter.wisKey] as? Int,
            let cha = jsonObject[PlayerCharacter.chaKey] as? Int,
            let currentMP = jsonObject[PlayerCharacter.currentMPKey] as? Int,
            let currentHP = jsonObject[PlayerCharacter.currentHPKey] as? Int,
            let charLevel = jsonObject[PlayerCharacter.charLevelKey] as? Int,
            let charXP = jsonObject[PlayerCharacter.charXPKey] as? Int
            else {
                return nil
        }
        self.init(name: name, str: str, dex: dex, con: con, int: int, wis: wis, cha: cha, currentMP: currentMP, currentHP: currentHP, charLevel: charLevel, charXP: charXP)
    }
}
