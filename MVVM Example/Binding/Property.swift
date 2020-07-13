//
//  Property.swift
//  MVVM Example
//
//  Created by Chinh le on 7/13/20.
//  Copyright © 2020 Chinh le. All rights reserved.
//

import Foundation

class Property<Type> {
    private var subscribeAction: (Type?) -> () = { _ in }
    
    var value: Type? {
        didSet {
            subscribeAction(value)
        }
    }
    
    init(_ value: Type) {
        self.value = value
    }
    
    func subscribe(_ closure: @escaping (Type?) -> ()) {
        subscribeAction = closure
        if let value = value {
            self.subscribeAction(value)
        }
    }
}
