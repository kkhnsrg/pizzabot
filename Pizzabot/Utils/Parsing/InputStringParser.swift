//
//  InputParser.swift
//  Pizzabot
//
//  Created by Sergey on 11.03.21.
//

import Foundation

struct InputStringParser: Parser {

    func parse(inputString: String) -> (gridSizePoint: Point, destinationPoints: [Point]) {

        let parseToPoint = { (pointString: Substring) -> Point in
            let pointValues = pointString.split(separator: ",").map { Int($0)! }
            return Point(x: pointValues[0], y: pointValues[1])
        }

        let splittedString = inputString
            .replacingOccurrences(of: "x", with: ",")
            .filter { $0 != ")" && $0 != " " }
            .split(separator: "(")

        let gridSizePoint = parseToPoint(splittedString.first!)

        let destinationPoints = splittedString.dropFirst().map { parseToPoint($0) }

        return (gridSizePoint, destinationPoints)
    }
}
