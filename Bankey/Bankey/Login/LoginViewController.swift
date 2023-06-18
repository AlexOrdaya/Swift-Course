//
//  ViewController.swift
//  Bankey
//
//  Created by Alex Percy Ordaya Flores on 17/06/23.
//

import UIKit

class LoginViewController: UIViewController {
    
    let loginView = LoginView()
    let button = UIButton()
    let errorLabel = UILabel()
    let titleLabel = UILabel()
    let descriptionLabel = UILabel()
    
    var userName: String? {
       loginView.userNameTextField.text
    }
    
    var password: String? {
        loginView.passwordTextField.text
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }

}

extension LoginViewController {
    
    private func style() {
        loginView.translatesAutoresizingMaskIntoConstraints = false
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configuration = .filled()
        button.configuration?.imagePadding = 8
        button.setTitle("Sign on", for: [])
        button.addTarget(self, action: #selector(tapButton), for: .primaryActionTriggered)
        
        
        errorLabel.translatesAutoresizingMaskIntoConstraints = false
        errorLabel.isHidden = true
        errorLabel.text = "error feature"
        errorLabel.textColor = .red
        errorLabel.numberOfLines = 0
        errorLabel.textAlignment = .center
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Bankey"
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.text = "Your premium source for all things banking!"
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textAlignment = .center
        
    }
    
    private func layout() {
        view.addSubview(titleLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(loginView)
        view.addSubview(button)
        view.addSubview(errorLabel)
        
        // Title
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalToSystemSpacingBelow: titleLabel.bottomAnchor, multiplier: 3),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        // Subtitle
        NSLayoutConstraint.activate([
            loginView.topAnchor.constraint(equalToSystemSpacingBelow: descriptionLabel.bottomAnchor, multiplier: 3),
            descriptionLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
        ])
        
        // LoginView
        NSLayoutConstraint.activate([
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.leftAnchor.constraint(equalToSystemSpacingAfter: view.leftAnchor, multiplier: 3),
            view.rightAnchor.constraint(equalToSystemSpacingAfter: loginView.rightAnchor, multiplier: 3),
        ])
        
        // Button
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
            button.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            button.rightAnchor.constraint(equalTo: loginView.rightAnchor)
        ])
        
        // ErrorLabel
        NSLayoutConstraint.activate([
            errorLabel.topAnchor.constraint(equalToSystemSpacingBelow: button.bottomAnchor, multiplier: 1),
            errorLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            errorLabel.rightAnchor.constraint(equalTo: loginView.rightAnchor)
        ])
        

        
    }
    
}

extension LoginViewController {
    
    @objc func tapButton() {
        errorLabel.isHidden = true
        validationLogin()
    }
    
    private func validationLogin() {
        guard let userName = userName,
              let password = password else { return }
        
        if userName.isEmpty || password.isEmpty {
            getErrorMessage(withMessage: "No Data entry")
            return
        }
        
        if userName == "Alex" && password == "123" {
            button.configuration?.showsActivityIndicator = true
        } else {
            getErrorMessage(withMessage: "User / password incorrect")
        }
    }
    
    private func getErrorMessage(withMessage message: String) {
        errorLabel.isHidden = false
        errorLabel.text = message
    }
    
}

