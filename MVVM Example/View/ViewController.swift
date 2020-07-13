//
//  ViewController.swift
//  MVVM Example
//
//  Created by Chinh le on 7/13/20.
//  Copyright © 2020 Chinh le. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: Outlet
    @IBOutlet weak var txtName: BindingTextField!
    @IBOutlet weak var txtPhone: BindingTextField!
    @IBOutlet weak var txtEmail: BindingTextField!
    @IBOutlet weak var txtAge: BindingTextField!
    @IBOutlet weak var segmentControl: BindingSegmentControl!
    
    //MARK: Property
    var updateProfileViewModel: UpdateProfileViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let user = LocalStorage.default.user
        updateProfileViewModel = UpdateProfileViewModel(user: user)
        bindViewModel()
    }


    func bindViewModel() {
        /** Update UI **/
        self.updateProfileViewModel.name.subscribe { [weak self] in
            self?.txtName.text = $0
        }
        
        self.updateProfileViewModel.email.subscribe { [unowned self] in
            self.txtEmail.text = $0
        }
        
        self.updateProfileViewModel.phoneNumber.subscribe{ [unowned self] in
            self.txtPhone.text = $0
        }
        
        self.updateProfileViewModel.age.subscribe{ [unowned self] in
            self.txtAge.text = $0 != nil ? String($0!) : ""
        }
        
        self.updateProfileViewModel.gender.subscribe{ [unowned self] in
            self.segmentControl.selectedSegmentIndex = $0 ?? 0
        }
        
        /** Change to user **/
        self.txtName.subscribe { [unowned self] in
            self.updateProfileViewModel.name.value = $0
        }
        
        self.txtEmail.subscribe { [unowned self] in
            self.updateProfileViewModel.email.value = $0
        }
        
        self.txtPhone.subscribe { [unowned self] in
            self.updateProfileViewModel.phoneNumber.value = $0
        }
        
        self.txtAge.subscribe { [unowned self] in
            self.updateProfileViewModel.age.value = Int($0)
        }
        
        self.segmentControl.subscribe { [unowned self] in
            self.updateProfileViewModel.gender.value = Int($0)
        }
        
        self.updateProfileViewModel.messageObserver = { [weak self] title, message in
            self?.showAlert(withTitle: title, andErrorMessage: message)
        }
    }
    
    func showAlert(withTitle title: String, andErrorMessage message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func saveAction(_ sender: UIButton) {
        self.updateProfileViewModel.saveButtonClicked()
    }
}

