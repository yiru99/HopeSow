//
//  UserVerifyViewController.swift
//  HopeSow
//
//  Created by XiaotianCao on 8/19/15.
//  Copyright (c) 2015 Adam Cao. All rights reserved.
//

import UIKit

class UserVerifyViewController: UIViewController {
    var verifyText:UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        let errorLabel = UILabel(frame: CGRectMake(100, 100, 200, 30))
        errorLabel.textColor = UIColor.redColor()
        verifyText = UITextField(frame: CGRectMake(150, 150, 200, 50))
        verifyText.keyboardType = .NumberPad
        verifyText.placeholder = "Enter the number you just recieved"
        let submitButton = UIButton.buttonWithType(UIButtonType.System) as! UIButton
        submitButton.frame = CGRectMake(verifyText.frame.origin.x, verifyText.frame.origin.y+100, 200, 50)
        submitButton.setTitle("Submit", forState: UIControlState.Normal)
        submitButton.addTarget(self, action: "verifyUser:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(verifyText)
        self.view.addSubview(submitButton)
        self.view.addSubview(errorLabel)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func verifyUser(sender:UIButton){
        var user = PFUser.currentUser()
        var secureNumber:Int = (user?.valueForKey("secureNumber")) as! Int
        if (secureNumber == self.verifyText.text.toInt()!){
            user?.setValue(true, forKey: "phoneVerified")
            user?.saveInBackgroundWithBlock({ (success, error) -> Void in
                if (success){
                    //move to the home page
                }else{
                    
                }
            })
        }
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
