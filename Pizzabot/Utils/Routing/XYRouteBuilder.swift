//
//  XYRouteBuilder.swift
//  Pizzabot
//
//  Created by Sergey on 11.03.21.
//

import Foundation

struct XYRouteBuilder: RouteBuilder {

    var startPoint: Point {
        Point(x: 0, y: 0)
    }

    func buildPath(destinationPoints: [Point]) -> String {

        let points = [startPoint] + destinationPoints

        let lines = stride(from: 0, to: points.count - 1, by: 1).map {
            (startPoint: points[$0], endPoint: points[$0 + 1])
        }

        let output = lines
            .flatMap { pair -> [BotCommand] in

                let xDifference = pair.endPoint.x - pair.startPoint.x
                let yDiffference = pair.endPoint.y - pair.startPoint.y

                let horizontalPath = Array(repeating: xDifference > 0
                                                        ? BotCommand.moveEast
                                                        : BotCommand.moveWest,
                                                count: abs(xDifference))
                let verticalPath = Array(repeating: yDiffference > 0
                                                    ? BotCommand.moveNorth
                                                    : BotCommand.moveSouth,
                                              count: abs(yDiffference))

                return [horizontalPath, verticalPath, [BotCommand.dropPizza]].reduce([], +)
            }
            .map { $0.rawValue }
            .joined()

        return output
    }
}
