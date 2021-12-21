//
//  DetailViewController.swift
//  AboutLifeCycle
//
//  Created by i9400506 on 2021/12/21.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
    
    init() {
        super.init(nibName: nil, bundle: nil)
        self.view.backgroundColor = .gray
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        print("detail - \(#function)")
        super.loadView()
    }
    
    override func viewDidLoad() {
        print("detail - \(#function)")
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("detail - \(#function)")
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("detail - \(#function)")
        super.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("detail - \(#function)")
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("detail - \(#function)")
        super.viewDidDisappear(animated)
    }
}
