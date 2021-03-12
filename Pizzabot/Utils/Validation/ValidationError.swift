//
//  ValidationError.swift
//  Pizzabot
//
//  Created by Sergey on 10.03.21.
//

import Foundation

/// Possible validation errors
enum ValidationError: Error {
    case empty
    case invalidInput
    case pointOutOfBounds

    var description: String {
        switch self {
        case .empty:
            return "Empty input"
        case .invalidInput:
            return "Invalid input"
        case .pointOutOfBounds:
            return "One of points out of grid bounds"
        }
    }
}
