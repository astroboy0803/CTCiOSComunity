//
//  ViewController.swift
//  Transition
//
//  Created by i9400506 on 2021/12/28.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
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
        let navController = UINavigationController(rootViewController: sortVC)
        navController.modalPresentationStyle = .fullScreen
        self.present(navController, animated: true)
    }

}

