//
//  Barber.swift
//  Louies Scheduler
//
//  Created by mac-pro on 5/12/18.
//  Copyright © 2018 mac-pro. All rights reserved.
//

import UIKit

class Barber {
    var customers = [Customer]()
    var name: String
    var password: String
    var id: Int
    
    init?(customers: [Customer], name: String, password: String, id: Int) {
        
        self.customers = customers
        self.name = name
        self.password = password
        self.id = id
    }
    
    
}
