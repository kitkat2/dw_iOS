//
//  person.swift
//  eightProject
//
//  Created by student on 2018/12/15.
//  Copyright © 2018年 dw. All rights reserved.
//

import Foundation

//枚举类Gender的定义
enum Gender:Int {
    case female,male,unknown
    // static func < (gender1: Gender, gender2: Gender) ->Bool{
    //     return gender1.rawValue < gender2.rawValue
    // }
}
//枚举类Department的定义
enum Department:Int {
    case departA, departB, departC, departD
}
//新建一个协议SchoolProtocol
protocol SchoolProtocol{
    var department: Department {get set}
    func lendBook()
}
//Person类的定义
class Person {
    //Person类属性定义
    var firstName:String
    var lastName:String
    var age:Int
    var gender:Gender
    var fullName:String { return firstName + " " + lastName }
    //构造函数
    init (firstName:String, lastName:String, age:Int, gender:Gender){
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
        self.gender = gender
    }
    //便利构造函数
    convenience init (firstName:String, lastName:String) {
        self.init (firstName: firstName, lastName: lastName,age: 19, gender: Gender.male)
    }
    //信息显示
    var printInfo: String {
        return "Name: \(fullName) Age: \(age) Gender: \(gender)"
    }
    //==和!=重载，用于比较两个Person类实例是否相同
    static func == (person1:Person, person2:Person) -> Bool {
        return (person1.fullName == person2.fullName && person1.age == person2.age && person1.gender == person2.gender)
    }
    static func != (person1:Person, person2:Person) -> Bool {
        return (person1.fullName != person2.fullName || person1.age != person2.age || person1.gender != person2.gender)
    }
    //run
    func run () {
        print("Person \(self.fullName) is running")
    }
}

//Person类的派生类Teacher类
class Teacher: Person,SchoolProtocol {
    //Teacher类新增属性title的定义
    var title: String
    //department属性的实现
    var department: Department
    //构造函数
    init (firstName:String, lastName:String, age:Int, gender:Gender, title: String, department:Department){
        self.title = title
        self.department = department
        super.init(firstName: firstName, lastName: lastName, age: age, gender: gender)
    }
    //显示信息
    override var printInfo:String {
        return super.printInfo + " Title: \(title) Department: \(department)"
    }
    override func run () {
        print("Teacher \(self.fullName) is running")
    }
    //lendBook的实现
    func lendBook(){
        print("随便写了点内容")
    }
}

//Person类的派生类Student类
class Student: Person ,SchoolProtocol{
    //Student类新增属性stuNo的定义
    var stuNo: String
    //department属性的实现
    var department:Department
    //构造函数
    init (firstName:String, lastName:String, age:Int, gender:Gender, stuNo: String, department: Department){
        self.stuNo = stuNo
        self.department = department
        super.init(firstName: firstName, lastName: lastName, age: age, gender: gender)
    }
    convenience init(stuNo: String, firstName: String, lastName: String, age: Int, gender: Gender) {
        self.init(firstName: firstName, lastName: lastName, age: age, gender: gender, stuNo: stuNo, department: .departB)
    }
    init(stuNo: String, department: Department) {
        self.stuNo = stuNo
        self.department = department
        super.init(firstName: "", lastName: "", age: 0, gender: Gender.unknown)
    }
    
    required convenience init() {
        self.init(stuNo: "2018110100", department: .departB)
    }

    //显示信息
    override var printInfo:String {
        return super.printInfo + " StudentNo: \(stuNo) Department: \(department)"
    }
    override func run () {
        print("Student \(self.fullName) is running")
    }
    //lendBook的实现
    func lendBook(){
        print("又随便写了点内容")
    }
}
//    //多个类实例的构建
//    //Person类
//    var person1 = Person(firstName: "Finn", lastName: "Wolfhard", age: 15 , gender: Gender.male)
//    print(person1.printInfo)
//    var person2 = Person(firstName: "Tarjei", lastName: "Sandvikmoe")
//    print(person2.printInfo)
//    var person3 = Person(firstName: "Tao", lastName: "Lu", age: 30 , gender: Gender.male)
//    //Teacher类
//    var teacher1 = Teacher(firstName: "John", lastName: "Keating", age: 35, gender: Gender.male, title: "principal", department: Department.departA)
//    var teacher2 = Teacher(firstName: "Graham", lastName: "Coxon", age: 49, gender: Gender.male, title: "guitar_teacher", department: Department.departA)
//    print(teacher1.printInfo)
//    //Student类
//    var studentA = Student(firstName: "Maria", lastName: "Ray", age: 18, gender: Gender.female, stuNo: "2018010101",department: Department.departD)
//    print(studentA.printInfo)
//    var studentB = Student(firstName: "James", lastName: "Mcavoy", age: 19, gender: Gender.male, stuNo: "2018010102",department: Department.departB)
//
//    //判断是否为同一人
//
//    var isEqual = (person1 == person2)
//    var isNotEqual = (person1 != person2)
//    print("Are they the same person?")
//    if isEqual || !isNotEqual{
//    print("Yes, they are the same person")
//    }
//    else{
//        print("No, they are different persons")
//    }
//
//    //创建人群数组
//    var people = [person1, person2, person3, teacher1, teacher2, studentA, studentB]
//    var result = [
//    "pTotalNo": 0,
//    "tTotalNo": 0,
//    "sTotalNo": 0
//    ]
