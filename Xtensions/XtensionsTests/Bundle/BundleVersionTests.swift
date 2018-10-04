//
//  BundleVersionTests.swift
//  XtensionsTests
//
//  Created by Luis Cardenas on 04/10/2018.
//  Copyright © 2018 Thxou. All rights reserved.
//

import XCTest
import Nimble
@testable import Xtensions

class BundleVersionTests: XCTestCase {
    
    let projectVersion = "1.0.0"
    let projectBuild = "1"
    let bundleIdentifier = "com.thxou.xtensions"
    

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInfoDictionaryWithKey() {
        let key = "CFBundleShortVersionString"
        let shortVersion = Bundle.main.x_info(for: key)
        expect(shortVersion).to(equal(projectVersion))
    }
    
    func testProjectBuild() {
        let build = Bundle.main.x_build()
        expect(build).to(equal(projectBuild))
    }
    
    func testProjectVersion() {
        let version = Bundle.main.x_version()
        expect(version).to(equal(projectVersion))
    }
    
    func testProjectBundleIdentifier() {
        let bundleIdentifier = Bundle.main.x_name()
        expect(bundleIdentifier).to(equal(bundleIdentifier))
    }

}
