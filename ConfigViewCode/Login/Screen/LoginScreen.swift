//
//  LoginScreen.swift
//  ConfigViewCode
//
//  Created by Premiersoft on 16/07/23.
//

import UIKit


protocol LoginScreenProtocol: AnyObject {
    func tappedloginButton( )
}

class LoginScreen: UIView {
    private weak var delegate: LoginScreenProtocol?
    public func delegate(delegate: LoginScreenProtocol?) {
        self.delegate = delegate
    }
    
    lazy var loginLabel: UILabel = {
        let label = UILabel( )
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.text = "Login"
        return label;
        
    }( )
    
    lazy var emailTextField: UITextField = {
        let textField  = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.keyboardType = .emailAddress
        textField.font = UIFont.systemFont(ofSize: 12)
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        textField.autocorrectionType = .no
        textField.textColor = .gray
        textField.placeholder = "Digite seu email"
        
        
        return textField
        
    }( )
    lazy var passwordTextField: UITextField = {
        let textField  = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.keyboardType = .default
        textField.isSecureTextEntry = true
        textField.font = UIFont.systemFont(ofSize: 12)
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        textField.autocorrectionType = .no
        textField.textColor = .gray
        textField.placeholder = "Digite sua senha"
        
        return textField
        
    }( )
    
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Login", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .darkGray.withAlphaComponent(0.6)
        button.isEnabled = false
        button.clipsToBounds = true
        button.layer.cornerRadius = 7.5
     
        button.addTarget(self, action: #selector(tappedLoginButton), for: .touchUpInside)
        
        return button
    }()
    
    @objc func tappedLoginButton(_ sender: UIButton) {
        print("button function")
        delegate?.tappedloginButton()
        
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .gray
        addElementsInView()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElementsInView( ){
        self.addSubview(loginLabel)
        self.addSubview(emailTextField)
        self.addSubview(passwordTextField)
        self.addSubview(loginButton)
    }
    
    private func configConstraints( ){
        NSLayoutConstraint.activate([
            loginLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            loginLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            emailTextField.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant:  20),
            emailTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant:  20),
            emailTextField.trailingAnchor.constraint(equalTo: trailingAnchor,constant:  -20),
            emailTextField.heightAnchor.constraint(equalToConstant: 45),
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant:  20),
            passwordTextField.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
            loginButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -40),
            loginButton.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            loginButton.heightAnchor.constraint(equalTo:emailTextField.heightAnchor)
            
        ])
    }
    
    public func configTextFieldDelegate(delegate: UITextFieldDelegate) {
        emailTextField.delegate = delegate
        passwordTextField.delegate = delegate
    }
}
