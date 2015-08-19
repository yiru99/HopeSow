//
//  RegistrationViewController.swift
//  HopeSow
//
//  Created by XiaotianCao on 8/19/15.
//  Copyright (c) 2015 Adam Cao. All rights reserved.
//

import UIKit


class RegistrationViewController: UIViewController {
    var phonenumberText:UITextField!
    var passwordText:UITextField!
    var errorLabel:UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let centerX = self.view.center.x
        let centerY = self.view.center.y
        self.errorLabel = UILabel(frame: CGRectMake(centerX-100, centerY-200, 200, 50))
        self.errorLabel.textColor = UIColor.redColor()
        self.phonenumberText = UITextField(frame: CGRectMake(centerX-100, centerY-100, 200, 50))
        self.passwordText = UITextField(frame: CGRectMake(centerX-100, centerY-50, 200, 50))
        phonenumberText.placeholder = "Enter your phone number"
        passwordText.placeholder = "Enter your password"
        phonenumberText.borderStyle = UITextBorderStyle.Line
        passwordText.borderStyle = UITextBorderStyle.Line
        passwordText.secureTextEntry = true
        self.view.addSubview(phonenumberText)
        self.view.addSubview(passwordText)
        let registerButton = UIButton.buttonWithType(UIButtonType.System) as! UIButton
        registerButton.frame = CGRectMake(passwordText.frame.origin.x, passwordText.frame.origin.y+100, 200, 50)
        registerButton.setTitle("Register", forState: UIControlState.Normal)
        registerButton.addTarget(self, action: "registerUser:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(registerButton)
        self.view.addSubview(errorLabel)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent)
    {
        self.view.endEditing(true)
    }
    
    func registerUser(sender:UIButton){
        var phonenumber:String = phonenumberText.text
        var password:String = passwordText.text
        if (phonenumber.isEmpty || password.isEmpty){
            self.errorLabel.text = "Please fill all fields"
            
        }else{
            var user = PFUser()
            var randomNumber = Int(print(arc4random_uniform(1000000)))
            print(randomNumber)
            user.password = password
            user.username = phonenumber
            user.setValue(false, forKey: "phoneVerified")
            user.setValue(randomNumber, forKey: "secureNumber")
            user.signUpInBackgroundWithBlock({ (success, error) -> Void in
                    if (success){
                        self.performSegueWithIdentifier("registerToVerify", sender: sender)
                        PFUser.logOut()// don't login user yet
                    }else{
                        self.errorLabel.text = "Unable to signup user"
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
