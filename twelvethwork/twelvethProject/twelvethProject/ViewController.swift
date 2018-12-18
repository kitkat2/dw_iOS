//
//  ViewController.swift
//  twelvethProject
//
//  Created by student on 2018/12/15.
//  Copyright © 2018年 dw. All rights reserved.
//

import UIKit
import  SQLite3

class ViewController: UIViewController {

    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var phoneTF: UITextField!
     let db = SQLiteDB.shared
    override func viewDidLoad() {
        super.viewDidLoad()
        _ = db.open(dbPath: "", copyFile: true)
        let r = db.execute(sql: "create table if not exists person(name varchar(20), phone varchar(20))")
        print(r)
//        print(NSHomeDirectory())
//        print(Bundle.main.bundlePath)
    }
    @IBAction func add(_ sender: Any) {
       let r = db.execute(sql: "insert into person(name,phone) values('\(nameTF.text!)','\(phoneTF.text!)')")
        print(r)
    }
    
    @IBAction func update(_ sender: Any) {
        let r = db.execute(sql: "update person set phone = '\(phoneTF.text!)' where name = ('\(nameTF.text!)')")
        print(r)
    }
    
    @IBAction func del(_ sender: Any) {
        let r = db.execute(sql: "delete from person where name = ('\(nameTF.text!)')")
        print(r)
    }
    
    @IBAction func query(_ sender: Any) {
        let persons = db.query(sql: "select * from person where name = '\(nameTF.text!)'")
        if let person = persons.first, let phone = person["phone"] as? String {
            phoneTF.text = phone
        }
    }
}

