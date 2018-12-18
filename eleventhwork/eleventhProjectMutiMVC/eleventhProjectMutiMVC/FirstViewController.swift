//
//  ViewController.swift
//  eleventhProjectMutiMVC
//
//  Created by student on 2018/12/15.
//  Copyright © 2018年 dw. All rights reserved.
//

import UIKit
protocol stuProtocol {
    func change(name:String, id:String)
}

class FirstViewController: UIViewController,stuProtocol {
    
    func change(name: String, id: String) {
        self.name = name
        self.id = id
    }
    
    var name = ""
    var id = ""

    @IBOutlet weak var stuId: UITextField!
    @IBOutlet weak var stuName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewWillAppear(_ animated: Bool) {
        stuId.text = id
        stuName.text = name
    }
    @IBAction func showSecondVC(_ sender: Any) {
        
        let second = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SecondVC") as! secondViewController
        
        second.id = stuId.text!
        second.name = stuName.text!
        
        second.delegate = self
        
        self.navigationController?.pushViewController(second, animated: true)
    }
    

}

