//
//  ViewController.swift
//  CoreDataApp
//
//  Created by IOS on 4/13/17.
//  Copyright © 2017 dakoze. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var passField: UITextField!
    @IBOutlet weak var listID: UITableView!
    
    @IBOutlet weak var editNameField: UITextField!
    @IBOutlet weak var editPassField: UITextField!
    var countData = 0
    var data:[NSManagedObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GetData()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func insertButton(_ sender: Any) {
        guard let appDel: AppDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let context = appDel.persistentContainer.viewContext
        
        //add new user
        let entity = NSEntityDescription.entity(forEntityName: "Users", in: context)!
        let newUser = NSManagedObject(entity: entity, insertInto: context)
        newUser.setValue(nameField.text, forKeyPath: "usernames")
        newUser.setValue(passField.text, forKeyPath: "passwords")
        
        //add the info to the entity
        do {
            try context.save()
        } catch {
            print("ada error")
        }
        //retrieve the data
        do {
            let request = NSFetchRequest<NSManagedObject>(entityName: "Users")
            let results = try context.fetch(request as! NSFetchRequest<NSFetchRequestResult>)
            if results.count > 0 {
                for items in results as! [NSManagedObject] {
                    let name = items.value(forKeyPath: "usernames")
                    let password = items.value(forKeyPath: "passwords")
                    print(name!, password!)
                } //end of for items
            } //end of if
        } catch {
            print("ada error")
        }
        GetData()
        self.listID.reloadData()
        
        nameField.text = "" //reset isi textfield untuk isian berikutnya
        passField.text = ""  //reset isi textfield untuk isian berikutnya

    }
    
    func GetData() {
        guard let appDel: AppDelegate = (UIApplication.shared.delegate as? AppDelegate) else {
            return
        }

        let context = appDel.persistentContainer.viewContext
        do {
            let request = NSFetchRequest<NSManagedObject>(entityName: "Users")
            let results = try context.fetch(request as! NSFetchRequest<NSFetchRequestResult>)
            self.data = results as! [NSManagedObject]
        } catch {
            print("ada error")
        }
    }
    func changeData()
    {
        guard let appDel: AppDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let context = appDel.persistentContainer.viewContext
        
        do {
            let request = NSFetchRequest<NSManagedObject>(entityName: "Users")
            let results = try context.fetch(request as! NSFetchRequest<NSFetchRequestResult>)
            if results.count > 0 {
                for items in results as! [NSManagedObject] {
                    let name = items.value(forKeyPath: "usernames")
                    let pass = items.value(forKeyPath: "passwords")
                    if name as? String == nameField.text {
                        //edit data where usernames="justin", set to "justinus"
                        items.setValue(editNameField.text, forKeyPath: "usernames")
                        //don't forget to save
                        do {
                            try context.save()
                        } catch {
                            print("ada error")
                        }
                    }
                    if pass as? String == passField.text {
                        //edit data where usernames="justin", set to "justinus"
                        items.setValue(editPassField.text, forKeyPath: "passwords")
                        //don't forget to save
                        do {
                            try context.save()
                        } catch {
                            print("ada error")
                        }
                    }
                } //end of for items
            } //end of if
        } catch {
            print("ada error")
        }
        GetData()
        listID.reloadData()
    } //end of buttonEdit function

    
    
    
    @IBOutlet weak var delButton: UIButton!

    
    @IBAction func editButton(_ sender: Any) {
        changeData()
    }
    
    //MARK: Tableviewcell
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                let cell = tableView.dequeueReusableCell(withIdentifier: "myCell")
        let name = data[indexPath.row].value(forKey: "usernames") as? String ?? ""
        let password = data[indexPath.row].value(forKey: "passwords") as? String ?? ""
        cell?.textLabel?.text = name
        cell?.detailTextLabel?.text = password
                return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let name = data[indexPath.row].value(forKey: "usernames") as? String ?? ""
        let pass = data[indexPath.row].value(forKey: "passwords") as? String ?? ""
        
        nameField.text = name
        passField.text = pass

    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        guard let appDel: AppDelegate = UIApplication.shared.delegate as? AppDelegate else {
        return
        }
            let context = appDel.persistentContainer.viewContext
            let namas = self.data[indexPath.row].value(forKey: "usernames") as? String ?? ""
            do {
                let request = NSFetchRequest<NSManagedObject>(entityName: "Users")
                let results = try context.fetch(request as! NSFetchRequest<NSFetchRequestResult>)
                if results.count > 0 {
                    for items in results as! [NSManagedObject] {
                        let name = items.value(forKeyPath: "usernames")
                        if name as! String == namas {
                            //delete row where usernames="justin"
                            context.delete(items)
                            //don't forget to save
                            do {
                                try context.save()
                            } catch {
                                print("ada error")
                            }
                        }
                    } //end of for items
                } //end of if
            } catch {
                print("ada error")
            }
        GetData()
        listID.reloadData()
        } //end of buttonDel function
    

    
    
}

