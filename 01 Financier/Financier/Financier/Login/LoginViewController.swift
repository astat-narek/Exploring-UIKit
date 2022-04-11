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

    let titleLabel = UILabel()
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
    
    //animation
    var topInitialPosition: CGFloat = -160
    var topFinalPosition: CGFloat = -135
    
    var subtitleTopInitialPosition: CGFloat = 20
    var subtitleTopFinalPosition: CGFloat = 16
    
    var titleTopAnchor: NSLayoutConstraint?
    var subTitleTopAnchor: NSLayoutConstraint?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        layout()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animate()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        signInButton.configuration?.showsActivityIndicator = false
    }
}

extension LoginViewController {
    private func style() {
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textAlignment = .center
        titleLabel.text = "Financier"
        titleLabel.font = UIFont.preferredFont(forTextStyle: .title1).withSize(35)
        titleLabel.alpha = 0
        
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.textAlignment = .center
        subtitleLabel.numberOfLines = 0
        subtitleLabel.text = "Your premium source for all things banking!"
        subtitleLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        subtitleLabel.alpha = 0
        
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
        view.addSubview(titleLabel)
        view.addSubview(subtitleLabel)
        view.addSubview(loginView)
        view.addSubview(signInButton)
        view.addSubview(errorMessageLabel)
        
        // Loging View
        NSLayoutConstraint.activate([
        // Title
            titleLabel.centerXAnchor.constraint(equalTo: loginView.centerXAnchor),
            titleLabel.widthAnchor.constraint(equalTo: loginView.widthAnchor),
            
            
        // Subtitle
            subtitleLabel.centerXAnchor.constraint(equalTo: titleLabel.centerXAnchor),
            subtitleLabel.widthAnchor.constraint(equalTo: titleLabel.widthAnchor)
            ])
          
        titleTopAnchor = titleLabel.topAnchor.constraint(equalTo: loginView.topAnchor, constant: topInitialPosition)
        titleTopAnchor?.isActive = true
        
        subTitleTopAnchor = subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: subtitleTopInitialPosition)
        subTitleTopAnchor?.isActive = true
        
        
        // Login fields
        NSLayoutConstraint.activate([
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 2),
        
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
        
        delegate?.didLogin()
        login()
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
        
        if username == "Admin" && password == "123" {
            signInButton.configuration?.showsActivityIndicator = true
            errorMessageLabel.isHidden = true
            delegate?.didLogin()
        } else {
            configureView(withMessage: "Incorrect username / password")
        }
    }
    
    private func configureView(withMessage message: String) {
        errorMessageLabel.isHidden = false
        errorMessageLabel.text = message
        shakeButton()
    }
    
    private func shakeButton() {
        let animation = CAKeyframeAnimation()
        animation.keyPath = "position.x"
        animation.values = [0, 10, -10, 10, 0]
        animation.keyTimes = [0,0.16, 0.5, 0.83, 1]
        animation.duration = 0.33
        
        animation.isAdditive = true
        signInButton.layer.add(animation, forKey: "shake")
    }
}

// MARK: - Animations

extension LoginViewController {
    private func animate() {
        let animator1 = UIViewPropertyAnimator(duration: 0.5, curve: .easeInOut) {
            self.titleTopAnchor?.constant = self.topFinalPosition
            self.titleLabel.alpha = 1
            self.view.layoutIfNeeded()
        }
        animator1.startAnimation()
        
        let animator2 = UIViewPropertyAnimator(duration: 0.5, curve: .easeInOut) {
            self.subTitleTopAnchor?.constant = self.subtitleTopFinalPosition
            self.subtitleLabel.alpha = 1
            self.view.layoutIfNeeded()
        }
        animator2.startAnimation(afterDelay: 0.1)
    }
}
