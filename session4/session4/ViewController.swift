//
//  ViewController.swift
//  session4
//
//  Created by IOS on 3/16/17.
//  Copyright © 2017 IOS. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var tv1: UITableView!
    var todoArr:[toDoItem] = [toDoItem("Mooncake","Tahir","PTC CGV"),toDoItem("HAhha","HAHAHA","Haha")]
    // .append untuk menambahkan data
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //jumlah data
        return todoArr.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        //jumlah section
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //data pada index ke- (harus return cell)
        let cell:UITableViewCell = tv1.dequeueReusableCell(withIdentifier: "mycell")!
        let i  = indexPath.row
            // baris ke berapa yang mau diisi
        cell.textLabel?.text = todoArr[i].title
        cell.detailTextLabel?.text = todoArr[i].desc
        return cell
    }
    @IBAction func addClicked(_ sender: Any) {
        let al=UIAlertController(title: "Add Todo", message: "Add New Todo Data", preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .default) { (e) in
            let new = al.textFields?[0].text
            let news = al.textFields?[1].text
            self.todoArr.append(toDoItem(new!,news!,""))
            self.tv1.reloadData()
        }
        let cancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        
        al.addTextField { (tf) in
            tf.placeholder = "Title"
        }
        al.addTextField { (tf) in
            tf.placeholder = "Description"
        }
        al.addAction(ok)
        al.addAction(cancel)
        present(al, animated:true, completion: nil)
    
        }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        //mengirim data ketika segue di-trigger
        if(segue.identifier == "detailSegue"){
            //table view cell diclick, akan ke halaman lain
            let vc = segue.destination as! TodoDetail
            vc.toDoItem = self.todoArr[(tv1.indexPathForSelectedRow?.row)!]
        }
    }
}
    


