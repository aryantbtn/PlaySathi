//
//  MainTabBarController.swift
//  PlaySathi
//
//  Created by Batch - 2 on 24/01/25.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.selectedIndex = 1
        self.navigationController?.navigationBar.isHidden = true
    }

}
