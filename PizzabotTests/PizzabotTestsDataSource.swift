//
//  PizzabotTestsDataSource.swift
//  PizzabotTests
//
//  Created by Sergey on 11.03.21.
//

import XCTest
@testable import Pizzabot

struct PizzabotTestsDataSource {

    private init() {}

    enum ChallengeData {
        static let inputString = "5x5 (0, 0) (1, 3) (4,4) (4, 2) (4, 2) (0, 1) (3, 2) (2, 3) (4, 1)"
        static let outputString = "DENNNDEEENDSSDDWWWWSDEEENDWNDEESSD"

        static let gridSizePoint = Point(x: 5, y: 5)
        static let destinationPoints = [
            Point(x: 0, y: 0),
            Point(x: 1, y: 3),
            Point(x: 4, y: 4),
            Point(x: 4, y: 2),
            Point(x: 4, y: 2),
            Point(x: 0, y: 1),
            Point(x: 3, y: 2),
            Point(x: 2, y: 3),
            Point(x: 4, y: 1)
        ]
    }

    enum ExampleData {
        static let inputString = "5x5 (1, 3) (4, 4)"
        static let outputString = "ENNNDEEEND"
        static let invalidInputString = "5e5 [k, 3) (4. 04)"

        static let gridSizePoint = Point(x: 5, y: 5)
        static let destinationPoints = [Point(x: 1, y: 3), Point(x: 4, y: 4)]
        static let invalidDestinationPoints = [Point(x: 21, y: 3), Point(x: 4, y: 20)]
    }
}
