//
//  User.swift
//  MVVM Example
//
//  Created by Chinh le on 7/13/20.
//  Copyright © 2020 Chinh le. All rights reserved.
//

import Foundation

enum Gender: Int {
    case male = 0
    case famale = 1
}

enum UpdateProfileFormError: Error {
    case emptyName
    case invalidMobileNumber
    case invalidEmailAddress
    case veryYoung
    
    var localizedDescription: String {
        switch self {
        case .emptyName:
            return "Please, enter your name"
        case .invalidMobileNumber:
            return "Please, enter a valid mobile number"
        case .invalidEmailAddress:
            return "Please, enter a valid email address"
        case .veryYoung:
            return "Minimum age should be 18"
        }
    }
}

struct User {
    var name: String
    var mobileNumber: String
    var email: String
    var age: Int
    var gender: Gender
}

