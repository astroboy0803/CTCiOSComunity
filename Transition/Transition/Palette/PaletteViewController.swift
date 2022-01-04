//
//  ViewController.swift
//  Palette
//
//  Created by i9400506 on 2021/12/14.
//

import UIKit

class PaletteViewController: UIViewController {
    
    typealias Completion = (ColorProvider) -> Void
    
    // tuple
    typealias ColorProvider = (red: UInt, green: UInt, blue: UInt)

    @IBOutlet private var showView: UIView!
    
    @IBOutlet private var rSlider: UISlider!
    @IBOutlet private var gSlider: UISlider!
    @IBOutlet private var bSlider: UISlider!
    
    @IBOutlet private var closeButton: UIButton!
    
    private var completion: Completion? = nil
    
    // store property
    private var colorProvider: ColorProvider! {
        
        // property observe
        didSet {
            self.showView.backgroundColor = color
            let cgComponents = color.cgColor.components
            rSlider.value = Float(cgComponents?[0] ?? .zero)
            gSlider.value = Float(cgComponents?[1] ?? .zero)
            bSlider.value = Float(cgComponents?[2] ?? .zero)
            
            // singleton
            ResultDatas.shareInstance.colors = .init(red: colorProvider.red, blue: colorProvider.blue, green: colorProvider.green)
        }
    }
    
    // compute property
    private var color: UIColor {
        .init(red: CGFloat(colorProvider.red) / 255, green: CGFloat(colorProvider.green) / 255, blue: CGFloat(colorProvider.blue) / 255, alpha: 1)
    }
    
    func setup(handler: @escaping Completion) {
        self.completion = handler
    }
    
    override func viewDidLoad() {        
        super.viewDidLoad()
        
        closeButton.isHidden = self.navigationController != nil
        
        self.showView.layer.cornerRadius = 150
        colorProvider = randomColor()
        
        // 更換back
//        self.navigationItem.leftBarButtonItem = .init(title: "<回上頁", style: .done, target: self, action: #selector(doBack))
    }
    
//    @objc
//    private func doBack() {
//        self.completion?(colorProvider)
//        self.navigationController?.popViewController(animated: true)
//    }
    
    // 使用預設back的話, 可以透過willdisappear來偵測
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if self.isMovingFromParent {
            self.completion?(colorProvider)
        }
    }
    
    @IBAction private func doClose(sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
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
