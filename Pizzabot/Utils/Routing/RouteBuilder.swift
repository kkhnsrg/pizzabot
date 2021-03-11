//
//  RouteBuilder.swift
//  Pizzabot
//
//  Created by Sergey on 10.03.21.
//

import Foundation

protocol RouteBuilder {
    
    var startPoint: Point { get }
    
    /// Building path from start point to destination points
    /// - Parameter destinationPoints: array of destination points
    func buildPath(destinationPoints: [Point]) -> String
}
