//
//  ParsingError.swift
//  Pizzabot
//
//  Created by Sergey on 12.03.21.
//

import Foundation

/// Possible parsing errors
enum ParsingError: Error {
    case empty
    case invalidSizePointString
    case invalidPointString

    var description: String {
        switch self {
        case .empty:
            return "Empty input"
        case .invalidSizePointString:
            return "Invalid grid size point string"
        case .invalidPointString:
            return "Invalid point string"
        }
    }
}
