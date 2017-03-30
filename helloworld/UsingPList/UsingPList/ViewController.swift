//
//  ViewController.swift
//  UsingPList
//
//  Created by IOS on 3/30/17.
//  Copyright © 2017 IOS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let path = Bundle.main.path(forResource: "myData", ofType: "plist")
        if let d = NSArray(contentsOfFile: path!)
        {
            var count:Int = 0
            for data in d{
               let row = data as! NSDictionary
                for (k,v) in row {
                    if k as! String == "Nilai"
                    {
                        print ("SCORE:")
                        for sc in v as! NSArray{
                            print(sc)
                        }
                    }
                    else {
                        print ("data ke-\(count) =  \(k) , \(v)")
                    }
                    count += 1
                }
        }
            
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

