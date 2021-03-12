//
//  PizzabotPresenter.swift
//  Pizzabot
//
//  Created by Sergey on 11.03.21.
//

import Foundation

class PizzabotPresenter: PizzabotViewPresenter {

    private unowned let view: PizzabotView

    var validator: Validator
    var parser: Parser
    var routeBuilder: RouteBuilder

    required init(view: PizzabotView) {
        self.view = view
        validator = InputStringValidator()
        parser = InputStringParser()
        routeBuilder = XYRouteBuilder()
    }

    func startRouting(inputString: String) {
        do {
            try validator.validateStringFormat(inputString: inputString)
            let result = parser.parse(inputString: inputString)
            try validator.validateBounds(gridSizePoint: result.gridSizePoint,
                                         destinationPoints: result.destinationPoints)
            let output = routeBuilder.buildPath(destinationPoints: result.destinationPoints)
            view.showMessage(title: "Success", message: "Path is \(output)")
        } catch let error as ValidationError {
            view.showMessage(title: "Error", message: error.description)
        } catch {
            view.showMessage(title: "Error", message: error.localizedDescription)
        }
    }
}
