//
//  QueryViewController.swift
//  twelvethProjectCoredata
//
//  Created by student on 2018/12/17.
//  Copyright © 2018年 tanglng. All rights reserved.
//

import UIKit
import CoreData

class QueryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var nameTextField: UITextField!
    var ageTextField: UITextField!
    var tableView: UITableView!
    //声明一个Person数组 用于保存查询出的数据
    var persons = [Person]()
    //获取应用的代理 用于数据查询
    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return persons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "Cell")
        }
        
        cell?.textLabel?.text = persons[indexPath.row].name
        cell?.detailTextLabel?.text = String(persons[indexPath.row].age)
        
        return cell!
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.title = "Query"
        
        nameTextField = UITextField(frame: CGRect(x: 10, y: 100, width: 200, height: 44))
        nameTextField.layer.borderWidth = 1
        self.view.addSubview(nameTextField)
        
        let nameBtn = UIButton(frame: CGRect(x: 250, y: 100, width: 100, height: 44))
        nameBtn.setTitle("按名字查找", for: .normal)
        nameBtn.setTitleColor(UIColor.black, for: .normal)
        nameBtn.setTitleColor(UIColor.gray, for: .highlighted)
        nameBtn.addTarget(self, action: #selector(queryWithName), for: .touchUpInside)
        self.view.addSubview(nameBtn)
        
        ageTextField = UITextField(frame: CGRect(x: 10, y: 150, width: 200, height: 44))
        ageTextField.layer.borderWidth = 1
        self.view.addSubview(ageTextField)
        
        let ageBtn = UIButton(frame: CGRect(x: 250, y: 150, width: 100, height: 44))
        ageBtn.setTitle("按年龄查找", for: .normal)
        ageBtn.setTitleColor(UIColor.black, for: .normal)
        ageBtn.setTitleColor(UIColor.gray, for: .highlighted)
        ageBtn.addTarget(self, action: #selector(queryWithAge), for: .touchUpInside)
        self.view.addSubview(ageBtn)
        
        tableView = UITableView(frame: CGRect(x: 0, y: 200, width: self.view.frame.width, height: self.view.frame.height - 200))
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)

    }
    @objc func queryWithName() {
        ageTextField.text = ""
        let context = appDelegate.persistentContainer.viewContext
        
        let name = nameTextField.text
        
        let request: NSFetchRequest<Person> = Person.fetchRequest()
        if name != nil {
            request.predicate = NSPredicate(format: "name = %@", name!)
        }
        if let persons = try? context.fetch(request) {
            self.persons = persons
            tableView.reloadData()
        }
    }
    @objc func queryWithAge() {
        nameTextField.text = ""
        let context = appDelegate.persistentContainer.viewContext
        
        let age = Int16(ageTextField.text!)
        
        let request: NSFetchRequest<Person> = Person.fetchRequest()
        if age != nil {
            request.predicate = NSPredicate(format: "age = %d", age!)
        }
        if let persons = try? context.fetch(request) {
            self.persons = persons
            tableView.reloadData()
        }
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
