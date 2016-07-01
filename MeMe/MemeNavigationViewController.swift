//
//  MemeNavigationViewController.swift
//  MeMe
//
//  Created by Sivcan Singh on 10/06/16.
//  Copyright © 2016 David Plaza Balagué. All rights reserved.
//

import UIKit

class MemeNavigationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //self.navigationItem.title = "Sent Memes"
        //self.navigationBar.barStyle = UIBarStyle.Black
        //self.navigationBar.tintColor = UIColor.whiteColor()
        // Do any additional setup after loading the view.
    }
    
   
    override func viewWillAppear(animated: Bool) {
        navigationItem.title = "Sent Memes"
        navigationItem.titleView 
    }
}
