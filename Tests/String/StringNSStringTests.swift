//
//  StringNSStringTests.swift
//  XtensionsTests
//
//  Created by Luis Cardenas on 04/10/2018.
//  Copyright © 2018 Thxou. All rights reserved.
//

import XCTest
import Nimble
@testable import Xtensions

class StringNSStringTests: XCTestCase {
    
    let baseUrl = "subdomain.domain.com/"
    let path = "test/test.ext"
    
    var url: String!
    

    override func setUp() {
        url = baseUrl + path
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testUrlStringLastPathComponent() {
        let lastPathComponent = url.x_lastPathComponent
        expect(lastPathComponent).to(equal("test.ext"))
    }

    func testUrlStringPathExtension() {
        let pathExtension = url.x_pathExtension
        expect(pathExtension).to(equal("ext"))
    }
    
    func testUrlStringDeletingLastPathComponent() {
        let resultantPath = url.x_deletingLastPathComponent
        expect(resultantPath).to(equal("subdomain.domain.com/test"))
    }
    
    func testUrlStringDeletingPathExtension() {
        let resultantPath = url.x_deletingPathExtension
        expect(resultantPath).to(equal("subdomain.domain.com/test/test"))
    }
    
    func testUrlStringAppendingPathComponent() {
        let path = "newPath.ext"
        let finalUrl = baseUrl.x_appendingPath(component: path)
        expect(finalUrl).to(equal("subdomain.domain.com/newPath.ext"))
    }

}
