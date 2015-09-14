//
//  NewIdeaViewController.swift
//  Ideas
//
//  Created by Eddie Lee on 12/09/2015.
//  Copyright © 2015 Eddie Lee. All rights reserved.
//

import UIKit

class NewIdeaViewController: UIViewController {

    @IBOutlet weak var newIdeaTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func AddNewIdea(sender: AnyObject) {
        newIdeaTextField.text = "";
    }
}
