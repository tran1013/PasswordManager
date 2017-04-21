//
//  database.swift
//  PasswordManager
//
//  Created by Anh Duc Tran on 09.04.17.
//  Copyright © 2017 Anh Duc Tran. All rights reserved.
//

import Foundation
import SQLite

class database{
    
    let dbIntern = Table("pwDB")
    let id = Expression<Int64>("id")
    let username = Expression<String?>("username")
    let site = Expression<String?>("site")
    let password = Expression<String?>("password")
    
    
    let db: Connection
    let path: String
    
    var contentForTable = [PasswordObject]()
    
    //init database and create table if there isn't a table ownTable exist
    init() {
        path = NSSearchPathForDirectoriesInDomains(
            .documentDirectory, .userDomainMask, true
            ).first!
        print("Path: \(path)")
        
        db = try! Connection("\(path)/db.db")
        do{
            try db.run(dbIntern.create { t in
                t.column(id, primaryKey: true)
                t.column(username)
                t.column(site)
                t.column(password)
            })} catch {
                print(error)
        }
    }
    
    //get all content from table and store in a string array
    func getAll() -> [PasswordObject]
    {
        do{
            for user in try db.prepare(dbIntern) {
                contentForTable.append(PasswordObject(pwFor: String(user[site]!), username: String(user[username]!),password: String(user[password]!)))
            }
        } catch {
            print("ERROR \(error)")
        }
        
        return contentForTable
    }
    
    //insert content into table
    func insert(site_: String, username_: String, password_: String)
    {
        do {
            let rowid = try db.run(dbIntern.insert(username <- username_, site <- site_, password <- password_))
            print("inserted id: \(rowid)")
        } catch {
            print("insertion failed: \(error)")
        }
    }
    
    //delete content from table
    func delete(site_: String, username_: String)
    {
        let toDelete = dbIntern.filter(site == site_ && username == username_)
        do {
            try db.run(toDelete.delete())
            print("deleted username \(username_) with site \(site)")
        } catch {
            print("deletion failed: \(error)")
        }
    }
}
