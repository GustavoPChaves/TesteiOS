//
//  LoginViewController.swift
//  Test
//
//  Created by Gustavo Chaves on 29/04/20.
//  Copyright (c) 2020 Gustavo Chaves. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol LoginDisplayLogic: class
{
  func displaySomething(viewModel: Login.Something.ViewModel)
}

class LoginViewController: UIViewController, LoginDisplayLogic
{
  var interactor: LoginBusinessLogic?
  var router: (NSObjectProtocol & LoginRoutingLogic & LoginDataPassing)?

  // MARK: Object lifecycle
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
  {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder)
  {
    super.init(coder: aDecoder)
    setup()
  }
  
  // MARK: Setup
  
  private func setup()
  {
    let viewController = self
    let interactor = LoginInteractor()
    let presenter = LoginPresenter()
    let router = LoginRouter()
    viewController.interactor = interactor
    viewController.router = router
    interactor.presenter = presenter
    presenter.viewController = viewController
    router.viewController = viewController
    router.dataStore = interactor
  }
  
  // MARK: Routing
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?)
  {
    if let scene = segue.identifier {
      let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
      if let router = router, router.responds(to: selector) {
        router.perform(selector, with: segue)
      }
    }
  }
  
  // MARK: View lifecycle
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
    //doLogin()
    setupView()
    
  }
  
  // MARK: Do something
  
  //@IBOutlet weak var nameTextField: UITextField!
    var bankImage: UIImageView!
    var userTextField: UITextField!
    var passwordTextField: UITextField!
    var loginButton: UIButton!
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    func setupView(){
        
        bankImage = UIImageView(image: UIImage(named: "Logo"))
        
        userTextField = UITextField()
        userTextField.placeholder = "User"
        userTextField.autocapitalizationType = .none
        userTextField.borderStyle = .roundedRect

        userTextField.delegate = self
   
        passwordTextField = UITextField()
        passwordTextField.placeholder = "Password"
        passwordTextField.autocapitalizationType = .none
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.isSecureTextEntry = true
        passwordTextField.delegate = self

        loginButton = UIButton()
        loginButton.setTitle("Login", for: .normal)
        loginButton.backgroundColor = UIColor(red: 59/255, green: 72/255, blue: 238/255, alpha: 1)
        loginButton.addTarget(self, action: #selector(doLogin), for: .touchUpInside)
        loginButton.layer.cornerRadius = 4
        
        
        view.addSubview(bankImage)
        view.addSubview(userTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)

        setupConstraints()
    }
    func setupConstraints(){
        bankImage.translatesAutoresizingMaskIntoConstraints = false
        bankImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 56).isActive = true
        bankImage.widthAnchor.constraint(equalToConstant: 125).isActive = true
        bankImage.heightAnchor.constraint(equalToConstant: 70).isActive = true
        bankImage.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        userTextField.translatesAutoresizingMaskIntoConstraints = false
        userTextField.topAnchor.constraint(equalTo: bankImage.bottomAnchor, constant: 110).isActive = true
        userTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        userTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        userTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        userTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.topAnchor.constraint(equalTo: userTextField.bottomAnchor, constant: 20).isActive = true
        passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        
        
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.topAnchor.constraint(greaterThanOrEqualTo: passwordTextField.bottomAnchor).isActive = true
        loginButton.widthAnchor.constraint(equalToConstant: 202).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 62).isActive = true
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        
        loginButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -32).isActive = true
    }
  @objc func doLogin()
  {
    let request = Login.Something.Request(user: userTextField.text!, password: passwordTextField.text!)
    interactor?.doSomething(request: request)
  }
    //(user: "test_user", password: "Test@1")
  
  func displaySomething(viewModel: Login.Something.ViewModel)
  {
    //nameTextField.text = viewModel.name
    router?.routeToStatements(segue: nil)
  }
}

extension LoginViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField == userTextField{
            guard let text = textField.text, !text.isEmpty else { return }
            if text.first?.isNumber ?? false{
                textField.text = String.cpfMask(text: text)
            }
        }
    }
}

