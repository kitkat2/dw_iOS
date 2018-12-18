//
//  ViewController.swift
//  thirthProjectThread
//
//  Created by student on 2018/12/17.
//  Copyright © 2018年 tanglng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var sumLabel: UILabel!
    
    @IBOutlet weak var countLabel: UILabel!
    var count =  0
    override func viewDidLoad() {
        super.viewDidLoad()
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true){
            (timer) in
            self.count += 1
            self.countLabel.text = "\(self.count)"
        }
    }
    @IBAction func sum(_ sender: Any) {
        var sum = 0
        DispatchQueue.global().async {
            for i in 1...99999999 {
                sum += i
                
            }
            DispatchQueue.main.sync {
                self.sumLabel.text = "\(sum)"
            }
        }
    }
}

