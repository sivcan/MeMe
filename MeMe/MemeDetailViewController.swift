//
//  MemeDetailViewController.swift
//  MeMe
//
//  Created by Sivcan Singh on 11/06/16.
//  Copyright © 2016 Sivcan Singh. All rights reserved.
//

import UIKit

class MemeDetailViewController: UIViewController {
    
    var img : UIImage!
    
    @IBOutlet weak var imageViewz: UIImageView!
    
    
    
    
    override func viewWillAppear(animated: Bool) {
        imageViewz.image = img
        imageViewz.contentMode = UIViewContentMode.ScaleAspectFit
    }


}
