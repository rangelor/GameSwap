//
//  ViewController.swift
//  GameSwapper
//
//  Created by Flavio Svevo Scotto on 17/10/2018.
//  Copyright © 2018 Flavio Svevo Scotto. All rights reserved.
//

import UIKit
import Foundation

class LoginViewController: UIViewController {
    @IBOutlet weak var login: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var getStarted: UIButton!
    @IBOutlet weak var signUpLabel: UILabel!
    @IBOutlet weak var signUpButton: UIButton!
    
    
    
    let glacialFont = UIFont(name: "GlacialIndifference-Bold", size: 16)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Letter Spacing UIBUTTON getStarted + color and font
        let title = getStarted.title(for: .normal)
        let getStartedSpacedTitle = NSAttributedString(string: title!, attributes: [NSAttributedString.Key.kern:6.0, NSAttributedString.Key.font: glacialFont!, NSAttributedString.Key.foregroundColor: UIColor.white])
        
        getStarted.setAttributedTitle(getStartedSpacedTitle, for:.normal)
        
        
        //Letter Spacing login password textField
        //        login.defaultTextAttributes.updateValue(4.0, forKey: NSMutableAttributedString.Key.kern)
        //        password.defaultTextAttributes.updateValue(4.0, forKey: NSMutableAttributedString.Key.kern)
        
        
        //Letter Spacing login password placeholder + placeholder color
        login.attributedPlaceholder = NSAttributedString(string: "LOGIN", attributes:[NSAttributedString.Key.kern: 4.0,NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        password.attributedPlaceholder = NSAttributedString(string: "PASSWORD", attributes:[NSAttributedString.Key.kern: 4.0,NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        
        
        //Setting Bottom login password line from extension class
        login.setBottomLine(borderColor: UIColor.white)
        password.setBottomLine(borderColor: UIColor.white)
        
        //        signUpLabel.attributedText = NSAttributedString(string: "DON'T HAVE AN ACCOUNT?", attributes: [NSAttributedString.Key.kern:4.0])
        
        //
        //        let textSignUpButton = signUpButton.title(for: .normal)
        //        let signUpButtonSpacedTitle = NSAttributedString(string: textSignUpButton!, attributes:[NSAttributedString.Key.kern: 4.0])
        
        //        signUpButton.setAttributedTitle(signUpButtonSpacedTitle, for: .normal)
        
    }
    
    //    override var prefersStatusBarHidden: Bool {
    //        return true
    
}

extension UITextField {
    func setBottomLine(borderColor: UIColor) {
        
        self.borderStyle = UITextField.BorderStyle.none
        self.backgroundColor = UIColor.clear
        
        let borderLine = UIView()
        let height = 1.0
        borderLine.frame = CGRect(x: 0, y: Double(self.frame.height + 2) - height, width: Double(self.frame.width), height: height)
        
        borderLine.backgroundColor = borderColor
        self.addSubview(borderLine)
    }
}
