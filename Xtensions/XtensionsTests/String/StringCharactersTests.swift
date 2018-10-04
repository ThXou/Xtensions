//
//  StringCharactersTests.swift
//  XtensionsTests
//
//  Created by Luis Cardenas on 04/10/2018.
//  Copyright © 2018 Thxou. All rights reserved.
//

import XCTest
import Nimble
@testable import Xtensions

class StringCharactersTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testStringTrimming() {
        let text = "  whatever   "
        let trimmed = text.x_trimmed
        expect(trimmed).to(equal("whatever"))
    }
    
    func testStringEmptyness() {
        let text = "  "
        expect(text.x_isEmpty).to(beTrue())
    }

}
