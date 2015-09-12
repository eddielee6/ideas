//
//  IdeasListViewController.swift
//  Ideas
//
//  Created by Eddie Lee on 12/09/2015.
//  Copyright © 2015 Eddie Lee. All rights reserved.
//

import UIKit

class IdeasListViewController: UITableViewController {

    var names = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()

        names.append("Hello")
        names.append("Test")
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell

        let row = indexPath.row
        cell.textLabel?.text = names[row]
        
        return cell
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)

        let row = indexPath.row
        print(names[row])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}
