//
//  PasswordList.swift
//  Playtime_1
//
//  Created by Anh Duc Tran on 01.04.17.
//  Copyright © 2017 Anh Duc Tran. All rights reserved.
//

import Foundation
import UIKit
import Log

class PasswordListController : UIViewController
{
    let log = Logger()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var pws: [Password] = []
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        log.minLevel = .warning
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning() 
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getData()
        tableView.reloadData()
    }
    
    func getData() {
        do {
            pws = try context.fetch(Password.fetchRequest())
        } catch {
            print("Fetching Failed")
        }
    }
}
