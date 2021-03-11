//
//  Validator.swift
//  Pizzabot
//
//  Created by Sergey on 10.03.21.
//

import Foundation

protocol Validator {
    
    /// Checking whether the input matches the specified format
    /// - Parameter inputString: entered string
    func validateStringFormat(inputString: String) throws
    
    /// Checking the occurrence of points in the grid area
    /// - Parameters:
    ///   - gridSizePoint: upper right point of the grid
    ///   - destinationPoints: array of destination points
    func validateBounds(gridSizePoint: Point, destinationPoints: [Point]) throws
    
}
