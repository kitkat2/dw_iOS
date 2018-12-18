//
//  ViewController.swift
//  eightProject
//
//  Created by student on 2018/12/8.
//  Copyright © 2018年 dw. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate,UITableViewDataSource {
    //student
    var students = [Student]()
    //teacher
    var teachers = [Teacher]()
    //表头
    var tableTitle = ["Teacher", "Student"]
    //表视图
    var table: UITableView!
    //弹出框
    var alert: UIAlertController!
    //按钮
    var rightBtn: UIBarButtonItem!
    var leftBtn: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Table"
        self.view.backgroundColor = UIColor.white
        //Do any additional setup after loading the view, typically from a nib.
        //多个类实例的构建
        //Teacher类
        let teacher1 = Teacher(firstName: "John", lastName: "Keating", age: 35, gender: Gender.male, title: "principal", department: Department.departA)
        let teacher2 = Teacher(firstName: "Graham", lastName: "Coxon", age: 49, gender: Gender.male, title: "guitar teacher", department: Department.departA)
        teachers.append(teacher1)
        teachers.append(teacher2)
        //Student类
        let studentA = Student(firstName: "Maria", lastName: "Ray", age: 18, gender: Gender.female, stuNo: "2018010101",department: Department.departD)
        let studentB = Student(firstName: "James", lastName: "Mcavoy", age: 19, gender: Gender.male, stuNo: "2018010102",department: Department.departB)
        let studentC = Student(firstName: "Finn", lastName: "Wolfhard", age: 15 , gender: Gender.male,stuNo: "2018010103",department: Department.departB)
        let  studentD = Student(firstName: "Tarjei", lastName: "Sandvikmoe", age: 20, gender: .male,stuNo: "2018010104",department: Department.departB)
        students.append(studentA)
        students.append(studentB)
        students.append(studentC)
        students.append(studentD)
        

      
        
        students.sort(by: { (s1,s2) -> Bool in
            return s1.age < s2.age
        })
        
        teachers.sort(by: { (t1,t2) -> Bool in
            return t1.age < t2.age
        })
        
        //创建表视图，并设置代理和数据源
        table = UITableView(frame: self.view.bounds)
        table.delegate = self
        table.dataSource = self
        self.view.addSubview(table)
        
        //导航栏控制器右边的按钮
        rightBtn = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(edit))
        self.navigationItem.rightBarButtonItem = rightBtn
        
        //导航栏控制器左边的按钮
        leftBtn = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addStu))
        self.navigationItem.leftBarButtonItem = leftBtn
  
    }

    
    //指定表视图中单元格行数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return teachers.count
        }else {
            return students.count
        }
    }
    
    //指定表视图中的单元格
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //初始化一个identifier常量 用于单元格的重用
        let identifier = tableTitle[indexPath.section]
        //从队列中取出单元格
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        
        //初始化cell 并设置其样式
        if cell == nil{
            let style: UITableViewCell.CellStyle = (identifier == "Teacher") ? .subtitle : .default
            cell = UITableViewCell(style: style, reuseIdentifier: identifier)
            cell?.accessoryType = .disclosureIndicator
        }
        //展示数据
        switch identifier {
        case "Student":
            cell?.textLabel?.text = students[indexPath.row].fullName
        case "Teacher":
            cell?.textLabel?.text = teachers[indexPath.row].fullName
            cell?.detailTextLabel?.text = teachers[indexPath.row].title
        default:
            break
        }
        return cell!
    }
    
    //指定section数
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableTitle.count
    }
    //指定每一个section的头
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return tableTitle[section]
    }
   
    
    //edit
    @objc func edit() {
        if table.isEditing {
            rightBtn.title = "Edit"
            table.isEditing = false
        } else {
            rightBtn.title = "OK"
            table.isEditing = true
        }
    }
    //delete
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            if indexPath.section == 0{
                teachers.remove(at: indexPath.row)
            }else{
                students.remove(at: indexPath.row)
            }
            table.deleteRows(at: [indexPath]
                , with: .fade)
        }
    }
    //move
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let name = students.remove(at: sourceIndexPath.row)
        students.insert(name, at: sourceIndexPath.row)
    }
    
     //add
    @objc func addStu() {
        alert = UIAlertController(title: "add students' information", message: nil, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (action) in
            self.add()
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil))
        alert.addTextField { (textField) in
            textField.placeholder = "Student ID"
        }
        alert.addTextField { (textField) in
            textField.placeholder = "Firstname"
        }
        alert.addTextField { (textField) in
            textField.placeholder = "Lastname"
        }
        alert.addTextField { (textField) in
            textField.placeholder = "Gender"
        }
        alert.addTextField { (textField) in
            textField.placeholder = "Age"
            }
        self.present(alert, animated: true, completion: nil)
        
    }
    func add() {
        let num = alert.textFields![0].text!
        let firstName = alert.textFields![1].text!
        let lastName = alert.textFields![2].text!
        let age = Int(alert.textFields![3].text!)
        let gender:Gender
        switch alert.textFields![4].text! {
        case "male":
            gender = .male
        case "female":
            gender = .female
        default:
            gender = .unknown
        }
        let student = Student(stuNo:num , firstName:firstName, lastName: lastName,age:age ?? 18,gender:gender)
        students.append(student)
        table.reloadData()
    }
   

}

