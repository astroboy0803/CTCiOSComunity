//
//  ViewController.swift
//  Palette
//
//  Created by i9400506 on 2021/12/14.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private var showView: UIView!
    @IBOutlet private var showLabel: UILabel!
    
    @IBOutlet private var rSlider: UISlider!
    @IBOutlet private var gSlider: UISlider!
    @IBOutlet private var bSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let initColor: UIColor = .randomColor()
        self.showView.backgroundColor = initColor
        if let components = initColor.cgColor.components {
            rSlider.value = Float(components[0])
            gSlider.value = Float(components[1])
            bSlider.value = Float(components[2])
        } else {
            rSlider.value = .zero
            gSlider.value = .zero
            bSlider.value = .zero
        }
        self.showLabel.text = """
        R: \(rSlider.value)
        G: \(gSlider.value)
        B: \(bSlider.value)
        """
    }
    
    @IBAction private func update(sender: UISlider) {
        
    }
    
    
}

extension UIColor {
    static func randomColor() -> UIColor {
        let red: CGFloat = .random(in: 0...1)
        let green: CGFloat = .random(in: 0...1)
        let blue: CGFloat = .random(in: 0...1)
        print("random = \(red), \(green), \(blue)")
        return .init(red: red, green: green, blue: blue, alpha: 1)
    }
}
