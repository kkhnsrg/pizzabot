//
//  PizzabotValidatiorTests.swift
//  PizzabotTests
//
//  Created by Sergey on 11.03.21.
//

import XCTest
@testable import Pizzabot

class PizzabotValidatiorTests: XCTestCase {
    
    var validator : Validator?
    
    override func setUpWithError() throws {
        super.setUp()
        validator = InputStringValidator()
    }

    override func tearDownWithError() throws {
        super.tearDown()
    }

    func testPositiveStringValidation() throws {
        XCTAssertNoThrow(try validator?.validateStringFormat(inputString: PizzabotTestsDataSource.ExampleData.inputString))
    }
    
    func testNegativeStringValidation() throws {
        XCTAssertThrowsError(try validator?.validateStringFormat(inputString: PizzabotTestsDataSource.ExampleData.invalidInputString))
    }
    
    func testPositiveOutOfBoundsValidation() throws {
        XCTAssertNoThrow(try validator?.validateBounds(gridSizePoint: PizzabotTestsDataSource.ExampleData.gridSizePoint, destinationPoints: PizzabotTestsDataSource.ExampleData.destinationPoints))
    }
    
    func testNegativeOutOfBoundsValidation() throws {
        XCTAssertThrowsError(try validator?.validateBounds(gridSizePoint: PizzabotTestsDataSource.ExampleData.gridSizePoint, destinationPoints: PizzabotTestsDataSource.ExampleData.invalidDestinationPoints))
    }

}
