//
//  PasswordObject.swift
//  PasswordManager
//
//  Created by Anh Duc Tran on 01.04.17.
//  Copyright © 2017 Anh Duc Tran. All rights reserved.
//

import Foundation

class PasswordObject{

    var pwFor: String
    var username: String
    var password: String
    
    init(pwFor: String, username: String, password: String) {
        self.pwFor = pwFor
        self.username = username
        self.password = password
    }

}
