//
//  ViewController.swift
//  CTCiSort
//
//  Created by i9400506 on 2021/12/10.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private var firstLabel: UILabel!
    @IBOutlet private var secondLabel: UILabel!
    @IBOutlet private var thirdLabel: UILabel!
    @IBOutlet private var fourthLabel: UILabel!
    @IBOutlet private var fifthLabel: UILabel!
    
    private var labels: [UILabel] {
        [firstLabel, secondLabel, thirdLabel, fourthLabel, fifthLabel]
    }
    
    private var datas: [Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction private func doRandom(sender: UIButton) {
        for label in labels {
            let value = Int.random(in: 1...100)
            datas.append(value)
            label.text = "\(value)"
        }
    }
    
    @IBAction private func doSorted(sender: UIButton) {
        //datas.sort(by: { $0 < $1 })        
        let count = datas.count
        for oIdx in 0..<count {
            for iIdx in 0..<count-1-oIdx {
                if datas[iIdx] > datas[iIdx+1] {
                    let tmp = datas[iIdx]
                    datas[iIdx] = datas[iIdx+1]
                    datas[iIdx+1] = tmp
                }
            }
        }
        for row in labels.enumerated() {
            row.element.text = "\(datas[row.offset])"
        }
    }
}

