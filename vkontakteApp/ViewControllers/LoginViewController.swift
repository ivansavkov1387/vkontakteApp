//
//  ViewController.swift
//  vkontakteApp
//
//  Created by Иван on 11/19/21.
//

import UIKit

class LoginViewController: UIViewController {
    
    private let vkontakteLabel: UILabel = {
        let label = UILabel()
        label.text = "VK"
        label.font = UIFont.init(name: "HelveticaNeue-Bold", size: 54)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var loginTF: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Enter login"
        textfield.borderStyle = .roundedRect
        textfield.layer.cornerRadius = 10
        textfield.delegate = self
        textfield.translatesAutoresizingMaskIntoConstraints = false
        
        return textfield
    }()
    
    private lazy var passwordTF: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Enter password"
        textfield.borderStyle = .roundedRect
        textfield.layer.cornerRadius = 10
        textfield.delegate = self
        textfield.translatesAutoresizingMaskIntoConstraints = false
        
        return textfield
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitleColor(#colorLiteral(red: 0.0007253905642, green: 0.4668268561, blue: 0.9992229342, alpha: 1), for: .normal)
        button.setTitle("Login", for: .normal)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(loginPressed), for: .touchUpInside)
        
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addingSubviews()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)

    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        layout()
    }
    
    @objc private func loginPressed() {
        let tabBarVC = TabBarController()
        tabBarVC.modalPresentationStyle = .fullScreen
        present(tabBarVC, animated: true, completion: nil)
    }
    
        
}

extension LoginViewController {
    
    private func addingSubviews() {
        view.backgroundColor = #colorLiteral(red: 0.0007253905642, green: 0.4668268561, blue: 0.9992229342, alpha: 1)
        view.addSubview(vkontakteLabel)
        view.addSubview(loginTF)
        view.addSubview(passwordTF)
        view.addSubview(loginButton)
    }
    
    private func layout() {
        
        vkontakteLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -110).isActive = true
        vkontakteLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        loginTF.topAnchor.constraint(equalTo: vkontakteLabel.bottomAnchor, constant: 20).isActive = true
        loginTF.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginTF.widthAnchor.constraint(equalToConstant: view.frame.width - 100).isActive = true
        
        passwordTF.topAnchor.constraint(equalTo: loginTF.bottomAnchor, constant: 20).isActive = true
        passwordTF.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        passwordTF.widthAnchor.constraint(equalToConstant: view.frame.width - 100).isActive = true
        
        loginButton.topAnchor.constraint(equalTo: passwordTF.bottomAnchor, constant: 50).isActive = true
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginButton.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor, constant: -20).isActive = true
        loginButton.widthAnchor.constraint(equalToConstant: view.frame.width - 100).isActive = true
        loginButton.heightAnchor.constraint(equalTo: passwordTF.heightAnchor, multiplier: 1.5).isActive = true
        
    }
}

extension LoginViewController: UITextFieldDelegate {
    
    internal func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if loginTF.isFirstResponder {
            passwordTF.becomeFirstResponder()
        } else {
            passwordTF.resignFirstResponder()
        }
        return true
    }
}

extension LoginViewController {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @objc private func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height/2
            }
        }
    }
    
    @objc private func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
}


