//
//  ResultDatas.swift
//  Transition
//
//  Created by i9400506 on 2022/1/4.
//

import Foundation

internal class ResultDatas {
    struct Colors {
        let red: UInt
        let blue: UInt
        let green: UInt
    }
    
    static let shareInstance: ResultDatas = .init()
    
    private init() {
        
    }
    
    var sortDatas: [Int]?
    var colors: Colors?
}
