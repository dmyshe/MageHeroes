//
//  HeroCardsPoint.swift
//  MageHeroes
//
//  Created by Дмитро  on 29/04/22.
//

import AppKit


class HeroCardsPoint: NSView {
    
    var overlapeShape = CAShapeLayer()
    var backgroundShape = CAShapeLayer()
    
    enum HeroCardsType {
        case HP,MP
    }
    
    var cardType: HeroCardsType!
    
    override func draw(_ rect: NSRect) {
        configreCard(with: cardType)
        setup(overlapeShape)
    }
    
    func checkCurrentHP() {
      switch overlapeShape.strokeEnd {
      case 0.6...1:
          overlapeShape.strokeColor = NSColor.fullHPColor.cgColor
          print("fullHPColor")
      case 0.3...0.5:
          overlapeShape.strokeColor = NSColor.middleHPColor.cgColor
          print("middleHPColor")
      case 0...0.2:
          overlapeShape.strokeColor = NSColor.lowHPColor.cgColor
          print("lowHPColor")

      default:
          print("undefined checkCurrentHP ")
      }
  }
 
    private func configreCard(with type: HeroCardsType ) {
        switch type {
        case .HP:
            configure(overlapeShape, strokeColor: .fullHPColor , lineWidth: 30)
        case .MP:
            configure(overlapeShape, strokeColor: .fullMPColor , lineWidth: 20)
        }
    }
    
    private func configure(_ shapeLayer: CAShapeLayer , strokeColor: NSColor,  lineWidth: CGFloat) {
        shapeLayer.lineWidth = lineWidth
        shapeLayer.strokeColor = strokeColor.cgColor
    }
    
    private func setup( _ layer: CAShapeLayer ) {
        self.wantsLayer = true

        layer.frame = self.bounds
        let path = NSBezierPath()
        path.move(to: NSPoint(x: layer.bounds.width - 200 , y: layer.bounds.height))
        path.line(to: NSPoint(x: layer.bounds.width  , y: layer.bounds.height))
        layer.path = path.cgPath
        layer.lineCap = .round
        
        switch cardType {
        case .HP:
            self.layer?.cornerRadius = 5
            self.layer?.borderWidth = 1
            self.layer?.borderColor = NSColor.gray.cgColor

        case .MP:
            self.layer?.cornerRadius = 5
            self.layer?.borderWidth = 1
            self.layer?.borderColor = NSColor.gray.cgColor
        case .none:
            print("cardType is undefined")
        }
        
        self.layer?.addSublayer(layer)
    }
    
}


extension NSColor {
    static let fullHPColor = NSColor(named: "fullHPColor")!
    static let middleHPColor =  NSColor(named: "middleHPColor")!
    static let lowHPColor = NSColor(named: "lowHPColor")!
    
    static let fullMPColor = NSColor(named: "fullMPColor")!
}
