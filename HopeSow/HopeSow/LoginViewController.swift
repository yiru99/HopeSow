//
//  LoginViewController.swift
//  HopeSow
//
//  Created by XiaotianCao on 8/19/15.
//  Copyright (c) 2015 Adam Cao. All rights reserved.
//

import UIKit
import SwiftHTTP

class LoginViewController: UIViewController {
    var phoneNumberText:UITextField!
    var passwordText:UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        var (centerX, centerY) = AppHelper.getCenterPoints(self.view)
        let loginButton = UIButton.buttonWithType(UIButtonType.System) as! UIButton
        loginButton.frame = CGRectMake(centerX - 50, centerY + 100, 200, 50)
        loginButton.setTitle("Login", forState: UIControlState.Normal)
        phoneNumberText = UITextField(frame: CGRectMake(centerX - 50, centerY-200, 200, 50))
        passwordText = UITextField(frame: CGRectMake(centerX-50, centerY - 100, 200, 50))
        phoneNumberText.placeholder = "enter your phone number"
        passwordText.placeholder = "enter your password"
        self.view.addSubview(phoneNumberText)
        self.view.addSubview(passwordText)
        self.view.addSubview(loginButton)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loginUser(sender:UIButton){
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
