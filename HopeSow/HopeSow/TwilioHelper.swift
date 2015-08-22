//
//  TwilioHelper.swift
//  HopeSow
//
//  Created by XiaotianCao on 8/22/15.
//  Copyright (c) 2015 Adam Cao. All rights reserved.
//

import Foundation
let sid = "ACe11f1fbebc4036e2a3aca5e831930be5"
let token = "ad9b7653cb2506324f9b2dcfb9fc47a8"
let from = "+14125670464"
let url = "https://api.twilio.com/2010-04-01/Accounts/ACe11f1fbebc4036e2a3aca5e831930be5/Messages.json"

public class TwilioHelper{    
    static func sendVerificationCode(code:Int, phoneNumber:String){
        var swiftRequest = SwiftRequest()
        var body = "Here is your code: " + String(code)
        var data = [
            "To" : "4122988170",
            "From" : from,
            "Body" : body
        ]
        var auth = ["username": sid, "password": token]
        
        swiftRequest.post(url, data: data, auth: auth) { (err, response, body) -> () in
            if (err==nil){
                println("success")
            }else{
                println("something is wrong")
            }
        }
    }
}