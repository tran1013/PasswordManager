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
        let contentTable = content[indexPath.row]
        print(contentTable)
        cell.textLabel!.text = contentTable.pwFor
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Tap on item at index \(indexPath.row.description)")
        
        
        let pwDetailView = storyboard?.instantiateViewController(withIdentifier: "PasswordDetailView") as! PasswordDetailController
        
        pwDetailView.site = content[indexPath.row].pwFor
        pwDetailView.username = content[indexPath.row].username
        pwDetailView.password = content[indexPath.row].password
        
        navigationController?.pushViewController(pwDetailView, animated: true)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let delete = UITableViewRowAction(style: .normal, title: "Delete") { action, index in
            print("delete")

            self.db.delete(site_: self.content[indexPath.row].pwFor, username_: self.content[indexPath.row].username)
            self.content.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.fade)
        }
        delete.backgroundColor = UIColor.red
        return [delete]
    }
}
