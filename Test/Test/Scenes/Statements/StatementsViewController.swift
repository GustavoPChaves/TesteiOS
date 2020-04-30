//
//  StatementsViewController.swift
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

protocol StatementsDisplayLogic: class
{
  func displayUser(viewModel: Statements.UserData.ViewModel)
    func displayStatements(viewModel: Statements.UserStatements.ViewModel)
}

class StatementsViewController: UIViewController, StatementsDisplayLogic
{
  var interactor: StatementsBusinessLogic?
  var router: (NSObjectProtocol & StatementsRoutingLogic & StatementsDataPassing)?

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
    let interactor = StatementsInteractor()
    let presenter = StatementsPresenter()
    let router = StatementsRouter()
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
    setupView()
    doSomething()
    doUserStatements()
  }
    
  
  // MARK: Do something
  
  //@IBOutlet weak var nameTextField: UITextField!
    var userId = 0
    var userLabel: UILabel!
    var accountLabel: UILabel!
    var accountAgencyLabel: UILabel!
    var balanceLabel: UILabel!
    var balanceValueLabel: UILabel!
    var backgroundView: UIView!
    var exitButton: UIButton!
    var recent: UILabel!
    var tableView: UITableView!
    
    var statements = [Statement]()
    let cellId = "cellId"
    
    func setupView(){
        backgroundView = UIView()
        backgroundView.backgroundColor = UIColor(red: 59/255, green: 73/255, blue: 238/255, alpha: 1)
        view.addSubview(backgroundView)
        
        userLabel = UILabel()
        userLabel.setup(text: nil, color: .white, fontSize: 25)
//        userLabel.textColor = .white
//        userLabel.font = userLabel.font.withSize(25)
        view.addSubview(userLabel)
        
        accountLabel = UILabel()
        accountLabel.setup(text: "Conta", color: .white, fontSize: 12)
//        accountLabel.text = "Conta"
//        accountLabel.font = accountLabel.font.withSize(12)
//        accountLabel.textColor = .white
        view.addSubview(accountLabel)
        
        accountAgencyLabel = UILabel()
        accountAgencyLabel.setup(text: nil, color: .white, fontSize: 25)
//        accountAgencyLabel.textColor = .white
//        accountAgencyLabel.font = accountAgencyLabel.font.withSize(25)
        view.addSubview(accountAgencyLabel)
        
        balanceValueLabel = UILabel()
        balanceValueLabel.setup(text: nil, color: .white, fontSize: 25)
//        balanceValueLabel.textColor = .white
//        balanceValueLabel.font = balanceValueLabel.font.withSize(25)
        view.addSubview(balanceValueLabel)
        
        balanceLabel = UILabel()
        balanceLabel.setup(text: "Saldo", color: .white, fontSize: 12)
//        balanceLabel.text = "Saldo"
//        balanceLabel.font = balanceLabel.font.withSize(12)
//        balanceLabel.textColor = .white
        view.addSubview(balanceLabel)
        
        exitButton = UIButton()
        exitButton.setImage(UIImage(named: "logout"), for: .normal)
        exitButton.addTarget(self, action: #selector(logout), for: .touchUpInside)
        view.addSubview(exitButton)
        
        recent = UILabel()
        recent.setup(text: "Recentes", color: UIColor(red: 72/255, green: 84/255, blue: 101/255, alpha: 1), fontSize: 17)
//        recent.text = "Recentes"
//        recent.font = recent.font.withSize(17)
//        recent.textColor =
        view.addSubview(recent)
        
        tableView = UITableView()
        tableView.register(StatementViewCell.self, forCellReuseIdentifier: cellId)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        view.addSubview(tableView)
        
        setupLayout()
    }
    @objc func logout(){
        dismiss(animated: true, completion: nil)
    }
    func setupLayout(){
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        
        userLabel.translatesAutoresizingMaskIntoConstraints = false
        userLabel.heightAnchor.constraint(equalToConstant: 29).isActive = true
        userLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
        userLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18).isActive = true
        
        
        accountLabel.translatesAutoresizingMaskIntoConstraints = false
        accountLabel.heightAnchor.constraint(equalToConstant: 13).isActive = true
        accountLabel.topAnchor.constraint(equalTo: userLabel.bottomAnchor, constant: 28).isActive = true
        accountLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18).isActive = true
        
        accountAgencyLabel.translatesAutoresizingMaskIntoConstraints = false
        accountAgencyLabel.topAnchor.constraint(equalTo: accountLabel.bottomAnchor, constant: 6).isActive = true
        accountAgencyLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18).isActive = true
        accountAgencyLabel.heightAnchor.constraint(equalToConstant: 29).isActive = true
        
        balanceLabel.translatesAutoresizingMaskIntoConstraints = false
        balanceLabel.heightAnchor.constraint(equalToConstant: 13).isActive = true
        balanceLabel.topAnchor.constraint(equalTo: accountAgencyLabel.bottomAnchor, constant: 21).isActive = true
        balanceLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18).isActive = true
        
        balanceValueLabel.translatesAutoresizingMaskIntoConstraints = false
        balanceValueLabel.heightAnchor.constraint(equalToConstant: 29).isActive = true
        balanceValueLabel.topAnchor.constraint(equalTo: balanceLabel.bottomAnchor, constant: 6).isActive = true
        balanceValueLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18).isActive = true
        
        backgroundView.bottomAnchor.constraint(equalTo: balanceValueLabel.bottomAnchor, constant: 16).isActive = true
        
        exitButton.translatesAutoresizingMaskIntoConstraints = false
        exitButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
        exitButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12).isActive = true
        exitButton.heightAnchor.constraint(equalToConstant: 27).isActive = true
        exitButton.widthAnchor.constraint(equalToConstant: 27).isActive = true
        
        recent.translatesAutoresizingMaskIntoConstraints = false
        recent.topAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: 14).isActive = true
        recent.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18).isActive = true
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: recent.bottomAnchor, constant: 8).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16).isActive = true
        
    }
  
  func doSomething()
  {
    let request = Statements.UserData.Request()
    interactor?.doSomething(request: request)
  }
    
    func doUserStatements(){
        let request = Statements.UserStatements.Request(userId: userId)
        interactor?.getStatements(request: request)
    }
  
  func displayUser(viewModel: Statements.UserData.ViewModel)
  {
    //nameTextField.text = viewModel.name
    userLabel.text = viewModel.userName
    balanceValueLabel.text = "\(viewModel.userBalance)"
    accountAgencyLabel.text = "\(viewModel.userAccount) / \(viewModel.userAgency)"
    userId = viewModel.userId
  }
    
    func displayStatements(viewModel: Statements.UserStatements.ViewModel){
        statements = viewModel.statements
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        
    }
}
extension StatementsViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        statements.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! StatementViewCell
        cell.configure(model: statements[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 96
    }

}
