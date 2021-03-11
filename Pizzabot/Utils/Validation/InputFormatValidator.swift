//
//  InputFormatValidator.swift
//  Pizzabot
//
//  Created by Sergey on 11.03.21.
//

import Foundation

struct InputStringValidator: Validator {
    
    static let DIGIT_PATTERN = "([1-9][0-9]*|0)"
    static let FORMAT_PATTERN = "\(DIGIT_PATTERN)x\(DIGIT_PATTERN)(\\s\\(\(DIGIT_PATTERN),\\s?\(DIGIT_PATTERN)\\))+"
    
    func validateStringFormat(inputString: String) throws {
        
        guard !inputString.isEmpty else {
            throw ValidationError.empty
        }
        
        let stringPredicate = NSPredicate(format: "SELF MATCHES %@", InputStringValidator.FORMAT_PATTERN)
        guard stringPredicate.evaluate(with: inputString) else {
            throw ValidationError.invalidInput
        }
        
    }
        
    func validateBounds(gridSizePoint: Point, destinationPoints: [Point]) throws {
        
        guard destinationPoints
                .filter({ point in point.x > gridSizePoint.x || point.y > gridSizePoint.y })
                .isEmpty else {
            throw ValidationError.pointOutOfBounds
        }
    }
    
}
