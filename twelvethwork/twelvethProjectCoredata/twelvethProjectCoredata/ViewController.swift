//
//  ViewController.swift
//  twelvethProjectCoredata
//
//  Created by student on 2018/12/17.
//  Copyright © 2018年 tanglng. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    //视图中的表
    var tableView: UITableView!
    //保存数据库中的数据
    var personArray = [Person]()
    //应用代理
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Persons"
        self.view.backgroundColor = UIColor.white
        
        tableView = UITableView(frame: self.view.frame)
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
        
        let searchBtn = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(query))
        self.navigationItem.leftBarButtonItem = searchBtn
        
        let addBtn = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(add))
        self.navigationItem.rightBarButtonItem = addBtn

    }
    @objc func query() {
        let viewController = QueryViewController()
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc func add() {
        let viewController = InsertViewController()
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    // MARK: data source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "Cell")
            cell?.accessoryType = .disclosureIndicator
        }
        
        cell?.textLabel?.text = personArray[indexPath.row].name
        cell?.detailTextLabel?.text = String(personArray[indexPath.row].age)
        
        return cell!
    }
    override func viewWillAppear(_ animated: Bool) {
        let context = appDelegate.persistentContainer.viewContext
        
        let request: NSFetchRequest<Person> = Person.fetchRequest()
        
        if let persons = try? context.fetch(request) {
            personArray = persons
        }
        tableView.reloadData()
    }
    // MARK: delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = InsertViewController()
        viewController.row = indexPath.row
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            personArray.remove(at: indexPath.row)
            tableView.reloadData()
            
            DispatchQueue.global().async {
                let context = self.appDelegate.persistentContainer.viewContext
                
                let request: NSFetchRequest<Person> = Person.fetchRequest()
                if let persons = try? context.fetch(request) {
                    context.delete(persons[indexPath.row])
                    self.appDelegate.saveContext()
                }
            }
        }
    }

}

