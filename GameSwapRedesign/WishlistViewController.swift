//
//  WishlistViewController.swift
//  GameSwapRedesign
//
//  Created by Angelo Russo on 18/10/2018.
//  Copyright © 2018 Angelo Russo. All rights reserved.
//

import UIKit

class WishlistViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, DataEnteredDelegate {
    
    
    func userDidEnterInformation(info: String) {
        data.append(info)
        filteredData = data
        wishlistTable.reloadData()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toAddGame"{
            let secondVC: AddAGameViewController = segue.destination as! AddAGameViewController
            secondVC.delegate = self
        }
    }
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var wishlistTable: UITableView!
    
    var data = ["Shrek 2", "Asphalt 9: Legends", "Minecraft", "Bugs Bunny: Lost in Time", "Madagascar", "Fortnite"]
    
    var filteredData = [String]()
    var searching = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        wishlistTable.dataSource = self
        wishlistTable.delegate = self
        
        filteredData = data
        
        wishlistTable.tableFooterView = UIView(frame: CGRect.zero)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cella", for: indexPath) as UITableViewCell
        if searching {
            cell.textLabel?.text = filteredData[indexPath.row]
        } else{
            cell.textLabel?.text = data[indexPath.row]
        }
        cell.textLabel?.textColor = .white ;
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching{
            return filteredData.count
        }else {
            return data.count
        }
    }
    
    //    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
    //        searchBar.setShowsCancelButton(true, animated: true)
    //
    //        return true
    //    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
        searchBar.text = ""
        searchBar.resignFirstResponder()
        
        wishlistTable.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filteredData = data.filter({$0.prefix(searchText.count) == searchText})
        searching = true
        wishlistTable.reloadData()
        
//        if !searchBar.text!.isEmpty{
//            // When there is no text, filteredData is the same as the original data
//            // When user has entered text into the search box
//            // Use the filter method to iterate over all items in the data array
//            // For each item, return true if the item should be included and false if the
//            // item should NOT be included
//
//            filteredData = searchText.isEmpty ? data : data.filter({(dataString: String) -> Bool in
//                // If dataItem matches the searchText, return true to include it
//                return dataString.range(of: searchText, options: .caseInsensitive) != nil
//            })
//
//            wishlistTable.reloadData()
//        }
    }
    
}
