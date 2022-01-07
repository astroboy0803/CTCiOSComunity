//
//  MyUnownedClass2.swift
//  ARCTest
//
//  Created by i9400506 on 2018/8/10.
//  Copyright © 2018年 i9400506. All rights reserved.
//

import Foundation

public class MyUnownedClass2 {
    var name = ""
    public var unownedClass1: MyUnownedClass1?
    public init(name: String) {
        self.name = name
        print("Initializing MyUnownedClass2 with name \(self.name)")
    }

    deinit {
        print("Release MyUnownedClass2 with name \(self.name)")
    }
}
