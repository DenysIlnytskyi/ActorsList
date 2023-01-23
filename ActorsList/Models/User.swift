//
//  User.swift
//  44444
//
//  Created by Денис Ільницький on 23/01/2023.
//

import Foundation

class UserModel: NSObject, NSCoding {
    
    var name: String
    var password: String
    
    init(name: String, password: String) {
        self.name = name
        self.password = password
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(name, forKey: "name")
        coder.encode(password, forKey: "password")
    }
    
    required init?(coder: NSCoder) {
        name = coder.decodeObject(forKey: "name") as? String ?? ""
        password = coder.decodeObject(forKey: "password") as? String ?? ""
    }
}

