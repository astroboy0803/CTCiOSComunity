//
//  MyUnownedClass1.swift
//  ARCTest
//
//  Created by i9400506 on 2018/8/10.
//  Copyright © 2018年 i9400506. All rights reserved.
//

import Foundation

public class MyUnownedClass1 {
    var name = ""
    unowned let unownedClass2: MyUnownedClass2
    public init(name: String, unownedClass2: MyUnownedClass2) {
        self.name = name
        self.unownedClass2 = unownedClass2
        print("Initializing MyUnownedClass1 with name \(self.name)")
    }

    deinit {
        print("Release MyUnownedClass1 with name \(self.name)")
    }
}
