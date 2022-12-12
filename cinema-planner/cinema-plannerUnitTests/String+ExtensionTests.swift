//
//  String+ExtensionTests.swift
//  cinema-plannerUnitTests
//
//  Created by Mpilo Pillz on 2022/12/12.
//

import XCTest

extension String {
    func capitalizeFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}

final class String_ExtensionTests: XCTestCase {
    var string: String!
    
    override func setUp() {
        super.setUp()
        string = String()
    }
    
    func testCapitalizeFirstLetter() throws {
        let lowercaseResult = "lowercase".capitalizeFirstLetter()
        let uppercaseResult = "UPPERCASE".capitalizeFirstLetter()
        
        XCTAssertEqual(lowercaseResult, "Lowercase")
        XCTAssertEqual(uppercaseResult, "Uppercase")
    }
}
