//
//  Spell.swift
//  MageHeroes
//
//  Created by Дмитро  on 29/04/22.
//

import Foundation


class Spell {

    let name: String
    let power: Int
    let loseMagicPoint: Int
    
    var mage: Mage?
    
    func spells() {
        guard let mage = mage, let enemy = mage.enemy else { return }
        enemy.currentHP -= power
        mage.currentMP -= loseMagicPoint
    }

    init(name: String, power: Int, loseMagicPoint: Int, userMageName: Mage) {
        self.name = name
        self.power = power
        self.loseMagicPoint = loseMagicPoint
        self.mage = userMageName
    }
}

class Fireball: Spell {
    override func spells() {
        super.spells()
        print("fireball attack")
    }
}

class Fireworks: Spell {
    override func spells() {
        super.spells()
        print("fireworks")
    }
}

class HitAndHeal: Spell {
    
    var healHP: Int!
    
    convenience init(name: String, power: Int, loseMagicPoint: Int, healHP: Int, userMageName: Mage) {
        self.init(name: name, power: power, loseMagicPoint: loseMagicPoint, userMageName: userMageName)
        self.healHP = healHP
    }

    
    override func spells() {
        super.spells()
        guard let mage = mage else { return }
        
        if mage.currentHP < mage.fullHP {
            mage.currentHP += healHP
            print("HitAndHeal")
        }
    }
}
