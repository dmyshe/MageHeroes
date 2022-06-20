//
//  ViewController.swift
//  MageHeroes
//
//  Created by Дмитро  on 28/04/22.
//

import Cocoa

class GameViewController: NSViewController {
    //MARK: -Model
    var game = Game()
    
    //MARK: - Mage Players
    lazy var firstMageCard = HeroCardsViewController(mage: game.mage1)
    lazy var secondMageCard = HeroCardsViewController(mage: game.mage2)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        game.createNewRound()
        
        firstMageCard.viewModel.delegate = self
        secondMageCard.viewModel.delegate = self
        setupUI()
    }
    
    private func setupUI() {
        let cardMageStackView = NSStackView(views: [firstMageCard.view,
                                                    secondMageCard.view
                                                   ])
        
        cardMageStackView.distribution = .fillEqually
        cardMageStackView.orientation = .horizontal
        
        
        cardMageStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(cardMageStackView)
        
        NSLayoutConstraint.activate([
            cardMageStackView.leftAnchor.constraint(equalTo: view.leftAnchor),
            cardMageStackView.rightAnchor.constraint(equalTo: view.rightAnchor),
            cardMageStackView.topAnchor.constraint(equalTo: view.topAnchor),
            cardMageStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

// MARK: - HeroCardsViewModelDelegate

extension GameViewController: HeroCardsViewModelDelegate {
    func gameOver(winner: Mage) {
        let vc = GameOverPopup()
        vc.label?.stringValue = winner.name
        presentAsSheet(vc)
    }
}
