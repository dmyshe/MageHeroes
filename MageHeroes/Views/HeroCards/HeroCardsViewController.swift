//
//  HeroPoint.swift
//  MageHeroes
//
//  Created by Дмитро  on 29/04/22.
//

import AppKit



class HeroCardsViewController: NSViewController {

    var viewModel = HeroCardsViewModel()

    // MARK: IBOutlets
    @IBOutlet var mageImage: NSImageView!
    @IBOutlet var magName: NSTextField!
    @IBOutlet var buttonCollectionView: NSCollectionView!
    @IBOutlet var mageHP: HeroCardsPoint!
    @IBOutlet var mageMP: HeroCardsPoint!
    
    convenience init(mage: Mage) {
        self.init()
        self.viewModel.mage = mage
        self.viewModel.mage.delegate = self
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        magName.stringValue = viewModel.mage?.name ?? "Mage"
        setupMageImage()
        setupButtonCollectionView()
        
        mageHP.cardType = .HP
        mageMP.cardType = .MP
        
        mageHP.overlapeShape.strokeEnd = CGFloat(viewModel.mage.currentHP)
    }
    
    private func setupMageImage() {
        let image =  NSImage(named: viewModel.mage?.imageName ?? "")

        let layer = CALayer()
        layer.contentsGravity = .resizeAspectFill
        layer.contents = image

        mageImage.layer = layer
        mageImage.layer?.cornerRadius = 10
        mageImage.wantsLayer = true
    }
    
    private func setupButtonCollectionView() {
        buttonCollectionView.register(SpellCollectionViewCell.self,
                                      forItemWithIdentifier: SpellCollectionViewCell.identifier)
        buttonCollectionView.dataSource = self
        buttonCollectionView.backgroundColors = [.clear]
    }
}

// MARK: - NSCollectionViewDataSource
extension HeroCardsViewController: NSCollectionViewDataSource {
    
    func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {

        guard let item = collectionView.makeItem(withIdentifier: SpellCollectionViewCell.identifier, for: indexPath) as? SpellCollectionViewCell else { return NSCollectionViewItem()  }
        
        item.delegate = self
        
        let spellName = viewModel.mage?.spell[indexPath.item].name ?? "test"
        item.spellName.title = spellName
        return item
    }
   
    func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.mage.spell.count
    }
}

// MARK: - SpellCollectionViewCellDelegate
extension HeroCardsViewController: SpellCollectionViewCellDelegate {
    func getCollectionViewItem(_ item: NSCollectionViewItem) {
                
        let item = buttonCollectionView.indexPath(for: item)
        let index = item!.item
                
        viewModel.mage.spell[index].spells()
        viewModel.checkGameOver()
    }
}

// MARK: - MageProtocol
extension  HeroCardsViewController: MageProtocol {
 
    func getCurrentHP(_ value: Int) {
        mageHP.overlapeShape.strokeEnd = viewModel.calculateHealthBar()
        mageHP.checkCurrentHP()
        mageMP.overlapeShape.strokeEnd = viewModel.calculateMageMP()
    }
}

