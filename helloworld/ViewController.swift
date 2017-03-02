//
//  ViewController.swift
//  helloworld
//
//  Created by IOS on 3/2/17.
//  Copyright © 2017 IOS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var Lname: UILabel!
    @IBOutlet weak var Lage: UILabel!
    @IBOutlet weak var TFname: UITextField!
    @IBOutlet weak var TFage: UITextField!
    @IBOutlet weak var Lhelloworld: UILabel!
    @IBOutlet weak var Bclick: UIButton!
    @IBOutlet weak var TVresult: UITextView!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var scoreL: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
   
    @IBOutlet weak var gender: UISwitch!

    override func viewDidLoad() {
        super.viewDidLoad()
       slider.value = 0
        gender.setOn(false, animated:true)
        sliderChange(slider)
       // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func genderChanged(_ sender: Any) {
        if ( gender.isOn )
        {
            genderLabel.text = "Male"
        }
        else {
            genderLabel.text = "Female"
        }

    }
    
    
    @IBAction func buttonClicked(_ sender: Any) {
        print("Hello, your name is \(TFname.text!), age \(TFage.text!)")
        // variabel .text optional artinya dia tidak yakin kalo itu ada isinya. Untuk meyakinkan bahwa ada valur nya, dikasi tanda seru seru abis text. (var.text!)
        if(TFname.text?.characters.count==0 || TFage.text?.characters.count==0)
        {
            let al=UIAlertController(title: "Wrong Input", message:"name and age should not be empty", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default, handler: { (e) in
                
                
            })
            al.addAction(ok)
            self.present(al, animated:true, completion:{ (e) in
                print("alert is shown")
            }
            
            )
            return
        }
            let al2 = UIAlertController (title : "Verification", message:"name : \(TFname.text) and age : \(TFage.text)" , preferredStyle : .alert)
            let ok2 = UIAlertAction(title: "Save", style: .default, handler:
            {(e) in
                self.TVresult.text = self.TVresult.text + "Hello, your name is \(self.TFname.text!), age \(self.TFage.text!)"
                
                
                self.TFname.text=""
                self.TFage.text=""
            })
        
        let cancel = UIAlertAction (title : "Cancel", style :.default , handler :nil)
        al2.addAction(ok2)
        al2.addAction(cancel)
        self.present(al2, animated:true, completion:nil);
        
    }
    
    @IBAction func sliderChange(_ sender: Any) {
        var val:Float = (sender as! UISlider).value // 0-1
        val *= 100
        scoreL.text = String(round(val))
    }
}

