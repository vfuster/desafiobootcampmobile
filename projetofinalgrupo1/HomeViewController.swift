//
//  RedViewController.swift
//  projetofinalgrupo1
//
//  Created by Amanda Karolina Santos da Fonseca Paiva on 15/06/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    
    private let tableView = UITableView()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
        setupTableView()
        
    }
    
    func setupView(){
        title = "Home"
        
    }
    
    func setupTableView() {
        view.addSubview(tableView)
        tableView.backgroundColor = .red
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    
    
    
    

}
