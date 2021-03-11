//
//  PizzabotRouteBuilderTests.swift
//  PizzabotTests
//
//  Created by Sergey on 11.03.21.
//

import XCTest
@testable import Pizzabot

class PizzabotRouteBuilderTests: XCTestCase {

    var routeBuilder: RouteBuilder!

    override func setUpWithError() throws {
        routeBuilder = XYRouteBuilder()
    }

    override func tearDownWithError() throws {
        super.tearDown()
    }

    func testPositiveChallengeRouteBuilding() throws {
        let actualResult = routeBuilder.buildPath(destinationPoints: PizzabotTestsDataSource.ChallengeData.destinationPoints)
        
        let expectedOutput = PizzabotTestsDataSource.ChallengeData.outputString
        
        XCTAssertEqual(actualResult, expectedOutput)
    }
    
    func testPositiveExampleRouteBuilding() throws {
        let actualResult = routeBuilder.buildPath(destinationPoints: PizzabotTestsDataSource.ExampleData.destinationPoints)
        
        let expectedOutput = PizzabotTestsDataSource.ExampleData.outputString
        
        XCTAssertEqual(actualResult, expectedOutput)
    }

}
