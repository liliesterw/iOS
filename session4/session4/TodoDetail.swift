//
//  TodoDetail.swift
//  session4
//
//  Created by IOS on 3/16/17.
//  Copyright © 2017 IOS. All rights reserved.
//

import UIKit

class TodoDetail: UIViewController {
    var toDoItem:toDoItem!
    //tanda ! supaya tidak wajib di initialize
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var placeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        //disini kita akan mengisikan data ke text label di UI
        //rapikan dulu UI dengan constraint
        //coba isi data dengan todoitem yg lagi dipilih
        titleLabel.text = toDoItem.title
        descLabel.text = toDoItem.desc
        placeLabel.text = toDoItem.place
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}
