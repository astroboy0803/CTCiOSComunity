//
//  ViewController.swift
//  AboutLifeCycle
//
//  Created by i9400506 on 2021/12/21.
//

import UIKit

class ViewController: UIViewController {
    @IBAction func goNext(sender: UIButton) {
        self.navigationController?.pushViewController(DetailViewController(), animated: true)
    }
    override func loadView() {
        print("home - \(#function)")
        super.loadView()
    }
    
    override func viewDidLoad() {
        print("home - \(#function)")
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("home - \(#function)")
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("home - \(#function)")
        super.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("home - \(#function)")
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("home - \(#function)")
        super.viewDidDisappear(animated)
    }

}
