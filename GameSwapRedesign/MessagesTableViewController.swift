//
//  MessagesTableViewController.swift
//  GameSwapRedesign
//
//  Created by Angelo Russo on 22/10/2018.
//  Copyright © 2018 Angelo Russo. All rights reserved.
//

import UIKit

class MessagesTableViewController: UITableViewController {
    
    var sectionTitles = ["Contacts","Suggested"]
    var users = [User]()
    var suggested = [User]()
    //var allPeople = [users, suggested]
    var userLists = [3, 3]
    override func viewDidLoad() {
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        super.viewDidLoad()
        loadSomeUsers()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return sectionTitles.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userLists[section]
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "UserTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? UserTableViewCell else{
            fatalError("Dequeued cell ain't an user cell")
        }
        if indexPath.section==0 {
        let user = users[indexPath.row]
        cell.nameLabel.text = user.name
        cell.profilePicture.image = user.profilePic
        cell.distanceLabel.text = String(user.distance) + " km"
        cell.lastMessageLabel.text = user.conversation[(user.conversation.count)-1]
        
        
        return cell
        } else {
            let user = suggested[indexPath.row]
            cell.nameLabel.text = user.name
            cell.profilePicture.image = user.profilePic
            cell.distanceLabel.text = String(user.distance) + " km"
            cell.lastMessageLabel.text = user.conversation[(user.conversation.count)-1]
            
            
            return cell
        }
        
    }

    
    //MARK: Private methods
    private func loadSomeUsers(){
        let proPic1 = UIImage(named:"Img1")
        let user1 = User(name:"Giovanni", profilePic: proPic1!, distance: 10, conversation: ["Hello", "Hi!"])
        users.append(user1!)
        let proPic2 = UIImage(named:"Img2")
        let user2 = User(name:"DiddleDiddle", profilePic: proPic2!, distance: 22, conversation: ["Okay, see you later"])
        users.append(user2!)
        let proPic3 = UIImage(named:"Img3")
        let user3 = User(name:"DarkAngelCraft", profilePic: proPic3!, distance: 5, conversation: ["I have 4 other games"])
        users.append(user3!)
        let proPic4 = UIImage(named:"Img4")
        let user4 = User(name:"FaviJ", profilePic: proPic4!, distance: 10, conversation: ["7 games in common!"])
        suggested.append(user4!)
        let proPic5 = UIImage(named:"Img5")
        let user5 = User(name:"Sabaku no Maiku", profilePic: proPic5!, distance: 10, conversation: ["5 games in common!"])
        suggested.append(user5!)
        let proPic6 = UIImage(named:"Img6")
        let user6 = User(name:"Filthy Frank", profilePic: proPic6!, distance: 35, conversation: ["1 game in common!"])
        suggested.append(user6!)
    }
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
