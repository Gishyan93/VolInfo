//
//  MainNavigationController.swift
//  Volinfo
//
//  Created by Tigran Gishyan on 10/25/20.
//

import UIKit

class MainNavigationController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let homeController = CustomTabBarController()
        viewControllers = [homeController]
    }
}
