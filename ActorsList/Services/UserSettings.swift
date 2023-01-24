//
//  UserSettings.swift
//  44444
//
//  Created by Денис Ільницький on 23/01/2023.


import Foundation

final class UserSettings {
    
     private enum SettingsKeys: String {
        case userLogin
        case userModel
    }
    
    static var userModel: UserModel? {
        get {
            guard let savedData = UserDefaults.standard.object(forKey:
                SettingsKeys.userModel.rawValue) as? Data, let decodedModel = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(savedData) as? UserModel else {
                return nil }
            return decodedModel
        }
        set {
            let defaults = UserDefaults.standard
            let key = SettingsKeys.userModel.rawValue
            
            if let userModel = newValue {
                if let saveData = try? NSKeyedArchiver.archivedData(withRootObject: userModel,
                                                                    requiringSecureCoding: false) {
                    defaults.set(saveData, forKey: key)
                }
            }
        }
    }
    
    static var userLogin: String! {
        get {
            return UserDefaults.standard.string(forKey: SettingsKeys.userLogin.rawValue)
        } set {
            let defaults = UserDefaults.standard
            let key = SettingsKeys.userLogin.rawValue
            if let login = newValue {
                print("value: \(login) was added to \(key)")
                defaults.set(login, forKey: key)
            } else {
                defaults.removeObject(forKey: key)
            }
        }
    }
}

