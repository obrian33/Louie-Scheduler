//
//  AddCustomerViewController.swift
//  Louies Scheduler
//
//  Created by mac-pro on 5/12/18.
//  Copyright © 2018 mac-pro. All rights reserved.
//

import UIKit

class AddCustomerViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate {
    
    var selectedBarber: Int?
    var newCustomer: Customer?
    
    @IBOutlet weak var customerName: UITextField!
    
    @IBOutlet weak var customerEmail: UITextField!
    
    @IBOutlet weak var addToList: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
         customerName.delegate = self
         customerEmail.delegate = self
        // print(self.selectedBarber!)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
         newCustomer = Customer(name: self.customerName.text!, email: self.customerEmail.text!, selectedBarber: self.selectedBarber!)
        // print("asdfasf")
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
 
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
         let customerEmailText = customerEmail.text ?? ""
         let customerNameText = customerName.text ?? ""

        addToList.isEnabled = !customerEmailText.isEmpty && !customerNameText.isEmpty
    }
    

    @IBAction func cancelButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
}

