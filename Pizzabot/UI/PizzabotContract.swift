//
//  PizzabotContract.swift
//  Pizzabot
//
//  Created by Sergey on 11.03.21.
//

import Foundation

import Foundation

//MARK: - View contract
protocol PizzabotView: AnyObject {
    
    /// View configuration method for setting up
    /// - Parameter presenter: presenter for current view
    func configure(presenter: PizzabotViewPresenter)
    
    /// Showing message method
    /// - Parameters:
    ///   - title: title of the message
    ///   - message: message text
    func showMessage(title: String, message: String)
}

//MARK: - Presenter contract
protocol PizzabotViewPresenter {
    
    init(view: PizzabotView)
    
    /// Start build route path process
    /// - Parameter inputString: entered string
    func startRouting(inputString: String)
}
