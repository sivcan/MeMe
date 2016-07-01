//
//  MemeTableTableViewController.swift
//  MeMe
//
//  Created by Sivcan Singh on 10/06/16.
//  Copyright © 2016 Sivcan Singh. All rights reserved.
//

import UIKit

class MemeTableTableViewController: UITableViewController{
    
    @IBOutlet var MainTable: UITableView!
    
    var delegate : AppDelegate!

    override func viewWillAppear(animated: Bool) {
        
        delegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        self.MainTable.reloadData()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print (self.delegate.memes.count)
        return self.delegate.memes.count
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            self.delegate.memes.removeAtIndex(indexPath.row)
            
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            self.MainTable.reloadData()
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TableCell", forIndexPath: indexPath)
        
        let info = self.delegate.memes[indexPath.row]
        
        cell.textLabel?.text = "\(info.topText)...\(info.bottomText)"
        
        cell.imageView?.image = info.memedImage
        
        cell.imageView?.layer.masksToBounds = true

        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewControllerWithIdentifier("MemeDetail") as! MemeDetailViewController
        
        let info = self.delegate.memes[indexPath.row]
        
        controller.img = info.memedImage
        
        
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
}
