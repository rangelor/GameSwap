//
//  User.swift
//  GameSwapRedesign
//
//  Created by Angelo Russo on 22/10/2018.
//  Copyright © 2018 Angelo Russo. All rights reserved.
//

import UIKit

class User {
    var name: String
    var profilePic: UIImage?
    var distance: Int
    var conversation: [String]
    var isNew: Bool
    
    init?(name: String, profilePic: UIImage, distance: Int, conversation: [String]) {
        self.name = name
        self.profilePic = profilePic
        self.distance = distance
        self.conversation = conversation
        self.isNew = (conversation[0] == "")
    }
    
    
}
