//
//  ViewController.swift
//  Birthday Note Taker
//
//  Created by Erwan Rombo on 17/06/2017.
//  Copyright © 2017 Borombo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameInput: UITextField!
    @IBOutlet weak var birthdayInput: UITextField!
    
    @IBOutlet weak var storedNameLabel: UILabel!
    @IBOutlet weak var storedDateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedDate = UserDefaults.standard.object(forKey: "birthday")
        
        if let newName = storedName as? String{
            storedNameLabel.text = "Stored Name: \(newName)"
        }
        
        if let newDate = storedDate as? String{
            storedDateLabel.text = "Stored Date: \(newDate)"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onSaveButton(_ sender: Any) {
        UserDefaults.standard.set(nameInput.text, forKey: "name")
        UserDefaults.standard.set(birthdayInput.text, forKey: "birthday")
        UserDefaults.standard.synchronize()
        
        storedNameLabel.text = "Stored Name: \(nameInput.text!)"
        storedDateLabel.text = "Stored Date: \(birthdayInput.text!)"
    }

    @IBAction func onDeleteButton(_ sender: Any) {
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedDate = UserDefaults.standard.object(forKey: "birthday")
        
        if (storedName as? String) != nil{
            UserDefaults.standard.removeObject(forKey: "name")
            UserDefaults.standard.synchronize()
            storedNameLabel.text = "Stored Name:"
        }
        
        if (storedDate as? String) != nil{
            UserDefaults.standard.removeObject(forKey: "name")
            UserDefaults.standard.synchronize()
            storedDateLabel.text = "Stored Date:"
        }
    }
}

