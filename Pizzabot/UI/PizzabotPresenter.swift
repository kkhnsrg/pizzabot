//
//  PizzabotPresenter.swift
//  Pizzabot
//
//  Created by Sergey on 11.03.21.
//

import Foundation

// MARK: - Presenter protocol
protocol PizzabotPresenterProtocol {

    init(view: PizzabotViewProtocol)

    /// Start build route path process
    /// - Parameter inputString: entered string
    func startRouting(inputString: String)
}

class PizzabotPresenter: PizzabotPresenterProtocol {

    private unowned let view: PizzabotViewProtocol

    var validator: Validator
    var parser: Parser
    var routeBuilder: RouteBuilder

    required init(view: PizzabotViewProtocol) {
        self.view = view
        validator = InputStringValidator()
        parser = InputStringParser()
        routeBuilder = XYRouteBuilder()
    }

    func startRouting(inputString: String) {
        do {
            try validator.validateStringFormat(inputString: inputString)
            let result = try parser.parse(inputString: inputString)
            try validator.validateBounds(gridSizePoint: result.gridSizePoint,
                                         destinationPoints: result.destinationPoints)
            let output = routeBuilder.buildPath(destinationPoints: result.destinationPoints)
            view.showMessage(title: "Success", message: "Path is \(output)")
        } catch let error as ValidationError {
            view.showMessage(title: "Validation error", message: error.description)
        } catch let error as ParsingError {
            view.showMessage(title: "Parsing error", message: error.description)
        } catch {
            view.showMessage(title: "Error", message: error.localizedDescription)
        }
    }
}
