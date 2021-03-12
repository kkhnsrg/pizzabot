//
//  Parser.swift
//  Pizzabot
//
//  Created by Sergey on 10.03.21.
//

import Foundation

protocol Parser {

    /// Input string parsing into upper right grid point and destination points array
    /// - Parameter inputString: entered string
    func parse(inputString: String) throws -> (gridSizePoint: Point, destinationPoints: [Point])

}
