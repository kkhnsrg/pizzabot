//
//  InputStringValidator.swift
//  Pizzabot
//
//  Created by Sergey on 11.03.21.
//

import Foundation

struct InputStringValidator: Validator {

    enum Patterns {
      static let digitPattern = "([1-9][0-9]*|0)"
      static let formatPattern = "\(digitPattern)x\(digitPattern)(\\s\\(\(digitPattern),\\s?\(digitPattern)\\))+"
    }

    func validateStringFormat(inputString: String) throws {

        guard !inputString.isEmpty else {
            throw ValidationError.empty
        }

        let stringPredicate = NSPredicate(format: "SELF MATCHES %@", InputStringValidator.Patterns.formatPattern)
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
