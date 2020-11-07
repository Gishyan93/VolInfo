//
//  CustomTabBarController.swift
//  Volinfo
//
//  Created by Tigran Gishyan on 10/24/20.
//

import UIKit

class CustomTabBarController: UITabBarController, UITabBarControllerDelegate {
    
    //
    //MARK: - Properties
    //
    var pagerButtonWidth: CGFloat = 0
    var pagerButtonHeight: CGFloat = 0
    let homeController = GroupController()
    let admissionsController = AdmissionsController()
    let hotLineController = HotLineController()
    //
    //MARK: - Lificycle
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let homeNavController = UINavigationController(rootViewController: homeController)
        homeNavController.tabBarItem.title = "Գլխավոր"
        homeNavController.tabBarItem.image = #imageLiteral(resourceName: "home-30")
        
        let admissionsNavController = UINavigationController(rootViewController: admissionsController)
        admissionsNavController.tabBarItem.title = "Ընդունում"
        admissionsNavController.tabBarItem.image = #imageLiteral(resourceName: "admissions-30")
        
        
        let hotLineNavController = UINavigationController(rootViewController: hotLineController)
        hotLineNavController.tabBarItem.title = "Թեժ գիծ"
        hotLineNavController.tabBarItem.image = #imageLiteral(resourceName: "hot-line-30")
        
        viewControllers = [homeNavController, admissionsNavController, hotLineNavController]
        
        self.delegate = self
             
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        let generator = UIImpactFeedbackGenerator()
        generator.impactOccurred()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
      
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
}
