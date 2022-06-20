//
//  SpellCollectionViewCell.swift
//  MageHeroes
//
//  Created by Дмитро  on 01/05/22.
//

import Cocoa

protocol SpellCollectionViewCellDelegate: AnyObject {
    func getCollectionViewItem(_ item: NSCollectionViewItem)
    
}

class SpellCollectionViewCell: NSCollectionViewItem {

    static let identifier = NSUserInterfaceItemIdentifier("SpellCellIdentifier")

    weak var delegate: SpellCollectionViewCellDelegate?
    
    @IBOutlet var spellName: NSButton!
    
    @IBAction func spells(_ sender: NSButton) {
        delegate?.getCollectionViewItem(self)
    }
    
}
