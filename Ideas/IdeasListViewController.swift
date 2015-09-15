//
//  IdeasListViewController.swift
//  Ideas
//
//  Created by Eddie Lee on 12/09/2015.
//  Copyright © 2015 Eddie Lee. All rights reserved.
//

import UIKit
import CoreData

class IdeasListViewController: UITableViewController {

    var ideas = [NSManagedObject]()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        
        let fetchRequest = NSFetchRequest(entityName:"Idea")
        
        do {
            let fetchedResults = try managedContext.executeFetchRequest(fetchRequest) as? [NSManagedObject]
            if let results = fetchedResults {
                ideas = results
            } else {
                print("Fetch failed")
            }
        } catch _ {
            print("Fetch crashed")
        }
        
        self.tableView!.reloadData()
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ideas.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell

        let idea = ideas[indexPath.row]
        cell.textLabel?.text = idea.valueForKey("title") as? String
        
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ViewIdeaSegue" {
            if let destination = segue.destinationViewController as? ViewIdeaViewController {
                if let selectedIdeaIndex = tableView.indexPathForSelectedRow {
                    let idea = ideas[selectedIdeaIndex.row]
                    destination.ideaText = idea.valueForKey("title") as! String
                }
            }
        }
    }
}
