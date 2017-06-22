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
        return pws.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellIdentifier", for: indexPath) as UITableViewCell
        
        let PWArray = pws[indexPath.row]
        
        cell.textLabel!.text = PWArray.passwordFor
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Tap on item at index \(indexPath.row.description)")
        
        
        let pwDetailView = storyboard?.instantiateViewController(withIdentifier: "PasswordDetailView") as! PasswordDetailController
        
        pwDetailView.site = pws[indexPath.row].passwordFor!
        pwDetailView.username = pws[indexPath.row].username!
        pwDetailView.password = pws[indexPath.row].password!
        
        navigationController?.pushViewController(pwDetailView, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let passwords = pws[indexPath.row]
            context.delete(passwords)
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
            do{
                pws = try context.fetch(Password.fetchRequest())
                log.info("Item deleted")
            } catch {
                log.error("Fetching Failed!")
            }
        }
        tableView.reloadData()
    }
}
