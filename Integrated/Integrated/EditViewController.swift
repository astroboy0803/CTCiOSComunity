//
//  EditViewController.swift
//  Integrated
//
//  Created by i9400506 on 2022/1/11.
//

import UIKit

protocol EditDelegate: AnyObject {
    func update(user: User)
}

class EditViewController: UIViewController {
    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var emailTextField: UITextField!
    @IBOutlet private var phoneField: UITextField!
    @IBOutlet private var companyTextField: UITextField!
    
    weak var editDelegate: EditDelegate?
    
    private var user: User!
    
    init(user: User, delegate: EditDelegate? = nil) {
        self.user = user
        self.editDelegate = delegate
        super.init(nibName: "EditViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupEvent()
    }
    
    private func setup() {
        self.nameLabel.text = user.name
        self.phoneField.text = user.phone
        self.emailTextField.text = user.email
        self.companyTextField.text = user.company.name
    }

    private func setupEvent() {
        self.emailTextField.delegate = self
        self.phoneField.delegate = self
        self.companyTextField.delegate = self
    }
}

extension EditViewController: UITextFieldDelegate {
    final func textFieldDidChangeSelection(_ textField: UITextField) {
        let text = textField.text ?? ""
        if textField === phoneField {
            user.phone = text
        } else if textField === emailTextField {
            user.email = text
        } else if textField === companyTextField {
            user.company.name = text
        }
        self.editDelegate?.update(user: user)
    }
}
