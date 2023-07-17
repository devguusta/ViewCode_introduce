//
//  ViewController.swift
//  ConfigViewCode
//
//  Created by Premiersoft on 14/07/23.
//

import UIKit

class LoginViewController: UIViewController {
    var loginScreen: LoginScreen?
    
    override func loadView() {
        loginScreen = LoginScreen( )
        view = loginScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginScreen?.delegate(delegate: self)
        loginScreen?.configTextFieldDelegate(delegate: self)
    }
}

extension LoginViewController: LoginScreenProtocol {
    func tappedloginButton() {
        if loginScreen!.loginButton.isEnabled{
            let homeController: HomeViewController = HomeViewController()
            //Caso queira que a vc seja uma UINavigationController
            //let nav = UINavigationController(rootViewController: vc)
          //  present(homeController, animated: true)
            navigationController?.pushViewController(homeController, animated: true)
        }
       print("chegou na view controller")
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print(#function)
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        print(#function)
        let email: String = loginScreen?.emailTextField.text ?? ""
        let password: String = loginScreen?.passwordTextField.text ?? ""
        if email.isEmpty || password.isEmpty {
            print("Botao desabilitado")
            loginScreen?.loginButton.backgroundColor = .darkGray.withAlphaComponent(0.4)
            loginScreen?.loginButton.isEnabled = false
        
        } else {
            loginScreen?.loginButton.backgroundColor = .darkGray
            loginScreen?.loginButton.isEnabled = true
            print("botao habilitado")
        }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(#function)
        textField.resignFirstResponder()
        return false
    }
}

