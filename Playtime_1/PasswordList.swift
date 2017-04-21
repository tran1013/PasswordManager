//
//  PasswordList.swift
//  Playtime_1
//
//  Created by Anh Duc Tran on 01.04.17.
//  Copyright © 2017 Anh Duc Tran. All rights reserved.
//

import Foundation
import UIKit
import SQLite

class PasswordListController : UIViewController
{
    
    @IBOutlet var tableView: UITableView!

    var content: [PasswordObject] = []
    var db = database()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        content = db.getAll()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning() 
    }
    
}
