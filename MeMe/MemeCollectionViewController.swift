//
//  MemeCollectionViewController.swift
//  MeMe
//
//  Created by Sivcan Singh on 10/06/16.
//  Copyright © 2016 Sivcan Singh. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class MemeCollectionViewController: UICollectionViewController{

    @IBOutlet var MainController: UICollectionView!
    
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    var delegate : AppDelegate!
    
    override func viewWillAppear(animated: Bool) {
        
        delegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        self.MainController.reloadData()
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Register cell classes
        self.collectionView!.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        let space: CGFloat = 1.5
        let dimensionWidth = (self.view.frame.size.width - (2 * space)) / 3.0
        let dimensionHeight = (self.view.frame.size.height - (2 * space)) / 3.0
        flowLayout.minimumInteritemSpacing = space
        flowLayout.minimumLineSpacing = space
        flowLayout.itemSize = CGSizeMake(dimensionWidth, dimensionHeight)
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.delegate.memes.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CollectionCell", forIndexPath: indexPath) as! MemeCollectionViewCell
        
        
        let info = self.delegate.memes[indexPath.item]
        
        cell.imageViewz.image = info.memedImage
            
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let controller = storyboard.instantiateViewControllerWithIdentifier("MemeDetail") as! MemeDetailViewController
        
        let info = self.delegate.memes[indexPath.item]
        
        controller.img = info.memedImage
        
        self.navigationController?.pushViewController(controller, animated: true)
    }

}
