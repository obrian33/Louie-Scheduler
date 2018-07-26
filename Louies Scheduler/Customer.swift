//
//  Customer.swift
//  Louies Scheduler
//
//  Created by mac-pro on 5/12/18.
//  Copyright © 2018 mac-pro. All rights reserved.
//

import UIKit

class Customer {
    var name: String
    var email: String
    var selectedBarber: Int
    
    init?(name: String, email: String, selectedBarber: Int) {
        self.name = name
        self.email = email
        self.selectedBarber = selectedBarber
    }
}
