//
//  MyClass.swift
//  ARCTest
//
//  Created by i9400506 on 2018/8/10.
//  Copyright © 2018年 i9400506. All rights reserved.
//

import Foundation

public class MyClass {
    var name = ""
    public init(name: String) {
        self.name = name
        print("Initializing MyClass with name \(self.name)")
    }

    deinit {
        print("Release MyClass with name \(self.name)")
    }
}
