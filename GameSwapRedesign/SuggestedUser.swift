//
//  SuggestedUser.swift
//  GameSwapRedesign
//
//  Created by Angelo Russo on 22/10/2018.
//  Copyright © 2018 Angelo Russo. All rights reserved.
//

import UIKit

class SuggestedUser {
    
    var name: String
    var profilePic: UIImage?
    var distance: Int
    var gamesHave: Int
    var gamesWant: Int
    
    init?(name: String, profilePic: UIImage, distance: Int, gamesHave: Int, gamesWant: Int){
        self.name = name
        self.profilePic = profilePic
        self.distance = distance
        self.gamesHave = gamesHave
        self.gamesWant = gamesWant
    }
}
