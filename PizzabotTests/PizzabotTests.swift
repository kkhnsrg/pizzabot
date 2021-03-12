//
//  PizzabotTests.swift
//  PizzabotTests
//
//  Created by Sergey on 10.03.21.
//

import XCTest
@testable import Pizzabot

class PizzabotTests: XCTestCase {

    var validator: Validator!
    var parser: Parser!
    var router: RouteBuilder!

    override func setUpWithError() throws {
        validator = InputStringValidator()
        parser = InputStringParser()
        router = XYRouteBuilder()
    }

    override func tearDownWithError() throws {
        validator = nil
        parser = nil
        router = nil
    }

    func testChallengeComplete() throws {

        let inputString = PizzabotTestsDataSource.ChallengeData.inputString

        try validator.validateStringFormat(inputString: inputString)
        let result = parser.parse(inputString: inputString)
        try validator.validateBounds(gridSizePoint: result.gridSizePoint, destinationPoints: result.destinationPoints)
        let output = router.buildPath(destinationPoints: result.destinationPoints)

        XCTAssertEqual(output, PizzabotTestsDataSource.ChallengeData.outputString)
    }

    func testChallengeExample() throws {

        let inputString = PizzabotTestsDataSource.ExampleData.inputString

        try validator.validateStringFormat(inputString: inputString)
        let result = parser.parse(inputString: inputString)
        try validator.validateBounds(gridSizePoint: result.gridSizePoint, destinationPoints: result.destinationPoints)
        let output = router.buildPath(destinationPoints: result.destinationPoints)

        XCTAssertEqual(output, PizzabotTestsDataSource.ExampleData.outputString)
    }

}
