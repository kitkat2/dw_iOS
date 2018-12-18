//
//  secondViewController.swift
//  eleventhProjectMutiMVC
//
//  Created by student on 2018/12/15.
//  Copyright © 2018年 dw. All rights reserved.
//

import UIKit

class secondViewController: UIViewController {
    
    var id = ""
    var name = ""
    
    var delegate: stuProtocol?
    
    @IBOutlet weak var stuId: UITextField!
    @IBOutlet weak var stuName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stuId.text = id
        stuName.text = name
        // Do any additional setup after loading the view.
    }
    
    @IBAction func goBack(_ sender: Any) {
        id = stuId.text!
        name = stuName.text!
        
        delegate?.change(name: name, id: id)

        navigationController?.popViewController(animated: true)
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
