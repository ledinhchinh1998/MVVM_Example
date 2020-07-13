//
//  LocalStorage.swift
//  MVVM Example
//
//  Created by Chinh le on 7/13/20.
//  Copyright © 2020 Chinh le. All rights reserved.
//

import Foundation


class LocalStorage {
    var user: User?
    static let `default` = LocalStorage()
    
    private init() {
        user = getUser()
    }
    
    private func getUser() -> User? {
        return User(name: "Omar Tarek", mobileNumber: "01007336222", email: "dev.omartarek@gmail.com", age: 26, gender: .male)
    }
}
