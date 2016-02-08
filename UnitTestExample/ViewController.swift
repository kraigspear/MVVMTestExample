//
//  ViewController.swift
//  UnitTestExample
//
//  Created by Kraig Spear on 2/8/16.
//  Copyright © 2016 Kraig Spear. All rights reserved.
//

import UIKit

protocol AgeViewable: class {
    var firstName: String? {get set}
    var lastName: String? {get set}
    var birthDate: String? {get set}
    var ageResult: String? {get set}
    func showError(error: String)
}

class ViewController: UIViewController, AgeViewable {

    
    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var birthDateTextField: UITextField!
    
    @IBOutlet weak var ageLabel: UILabel!
    
    @IBAction func calcAction(sender: AnyObject) {
        viewModel.calcAge()
    }
    
    private var viewModel: ViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = ViewModel(delegate: self)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    var firstName: String? {
        get {
            return firstNameTextField.text
        }
        set {
            firstNameTextField.text = newValue
        }
    }
    
    var lastName: String? {
        get {
            return lastNameTextField.text
        }
        set {
            lastNameTextField.text = newValue
        }
    }
    
    var birthDate: String? {
        get {
            return birthDateTextField.text
        }
        set {
            birthDateTextField.text = newValue
        }
    }
    
    var ageResult: String? {
        get {
            return ageLabel.text
        }
        set {
            ageLabel.text = newValue
        }
    }
    
    func showError(error: String) {
        let alertController = UIAlertController(title: "Error", message: error, preferredStyle: .Alert)
        let cancelAction = UIAlertAction(title: "Ok", style: .Cancel) { (action) -> Void in
            alertController.dismissViewControllerAnimated(true, completion: nil)
        }
        alertController.addAction(cancelAction)
        presentViewController(alertController, animated: true, completion: nil)
    }

}

