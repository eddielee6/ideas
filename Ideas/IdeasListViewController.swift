//
//  IdeasListViewController.swift
//  Ideas
//
//  Created by Eddie Lee on 12/09/2015.
//  Copyright © 2015 Eddie Lee. All rights reserved.
//

import UIKit

class IdeasListViewController: UITableViewController {

    var ideas = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()

        ideas.append("Hello")
        ideas.append("Test")
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ideas.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell

        let row = indexPath.row
        cell.textLabel?.text = ideas[row]
        
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
                    destination.ideaText = ideas[selectedIdeaIndex.row]
                }
            }
        }
    }
}
