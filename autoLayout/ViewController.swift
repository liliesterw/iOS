//
//  ViewController.swift
//  autoLayout
//
//  Created by IOS on 3/9/17.
//  Copyright © 2017 IOS. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var submitButton: UIButton!

    @IBOutlet weak var hobbyP: UIPickerView!
    @IBOutlet weak var dateP: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()
        print( "view is loadedd")
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewDidAppear(_ animated: Bool) {
        print( "view is appearing")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func submitClicked(_ sender: Any) {
        let format = DateFormatter()
        format.dateFormat = "dd MM yyyy"
        let dateS = format.string(from: dateP.date)
        let al = UIAlertController(
            title : "Chossen Date",
            message : "Chosen Date is \(dateS)",
            preferredStyle : .alert
        )
        let ok = UIAlertAction(
            title : "OK",
            style : .default,
            handler : nil
        )
        al.addAction(ok)
        present(al, animated:true, completion: nil)
        let row = hobbyP.selectedRow(inComponent: 0)
        let hobby = hobbyArr[row]
        print("Hobby \(hobby) ")
    }
    
    var hobbyArr = ["main","TV"]
    var hobbyArr1 = ["iOS","Windows","Linux"]
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if(component == 0 )
        {
            return hobbyArr1.count
        }
        return hobbyArr.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if(component == 0 )
        {
            return hobbyArr1[row]
        }
        return hobbyArr[row]
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
}

