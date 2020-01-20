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
           // print(response.request as Any)  // original URL request
            //print(response.response as Any) // URL response
            // print(response.result.value as Any)   // result of response serialization
            
            var temp : Double = 0.0
            if let jsonDictionary = response.result.value as? [String : Any] {
                if let currentWeatherDictionary = jsonDictionary["currently"] as? [String : Any]{
                    let summary = currentWeatherDictionary["summary"] as? String
                    temp = currentWeatherDictionary["temperature"] as? Double ?? 0.0
                    
                    //Below code for converting double type too string
                    // self.text_view.text = String(temp)
                    
                    //let date = NSDate( 1579168388 )
                    //let date = NSDate(timeIntervalSince1970: 1579168388)
                    
                    let time = currentWeatherDictionary["time"] as! Int
                    print(time)
                    
                    let date = Date(timeIntervalSince1970: 1579168388)
                    let dateFormatter = DateFormatter()
                    dateFormatter.timeZone = TimeZone(abbreviation: "GMT") //Set timezone that you want
                    dateFormatter.locale = NSLocale.current
                    dateFormatter.dateFormat = "dd-MM-yyyy HH:mm a" //Specify your format that you want //"dd-MM-yyyy HH:mm"
                    let strDate = dateFormatter.string(from: date as Date)
                    
                  //  let date = "09:53 AM
                   // DateFormatter.dateFormat; "16-jan-2020" //Specify your format that you want
                    //let strDate = DateFormatter.string(from: Date)
                    
                   // self.txtview.text = summary
                   // print(currentWeatherDictionary)
                    
                    self.txtview.text = strDate
                    
                    print("=====")
                    
                    print(strDate)
                    
                //    print(jsonDictionary)
                    
                }
            }
        }
    }

}
