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
        
        setViewControllers([homeController(),registerController(),favoriteController()], animated: true)
        selectedIndex = 0
        setupTabBar()
    }
    
    private func setupTabBar(){
        tabBar.barTintColor = .black
        tabBar.isTranslucent = false
        tabBar.backgroundColor = UIColor(red: 0.27, green: 0.733, blue: 0.938, alpha: 1)
    }
    
    private func homeController()  -> UINavigationController {
        let HomeController = HomeViewController()
        HomeController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName:"house.fill"), tag: 0)
        let navigationController = UINavigationController(rootViewController: HomeController)
        return navigationController
    }
    
    private func registerController()  -> UINavigationController {
        let registerController = RegisterViewController()
        registerController.tabBarItem = UITabBarItem(title: "Cadastrar", image: UIImage(systemName:"plus.circle"), tag: 0)
        let navigationController = UINavigationController(rootViewController: registerController)
        navigationController.setNavigationBarHidden(false, animated: false)
        return navigationController
    }
    
    private func favoriteController()  -> UINavigationController {
        let favoriteController = FavoriteViewController()
        favoriteController.tabBarItem = UITabBarItem(title: "Favoritos", image: UIImage(systemName:"star.fill"), tag: 0)
        let navigationController = UINavigationController(rootViewController: favoriteController)
        return navigationController
    }
}
