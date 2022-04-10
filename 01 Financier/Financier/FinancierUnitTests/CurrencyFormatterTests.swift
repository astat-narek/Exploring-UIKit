//
//  CurrencyFormatterTests.swift
//  FinancierUnitTests
//
//  Created by Narek Danielyan on 10.04.2022.
//

import Foundation
 
import XCTest

@testable import Financier

class Test: XCTestCase {
    
    var formatter: CurrencyFormatter!
    
    override func setUp() {
        super.setUp()
        formatter = CurrencyFormatter()
    }
    
    func testBreakDollarsIntoCents() throws {
        let result = formatter.breakIntoDollarsAndCents(929466.23)
        XCTAssertEqual(result.0, "929,466")
        XCTAssertEqual(result.1, "23")
    }
    
    func testDollarsFormatter() throws {
        let result = formatter.dollarsFormatted(929466)
        XCTAssertEqual(result, "929,466.00 $")
    }
    
    func testZeroDollarsFormatted() throws {
        let result = formatter.dollarsFormatted(0)
        XCTAssertEqual(result, "0.00 $")
    }
}
