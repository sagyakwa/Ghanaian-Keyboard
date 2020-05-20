//
//  UserDefaultsWrapper.swift
//  Ghanaian Keyboard
//
//  Created by Samuel Agyakwa on 5/19/20.
//  Copyright © 2020 Tetra Apps. All rights reserved.
//

import Foundation
import Combine


// Use property Wrapper to make a default wrapper
@propertyWrapper
struct UserDefaultWrapper<T> {
    let key: String
    let defaultValue: T

    init(_ key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }

    var wrappedValue: T {
        get {
            return UserDefaults.standard.object(forKey: key) as? T ?? defaultValue
        }
        set {
            UserDefaults.standard.set(newValue, forKey: key)
        }
    }
}


// Store our defaults
struct UserDefaultsStorage {
    @UserDefaultWrapper("first_launch", defaultValue: false)
    static var hasLaunchedBefore: Bool
    
    @UserDefaultWrapper("keyboard_on", defaultValue: true)
    static var keyboardOn: Bool
    
    @UserDefaultWrapper("akan", defaultValue: true)
    static var akan: Bool
    
    @UserDefaultWrapper("ewe", defaultValue: true)
    static var ewe: Bool
    
    @UserDefaultWrapper("ga", defaultValue: true)
    static var ga: Bool
    
    @UserDefaultWrapper("dagbani", defaultValue: true)
    static var dagbani: Bool
}
