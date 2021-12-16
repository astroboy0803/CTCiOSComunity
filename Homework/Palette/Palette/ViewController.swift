//
//  ViewController.swift
//  Palette
//
//  Created by i9400506 on 2021/12/14.
//

import UIKit

class ViewController: UIViewController {
    
    // tuple
    typealias ColorProvider = (red: UInt, green: UInt, blue: UInt)

    @IBOutlet private var showView: UIView!
    
    @IBOutlet private var rSlider: UISlider!
    @IBOutlet private var gSlider: UISlider!
    @IBOutlet private var bSlider: UISlider!
    
    // store property
    private var colorProvider: ColorProvider! {
        
        // property observe
        didSet {
            self.showView.backgroundColor = color
            let cgComponents = color.cgColor.components
            rSlider.value = Float(cgComponents?[0] ?? .zero)
            gSlider.value = Float(cgComponents?[1] ?? .zero)
            bSlider.value = Float(cgComponents?[2] ?? .zero)
        }
    }
    
    // compute property
    private var color: UIColor {
        .init(red: CGFloat(colorProvider.red) / 255, green: CGFloat(colorProvider.green) / 255, blue: CGFloat(colorProvider.blue) / 255, alpha: 1)
    }
    
    override func viewDidLoad() {        
        super.viewDidLoad()
        self.showView.layer.cornerRadius = 150
        colorProvider = randomColor()
    }
    
    @IBAction private func update(sender: UISlider) {
        let cgValue = UInt(sender.value * 255)
        if sender === rSlider {
            colorProvider.red = cgValue
        } else if sender === gSlider {
            colorProvider.green = cgValue
        } else if sender === bSlider {
            colorProvider.blue = cgValue
        }
    }
    
    private func randomColor() -> ColorProvider {
        (red: .random(in: 0...255), green: .random(in: 0...255), blue: .random(in: 0...255))
    }
}
