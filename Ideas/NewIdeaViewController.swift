//
//  NewIdeaViewController.swift
//  Ideas
//
//  Created by Eddie Lee on 12/09/2015.
//  Copyright © 2015 Eddie Lee. All rights reserved.
//

import UIKit
import CoreData

class NewIdeaViewController: UIViewController, UITextFieldDelegate {

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
        if let title = newIdeaTextField.text {
            saveIdea(title)
        }
        
        newIdeaTextField.text = ""
        newIdeaTextField.resignFirstResponder()
        
        navigationController?.popViewControllerAnimated(true)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false;
    }
    
    func saveIdea(title: String) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        
        let entity =  NSEntityDescription.entityForName("Idea", inManagedObjectContext: managedContext)
        let idea = NSManagedObject(entity: entity!, insertIntoManagedObjectContext:managedContext)
        
        idea.setValue(title, forKey: "title")
        
        do {
            try managedContext.save()
        } catch _ {
            print("Save crashed")
        }
    }
}
