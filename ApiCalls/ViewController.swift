//
//  ViewController.swift
//  ApiCalls
//
//  Created by tharun kumar on 23/01/20.
//  Copyright © 2020 tharun kumar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var URLReq : URLRequest!
    var dataTask : URLSessionDataTask!

    @IBOutlet weak var stateLbl: UILabel!
    @IBOutlet weak var cityLbl: UILabel!
    
    var cityArray = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        apiCalling()
        
    }
    
    
    func apiCalling(){
        
        URLReq = URLRequest(url: URL(string: "https://www.brninfotech.com/tws/IndiaDetails.php?type=states&quantity=15")!)
        dataTask = URLSession.shared.dataTask(with: URLReq, completionHandler: { (data, res, err) in
            print(data!)
            
            do{
                let convertedData = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) as! [String]
                print(convertedData)
                
                DispatchQueue.main.async {
                    self.cityArray = convertedData
                }
                
            }
            
            catch{
                print("Error Occured")
            }
            
            })
        dataTask.resume()
        
    }

    
    @IBAction func onTapBtn(_ sender: Any) {
        
    }
    

}

