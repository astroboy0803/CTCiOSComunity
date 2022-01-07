//
//  MyStrongClass2.swift
//  ARCTest
//
//  Created by i9400506 on 2018/8/10.
//  Copyright © 2018年 i9400506. All rights reserved.
//

import Foundation

public class MyStrongClass2 {
    var name = ""
    public var strongClass1: MyStrongClass1?
    public init(name: String) {
        self.name = name
        print("Initializing strongClass2 with name \(self.name)")
    }

    deinit {
        print("Release strongClass2 with name \(self.name)")
    }
}
