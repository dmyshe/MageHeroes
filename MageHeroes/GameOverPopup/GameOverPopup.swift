//
//  GameOverPopup.swift
//  MageHeroes
//
//  Created by Дмитро  on 03/05/22.
//

import Cocoa



class GameOverPopup: NSViewController {
    
    @IBOutlet var label: NSTextField!
    
    @IBAction func dismissVC(_ sender: NSButton) {
        dismiss(self)
    }
}
