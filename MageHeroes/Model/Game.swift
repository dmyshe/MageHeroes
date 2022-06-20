//
//  GameViewModel.swift
//  MageHeroes
//
//  Created by Дмитро  on 01/05/22.
//

import Foundation


class Game {
    var mage1 = Mage(name: "Elf", hp: 100, mp: 100, imageName: "elf")
    var mage2 = Mage(name: "Druid", hp: 100, mp: 100, imageName: "druid")
    
    func createNewRound() {
     
        mage1.enemy = mage2
        let fireBall = Fireball(name: "Fireball", power: 20, loseMagicPoint: 5, userMageName: mage1)
        mage1.spell = [fireBall]
        
        mage2.enemy = mage1
        let hitAndHeal = HitAndHeal(name: "Hit and heal", power: 10, loseMagicPoint: 10, healHP: 5, userMageName: mage2)
        mage2.spell = [hitAndHeal]
    }
}
