//
//  MyWeekClass1.swift
//  ARCTest
//
//  Created by i9400506 on 2018/8/10.
//  Copyright © 2018年 i9400506. All rights reserved.
//

import Foundation

public class MyWeakClass1 {
    var name = ""
    public var weakClass2: MyWeakClass2?
    public init(name: String) {
        self.name = name
        print("Initializing MyWeakClass1 with name \(self.name)")
    }

    deinit {
        print("Release MyWeakClass1 with name \(self.name)")
    }
}
