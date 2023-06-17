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
    }
    
    private func layout() {
        view.addSubview(loginView)
        view.addSubview(button)
        
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
    }
    
}

extension LoginViewController {
    
    @objc func tapButton() {
        
    }
    
}

