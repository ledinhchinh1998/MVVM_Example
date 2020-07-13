//
//  BindableCompunents.swift
//  MVVM Example
//
//  Created by Chinh le on 7/13/20.
//  Copyright © 2020 Chinh le. All rights reserved.
//

import Foundation
import UIKit

class BindingTextField: UITextField {
    var textChanged: (String) -> () = { _ in }
    
    func subscribe(callback: @escaping (String) -> ()) {
        self.textChanged = callback
        self.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        self.textChanged(textField.text ?? "")
    }
}

class BindingSegmentControl: UISegmentedControl {
    var selectionChanged: (Int) -> () = { _ in }
    
    func subscribe(callback: @escaping (Int) -> ()) {
        self.selectionChanged = callback
        self.addTarget(self, action: #selector(selectionDidChange), for: .valueChanged)
    }
    
    @objc func selectionDidChange() {
        self.selectionChanged(self.selectedSegmentIndex)
    }
}
