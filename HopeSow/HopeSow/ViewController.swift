//
//  ViewController.swift
//  HopeSow
//
//  Created by XiaotianCao on 8/2/15.
//  Copyright (c) 2015 Adam Cao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    func toLoginPage(sender:UIButton){
        self.performSegueWithIdentifier("toLogin", sender: sender)
    }
    
    func toRegisterPage(sender:UIButton){
        self.performSegueWithIdentifier("toRegister", sender: sender)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let toLoginButton = UIButton.buttonWithType(UIButtonType.System) as! UIButton
        toLoginButton.frame = CGRectMake(100, 100, 100, 50)
//        toLoginButton.backgroundColor = UIColor.greenColor()
        toLoginButton.setTitle("To Login", forState: UIControlState.Normal)
        toLoginButton.addTarget(self, action: "toLoginPage:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(toLoginButton)
    
        let toRegisterButton = UIButton.buttonWithType(UIButtonType.System) as! UIButton
        toRegisterButton.frame = CGRectMake(100, 100, 100, 50)
        toRegisterButton.backgroundColor = UIColor.greenColor()
        toRegisterButton.setTitle("To Register", forState: UIControlState.Normal)
        toRegisterButton.addTarget(self, action: "toRegisterPage:", forControlEvents:
            UIControlEvents.TouchUpInside)
        toRegisterButton.frame.origin.y = toLoginButton.frame.origin.y + 100
        self.view.addSubview(toRegisterButton)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

