//
//  MyWeekClass2.swift
//  ARCTest
//
//  Created by i9400506 on 2018/8/10.
//  Copyright © 2018年 i9400506. All rights reserved.
//

import Foundation

public class MyWeakClass2 {
    var name = ""
    public weak var weakClass1: MyWeakClass1?
    public init(name: String) {
        self.name = name
        print("Initializing MyWeakClass2 with name \(self.name)")
    }

    deinit {
        print("Release MyWeakClass2 with name \(self.name)")
    }
}
