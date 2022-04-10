//
//  LoginViewController.swift
//  Financier
//
//  Created by Narek Danielyan on 06.04.2022.
//

import UIKit

protocol LogoutDelegate: AnyObject {
    func didLogout() 
}

protocol LoginViewControllerDelegate: AnyObject {
    func didLogin()
}

class LoginViewController: UIViewController {

    let financierLabel = UILabel()
    let subtitleLabel = UILabel()
    
    let loginView = LoginView()
    let signInButton = UIButton(type: .system)
    let errorMessageLabel = UILabel()
    
    weak var delegate: LoginViewControllerDelegate?
    
    var username: String? {
        return loginView.usernameTextField.text
    }
    
    var password: String? {
        return loginView.passwordTextField.text
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        layout()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        signInButton.configuration?.showsActivityIndicator = false
    }
}

extension LoginViewController {
    private func style() {
        
        financierLabel.translatesAutoresizingMaskIntoConstraints = false
        financierLabel.textAlignment = .center
        financierLabel.text = "Financier"
        financierLabel.font = UIFont.preferredFont(forTextStyle: .title1).withSize(35)
        
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.textAlignment = .center
        subtitleLabel.numberOfLines = 0
        subtitleLabel.text = "Your premium source for all things banking!"
        subtitleLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        
        loginView.translatesAutoresizingMaskIntoConstraints = false
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.configuration = .filled()
        signInButton.configuration?.imagePadding = 8 // for indicator spacing
        signInButton.setTitle("Sign in", for: .normal)
        signInButton.addTarget(self, action: #selector(signinTapped), for: .primaryActionTriggered)
        
        errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        errorMessageLabel.textAlignment = .center
        errorMessageLabel.textColor = .systemRed
        errorMessageLabel.numberOfLines = 0
        errorMessageLabel.text = "Error failure"
        errorMessageLabel.isHidden = true
    }
    
    private func layout() {
        view.addSubview(financierLabel)
        view.addSubview(subtitleLabel)
        view.addSubview(loginView)
        view.addSubview(signInButton)
        view.addSubview(errorMessageLabel)
        
        // Loging View
        NSLayoutConstraint.activate([
        // Title
            financierLabel.topAnchor.constraint(equalTo: loginView.topAnchor, constant: -130),
            financierLabel.centerXAnchor.constraint(equalTo: loginView.centerXAnchor),
            financierLabel.widthAnchor.constraint(equalTo: loginView.widthAnchor),
            
        // Sub title
            subtitleLabel.topAnchor.constraint(equalToSystemSpacingBelow: financierLabel.bottomAnchor, multiplier: 2),
            subtitleLabel.centerXAnchor.constraint(equalTo: financierLabel.centerXAnchor),
            subtitleLabel.widthAnchor.constraint(equalTo: financierLabel.widthAnchor),
            
        // Login fields
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1),
        
        // Button
            signInButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
            signInButton.centerXAnchor.constraint(equalTo: loginView.centerXAnchor),
            signInButton.widthAnchor.constraint(equalTo: loginView.widthAnchor),
        
        // Error label
        
            errorMessageLabel.topAnchor.constraint(equalToSystemSpacingBelow: signInButton.bottomAnchor, multiplier: 2),
            errorMessageLabel.centerXAnchor.constraint(equalTo: loginView.centerXAnchor),
            errorMessageLabel.widthAnchor.constraint(equalTo: loginView.widthAnchor)
        ])
    }
}


// MARK: - Action
extension LoginViewController {
    @objc func signinTapped(sender: UIButton) {
        errorMessageLabel.isHidden = true
        signInButton.configuration?.showsActivityIndicator = false
        
        // REMOVE
        delegate?.didLogin()
//        login()
    }
    
    private func login() {
        guard let username = username, let password = password else {
            assertionFailure("Username / password should never be nil")
            return
        }
        
        if username.isEmpty || password.isEmpty {
            configureView(withMessage: "Username / password cannot be blank")
            return
        }
        
        if username == "Narek" && password == "123" {
            signInButton.configuration?.showsActivityIndicator = true
            delegate?.didLogin()
        } else {
            configureView(withMessage: "Incorrect username / password")
        }
    }
    
    private func configureView(withMessage message: String) {
        errorMessageLabel.isHidden = false
        errorMessageLabel.text = message
    }
}
