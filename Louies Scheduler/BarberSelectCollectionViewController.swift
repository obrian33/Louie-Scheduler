//
//  BarberSelectCollectionViewController.swift
//  Louies Scheduler
//
//  Created by mac-pro on 5/13/18.
//  Copyright © 2018 mac-pro. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class BarberSelectCollectionViewController: UICollectionViewController, UINavigationControllerDelegate {
    
    enum Barbers: Int {
        case Louie
        case Luis
        case Tony
        case Noel
        case Ivan
        case Shane
        case Will
    }
    
    var availableBarbers = [Barber]()
    var selectedBarber = Int()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpBarbers()
        self.selectedBarber = 1
        print("noooo")
        // print(self.selectedBarber)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        // self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

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
         print("consolo")
        
        // print(segue.destination)
        let destinationViewController = segue.destination as? UINavigationController
        let addCustomer = destinationViewController?.viewControllers.first as? AddCustomerViewController
        addCustomer?.selectedBarber = self.selectedBarber
//
//        switch(segue.identifier ?? "") {
//        case "addCustomer":
//            guard let addCustomerViewController = segue.destination as? AddCustomerViewController else {
//                fatalError("ERRRRRR")
//            }
//            addCustomerViewController.selectedBarber = self.selectedBarber
//
//        default:
//            fatalError("ERROR")
//        }
        
//        if let destinationViewController = segue.destination as? AddCustomerViewController {
//            print("consolo")
//            // destinationViewController.selectedBarber = self.selectedBarber
//        }
        // segue.destination.selectedBarber = self.selectedBarber
        
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
 

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 7
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! BarberSelectCollectionViewCell
    
        // Configure the cell
        
        cell.barberName.text = availableBarbers[indexPath.item].name
        
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        
        return true
    }

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */
    
    
    private func setUpBarbers() {
        let barber1 = Barber(customers: [], name: "Louie", password: "12345", id: Barbers.Louie.rawValue)
        let barber2 = Barber(customers: [], name: "Luis", password: "1234", id: Barbers.Luis.rawValue)
        let barber3 = Barber(customers: [], name: "Tony", password: "123", id: Barbers.Tony.rawValue)
        let barber4 = Barber(customers: [], name: "Noel", password: "12", id: Barbers.Noel.rawValue)
        let barber5 = Barber(customers: [], name: "Ivan", password: "1245", id: Barbers.Ivan.rawValue)
        let barber6 = Barber(customers: [], name: "Shane", password: "1345", id: Barbers.Shane.rawValue)
        let barber7 = Barber(customers: [], name: "Will", password: "1235", id: Barbers.Will.rawValue)
        availableBarbers = [barber1!, barber2!, barber3!, barber4!, barber5!, barber6!, barber7!]
    }

    @IBAction func saveCustomer(sender: UIStoryboardSegue) {
        guard let addCustomerViewController = sender.source as? AddCustomerViewController else {
            fatalError("DIE")
        }
        guard let customerToAdd = addCustomerViewController.newCustomer else {
            fatalError("asdf")
        }
        
        addCustomerToBarber(newCustomer: customerToAdd, selectedBarber: 2)
        
        dismiss(animated: true, completion: nil)
    }
    
    func addCustomerToBarber(newCustomer: Customer, selectedBarber: Int) {
        switch(selectedBarber) {
        case Barbers.Louie.rawValue:
            availableBarbers[selectedBarber].customers.append(newCustomer)
        case Barbers.Luis.rawValue:
            availableBarbers[selectedBarber].customers.append(newCustomer)
        case Barbers.Noel.rawValue:
            availableBarbers[selectedBarber].customers.append(newCustomer)
        case Barbers.Ivan.rawValue:
            availableBarbers[selectedBarber].customers.append(newCustomer)
        case Barbers.Shane.rawValue:
            availableBarbers[selectedBarber].customers.append(newCustomer)
        case Barbers.Tony.rawValue:
            availableBarbers[selectedBarber].customers.append(newCustomer)
        case Barbers.Will.rawValue:
            availableBarbers[selectedBarber].customers.append(newCustomer)
        default:
            break
        }
    }
    
    
}
