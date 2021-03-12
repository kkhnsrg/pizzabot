//
//  PizzabotParserTests.swift
//  PizzabotTests
//
//  Created by Sergey on 11.03.21.
//

import XCTest
@testable import Pizzabot

class PizzabotParserTests: XCTestCase {

    var parser: Parser!

    override func setUpWithError() throws {
        parser = InputStringParser()
    }

    override func tearDownWithError() throws {
        parser = nil
    }

    func testPositiveChallengeParsing() throws {
        let actualResult = parser.parse(inputString: PizzabotTestsDataSource.ChallengeData.inputString)

        let expectedGridSizePoint = PizzabotTestsDataSource.ChallengeData.gridSizePoint
        let expectedDestinationPoints = PizzabotTestsDataSource.ChallengeData.destinationPoints

        XCTAssertEqual(actualResult.gridSizePoint, expectedGridSizePoint)
        XCTAssertEqual(actualResult.destinationPoints, expectedDestinationPoints)
    }

    func testPositiveExampleParsing() throws {
        let actualResult = parser.parse(inputString: PizzabotTestsDataSource.ExampleData.inputString)

        let expectedGridSizePoint = PizzabotTestsDataSource.ExampleData.gridSizePoint
        let expectedDestinationPoints = PizzabotTestsDataSource.ExampleData.destinationPoints

        XCTAssertEqual(actualResult.gridSizePoint, expectedGridSizePoint)
        XCTAssertEqual(actualResult.destinationPoints, expectedDestinationPoints)
    }

}
