//
//  PizzabotViewController.swift
//  Pizzabot
//
//  Created by Sergey on 10.03.21.
//

import UIKit

class PizzabotViewController: UIViewController {

    @IBOutlet private var inputTextField: UITextField!

    private var presenter: PizzabotViewPresenter!

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
        guard let inputString = inputTextField.text else { return }
//        let inputString = inputTextField.text!
        presenter.startRouting(inputString: inputString)
    }
}

// MARK: - View contract
extension PizzabotViewController: PizzabotView {

    func configure(presenter: PizzabotViewPresenter) {
        self.presenter = presenter
    }

    func showMessage(title: String, message: String) {
        messageAlert.title = title
        messageAlert.message = message
        show(messageAlert, sender: self)
    }

}
