//
//  ViewIdeaViewController.swift
//  Ideas
//
//  Created by Eddie Lee on 13/09/2015.
//  Copyright © 2015 Eddie Lee. All rights reserved.
//

import UIKit

class ViewIdeaViewController: UIViewController {
    
    var ideaText = String();

    @IBOutlet weak var ideaTextLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        ideaTextLabel.text = ideaText;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
