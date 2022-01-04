//
//  ViewController.swift
//  Transition
//
//  Created by i9400506 on 2021/12/28.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // singleton
        print(ResultDatas.shareInstance.colors)
        print(ResultDatas.shareInstance.sortDatas)
    }

    
    @IBAction private func tapTab(sender: UIButton) {
        let tabViewController: UITabBarController = .init()
        let sortVC: SortViewController = .init(nibName: "SortViewController", bundle: nil)
        let paletteVC: PaletteViewController = .init(nibName: "PaletteViewController", bundle: nil)
        sortVC.tabBarItem = .init(tabBarSystemItem: .favorites, tag: 0)
        paletteVC.tabBarItem = .init(tabBarSystemItem: .history, tag: 1)
        tabViewController.viewControllers = [sortVC, paletteVC]
        tabViewController.modalPresentationStyle = .fullScreen
        self.present(tabViewController, animated: true)
    }
    
    @IBAction private func tapNavigation(sender: UIButton) {
        let sortVC: SortViewController = .init(nibName: "SortViewController", bundle: nil)
        sortVC.delegate = self
        let navController = UINavigationController(rootViewController: sortVC)
        navController.modalPresentationStyle = .fullScreen
        self.present(navController, animated: true)
    }
}

extension ViewController: SortViewDelegate {
    final func getValue(datas: [Int]) {
        let result = datas
            .compactMap({ String($0) })
            .joined(separator: ",")
        self.resultLabel.text = """
        SortViewController Return Value:
        \(result)
        """
    }
}
