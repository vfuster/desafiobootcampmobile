//
//  TabBarViewController.swift
//  projetofinalgrupo1
//
//  Created by Amanda Karolina Santos da Fonseca Paiva on 15/06/22.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setViewControllers([redController(),greenController(),blueController()], animated: true)
        selectedIndex = 0
        setupTabBar()
    }
    
        private func setupTabBar(){
        tabBar.backgroundColor = .cyan
        tabBar.barTintColor = .black
        tabBar.isTranslucent = false
    }
  
    private func redController()  -> UINavigationController {
    let redController = RedViewController()
    redController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName:"house.fill"), tag: 0)
    let navigationController = UINavigationController(rootViewController: redController)
    return navigationController
    }
    
    private func greenController()  -> UINavigationController {
    let greenController = GreenViewController()
    greenController.tabBarItem = UITabBarItem(title: "Cadastrar", image: UIImage(systemName:"plus.circle"), tag: 0)
    let navigationController = UINavigationController(rootViewController: greenController)
    return navigationController
    }
    
    private func blueController()  -> UINavigationController {
    let blueController = BlueViewController()
    blueController.tabBarItem = UITabBarItem(title: "Favoritos", image: UIImage(systemName:"star.fill"), tag: 0)
    let navigationController = UINavigationController(rootViewController: blueController)
    return navigationController
    }
 }
