//
//  PizzabotViewController.swift
//  Pizzabot
//
//  Created by Sergey on 10.03.21.
//

import UIKit

// MARK: - View protocol
protocol PizzabotViewProtocol: AnyObject {

    /// View configuration method for setting up
    /// - Parameter presenter: presenter for current view
    func configure(presenter: PizzabotPresenterProtocol)

    /// Showing message method
    /// - Parameters:
    ///   - title: title of the message
    ///   - message: message text
    func showMessage(title: String, message: String)
}

class PizzabotViewController: UIViewController {

    @IBOutlet private var inputTextField: UITextField!

    private var presenter: PizzabotPresenterProtocol!

    let messageAlert: UIAlertController = {
        let alert = UIAlertController(title: "", message: "", preferredStyle: .alert)
        let closeAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(closeAction)
        return alert
    }()

    override func viewDidLoad() {
        configure(presenter: PizzabotPresenter(view: self))
        super.viewDidLoad()
    }

    @IBAction private func startRouting(_ sender: Any) {
        let inputString = inputTextField.text ?? ""
        presenter.startRouting(inputString: inputString)
    }
}

// MARK: - View contract
extension PizzabotViewController: PizzabotViewProtocol {

    func configure(presenter: PizzabotPresenterProtocol) {
        self.presenter = presenter
    }

    func showMessage(title: String, message: String) {
        messageAlert.title = title
        messageAlert.message = message
        show(messageAlert, sender: self)
    }

}
