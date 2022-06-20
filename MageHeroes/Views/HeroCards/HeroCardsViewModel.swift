//
//  HeroCardsViewModel.swift
//  MageHeroes
//
//  Created by Дмитро  on 01/05/22.
//

import Foundation


protocol HeroCardsViewModelDelegate: AnyObject {
    func gameOver(winner: Mage)
}

class HeroCardsViewModel {
    
    weak var delegate: HeroCardsViewModelDelegate?

    var mage: Mage!

    func calculateHealthBar() -> CGFloat {
        let mageCurrentHP: Double = Double(mage.currentHP)
        let mageFullHP: Double =  Double(mage.fullHP)
        
        return  mageCurrentHP / mageFullHP
    }
    
    func calculateMageMP() -> CGFloat {
        let mageCurrentMP: Double = Double(mage.currentMP)
        let mageFullMP: Double =  Double(mage.fullMP)
        
        return  mageCurrentMP / mageFullMP
    }
    
    func checkGameOver() {
        guard let enemy = mage.enemy else { return }
        if enemy.currentHP <= 0 {
            delegate?.gameOver(winner: mage)
        }
    }
    
}
