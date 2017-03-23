//
//  ViewController.swift
//  usingdata
//
//  Created by IOS on 3/23/17.
//  Copyright © 2017 IOS. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    @IBOutlet weak var userT: UITextField!
    @IBOutlet weak var passT: UITextField!
    @IBOutlet weak var volS: UISlider!
    @IBOutlet weak var autoPlay: UISwitch!
    @IBOutlet weak var founderTV: UITableView!
    @IBOutlet weak var helpS: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passT.isSecureTextEntry = true // supaya input type = password
        let ud = UserDefaults.standard
        
        userT.text = ud.value(forKey: "user") as! String?
        if let vol = getud().value(forKey: "volume") as? Float {
            volS.value = vol
        }
        else {
         volS.value = 0.9
        }
        if let apOn = getud().value(forKey: "AutoPlay") as? Bool
        {
            autoPlay.setOn(apOn, animated: true)
        }
        else {
            autoPlay.setOn(true, animated: true)
        }
        if let HelpOn = getud().value(forKey: "help") as? Bool
        {
            helpS.setOn(HelpOn, animated: true)
        }
        else {
            helpS.setOn(true, animated: true)
        }
        
        
    }
    override func viewDidAppear(_ animated: Bool) {
        if (helpS.isOn) {
            let alert = UIAlertController(title: "HAHA", message: "HOHO", preferredStyle: .alert)
            let action = UIAlertAction(title: "mumu", style: .default	, handler: nil)
            alert.addAction(action)
            
            present(alert, animated:true, completion: nil)
           let ud = UserDefaults.standard
            ud.set(false, forKey: "help")
            helpS.setOn(false, animated: true)
        }
        
        
    }
    func getud()->UserDefaults{
        return UserDefaults.standard
    }
    @IBAction func helpChanged(_ sender: Any) {
        getud().set(helpS.isOn, forKey:"help")
    }
    
    @IBAction func loginClicked(_ sender: UIButton) {
    //username akan tersimpan di userDefault
    let ud = UserDefaults.standard
        ud.set(userT.text, forKey:"user")
    }
    
    @IBAction func volChanged(_ sender: Any) {
        getud().set(volS.value, forKey: "volume")
    }
    @IBAction func autoplaychanged(_ sender: Any) {
        getud().set(autoPlay.isOn, forKey:"AutoPlay")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! MyCell
        cell.nameL.text = "Name Here"
        cell.phoneL.text = "Phone here"
        cell.companyL.text = "Company here"
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

}

