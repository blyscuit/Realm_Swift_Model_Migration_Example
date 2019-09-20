//
//  ViewController.swift
//  RealmManager
//
//  Created by Pisit W on 20/9/2562 BE.
//  Copyright © 2562 23. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    var mdNote: MDNote!
    var isEditingData = false
    var realmManager = RealmManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        textField.text = mdNote?.content
    }
    

    @IBAction func pressSave(_ sender: Any) {
        addNote()
    }
    
    func addNote() {
        // Editing the existing object
        if isEditingData == true {
            let newNote = MDNote(identifier: mdNote.identifier, content: textField.text ?? "", lastEdited: Date())
            realmManager.editObjects(objs: newNote)
        }
            // Adding the new Object
        else if isEditingData == false {
            let newNote = MDNote(content: textField.text ?? "")
            realmManager.saveObjects(objs: newNote)
        }
        self.navigationController?.popViewController(animated: true)
    }
}

