//
//  TableView.swift
//  Playtime_1
//
//  Created by Anh Duc Tran on 01.04.17.
//  Copyright © 2017 Anh Duc Tran. All rights reserved.
//

import Foundation
import UIKit

extension PasswordListController : UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return content.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellIdentifier", for: indexPath) as UITableViewCell
        let contentTable = content[indexPath.row] as String
        print(contentTable)
        cell.textLabel!.text = contentTable
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Tap on item at index \(indexPath)")
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
//        let update = UITableViewRowAction(style: .normal, title: "Update") { action, index in
//            print("update")
//        }
        let delete = UITableViewRowAction(style: .normal, title: "Delete") { action, index in
            print("delete")
//            self.db.delete(content_: indexPath.row.description)
//            self.content.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.fade)
        }
        
//        update.backgroundColor = UIColor.orange
        delete.backgroundColor = UIColor.red
        return [delete]
    }
    
}
