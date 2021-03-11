//
//  BotCommand.swift
//  Pizzabot
//
//  Created by Sergey on 10.03.21.
//

import Foundation

/// Enum with possible bot action commands
enum BotCommand: String {
    case moveNorth = "N"
    case moveSouth = "S"
    case moveEast = "E"
    case moveWest = "W"
    case dropPizza = "D"
}
