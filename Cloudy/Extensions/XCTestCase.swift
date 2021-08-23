//
//  XCTestCase.swift
//  CloudyTests
//
//  Created by Ygor Nascimento on 20/08/21.
//  Copyright © 2021 Cocoacasts. All rights reserved.
//

import XCTest

extension XCTestCase {
    func loadStub(name: String, extension: String) -> Data {
        let bundle = Bundle(for: type(of: self))
        
        let url = bundle.url(forResource: name, withExtension: `extension`)
        
        return try! Data(contentsOf: url!)
    }
}
