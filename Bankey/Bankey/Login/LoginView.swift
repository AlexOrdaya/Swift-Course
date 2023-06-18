//
//  LoginView.swift
//  Bankey
//
//  Created by Alex Percy Ordaya Flores on 17/06/23.
//

import UIKit

final class LoginView: UIView {
    
    let stackView = UIStackView()
    let userNameTextField = UITextField()
    let passwordTextField = UITextField()
    let separatorView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
     
}

extension LoginView {
    
    func style() {
        backgroundColor = .secondarySystemBackground
        layer.cornerRadius = 5
        clipsToBounds = true
        separatorView.backgroundColor = .secondarySystemFill
        translatesAutoresizingMaskIntoConstraints = false
        
        userNameTextField.placeholder = "user name"
        passwordTextField.placeholder = "password"
        passwordTextField.isSecureTextEntry = true
        userNameTextField.delegate = self
        passwordTextField.delegate = self
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        
    }
    
    func layout() {
        addSubview(stackView)
        stackView.addArrangedSubview(userNameTextField)
        stackView.addArrangedSubview(separatorView)
        stackView.addArrangedSubview(passwordTextField)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            rightAnchor.constraint(equalToSystemSpacingAfter: stackView.rightAnchor, multiplier: 1),
            bottomAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 1)
        ])
        separatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
}

extension LoginView: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        userNameTextField.endEditing(true)
        passwordTextField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
    }
    
}
