//
//  Mage.swift
//  MageHeroes
//
//  Created by Дмитро  on 28/04/22.
//

import Foundation


protocol MageProtocol: AnyObject {
    func getCurrentHP(_ value: Int)
}

class Mage {
    
    var name: String 
    
    var imageName: String
    
    var currentHP: Int {
        didSet {
            delegate?.getCurrentHP(currentHP)
        }
    }
    
    private(set) var fullHP: Int
    
    var currentMP: Int
    private(set) var fullMP: Int

    weak var delegate: MageProtocol?
    
    weak var enemy: Mage?
    
    var spell: Array<Spell> = []
    
    init(name: String ,hp: Int,mp: Int, imageName: String) {
        self.name = name
        
        self.currentHP = hp
        self.fullHP = hp

        self.currentMP = mp
        self.fullMP = mp
        
        self.imageName = imageName
    }
}




