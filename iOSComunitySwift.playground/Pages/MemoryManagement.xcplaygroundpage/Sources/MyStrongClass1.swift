//
//  MyStrongClass1.swift
//  ARCTest
//
//  Created by i9400506 on 2018/8/10.
//  Copyright © 2018年 i9400506. All rights reserved.
//

import Foundation

public class MyStrongClass1 {
    var name = ""
    public var strongClass2: MyStrongClass2?
    public init(name: String) {
        self.name = name
        print("Initializing strongClass1 with name \(self.name)")
    }

    deinit {
        print("Release strongClass1 with name \(self.name)")
    }
}
