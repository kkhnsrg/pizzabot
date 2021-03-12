//
//  InputStringParser.swift
//  Pizzabot
//
//  Created by Sergey on 11.03.21.
//

import Foundation

struct InputStringParser: Parser {

    func parse(inputString: String) throws -> (gridSizePoint: Point, destinationPoints: [Point]) {

        let splittedString = inputString
            .replacingOccurrences(of: "x", with: ",")
            .filter { $0 != ")" && $0 != " " }
            .split(separator: "(")

        guard let gridSizeString = splittedString.first else {
            throw ParsingError.empty
        }

        guard let gridSizePoint = parseToPoint(gridSizeString) else {
            throw ParsingError.invalidSizePointString
        }

        let destinationPoints = splittedString
            .dropFirst()
            .compactMap { parseToPoint($0) }

        guard destinationPoints.count == splittedString.count - 1 else {
            throw ParsingError.invalidPointString
        }

        return (gridSizePoint, destinationPoints)
    }

    private func parseToPoint(_ pointString: Substring) -> Point? {

        let pointValues = pointString
            .split(separator: ",")
            .map { Int($0) }

        guard let xValue = pointValues[0], let yValue = pointValues[1] else {
            return nil
        }

        return Point(x: xValue, y: yValue)
    }
}
