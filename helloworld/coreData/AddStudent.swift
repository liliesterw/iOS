//
//  AddStudent.swift
//  coreData
//
//  Created by IOS on 3/30/17.
//  Copyright © 2017 IOS. All rights reserved.
//

import UIKit

class AddStudent: UIViewController {

    @IBOutlet weak var saveB: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func savePressed(_ sender: Any) {
        let ad = UIApplication.shared.delegate as!AppDelegate
        
    }
}
