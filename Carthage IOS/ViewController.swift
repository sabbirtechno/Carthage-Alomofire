//
//  ViewController.swift
//  Carthage IOS
//
//  Created by Sabbir Hossain on 1/14/20.
//  Copyright © 2020 Sabbir Hossain. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    

    @IBOutlet weak var txtview: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func btn(_ sender: Any) {
        

       

        //Alamofire.request(.GET, "", encoding: .URL)
        Alamofire.request("https://api.darksky.net/forecast/5c74c06e261c64b3a2f6e1abfb7fe85d/37.8267,-122.4233").responseJSON { response in
            print(response.request as Any)  // original URL request
            print(response.response as Any) // URL response
            print(response.result.value as Any)   // result of response serialization
            
            self.txtview.text = response.description
        }
        
       
    }

}


