//
//  ViewController.swift
//  ninethProjectAlert
//
//  Created by student on 2018/12/13.
//  Copyright © 2018年 dw. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //声明一个UIView的属性，用于改变背景颜色进行交互
    var colorChange: UIView!
    //声明一个UILabel类型的属性，用于保存用户输入的用户名和密码
    var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib
        
        title = "Alert"
        self.view.backgroundColor = UIColor.white
        //设置显示用户名和密码的Label
        label = UILabel(frame: CGRect(x: 0, y: 300, width: self.view.bounds.width, height: 70))
        label.textColor = UIColor.black
        label.numberOfLines = 0
        label.textAlignment = .center
        self.view.addSubview(label)
        //设置myView
        colorChange = UIView(frame: CGRect(x: 140, y: 100, width: 100, height: 50))
        colorChange.backgroundColor = UIColor.black
        self.view.addSubview(colorChange)
        
        //添加控制按钮
        let rightBtn = UIBarButtonItem(title: "Alert", style: UIBarButtonItem.Style.plain, target: self, action: #selector(alertLogin))
        self.navigationItem.rightBarButtonItem = rightBtn
        
        let leftBtn = UIBarButtonItem(title: "Action", style: UIBarButtonItem.Style.plain, target: self, action: #selector(actionSheet))
        self.navigationItem.leftBarButtonItem = leftBtn
    }
    
    
    @objc func alertLogin(){
        let alert = UIAlertController(title: "填写信息", message: nil, preferredStyle: UIAlertController.Style.alert)
        alert.addTextField { (tf) in
            tf.placeholder = "用户名"
        }
        alert.addTextField { (tf) in
            tf.placeholder = "密码"
        }
        
        let btnOk = UIAlertAction(title: "确定✅", style: UIAlertAction.Style.default){ _ in
            let userName = alert.textFields![0].text ?? ""
            let passWd = alert.textFields![1].text ?? ""
            let showInfo = "用户名：\(userName)\n\n 密码：\(passWd)"
            self.label.text = showInfo
        }
        
        let btnCancel = UIAlertAction(title: "取消✖️", style: .cancel, handler: nil)
        
        alert.addAction(btnOk)
        alert.addAction(btnCancel)
        
        self.present(alert,animated: true,completion: nil)
    }
    
    @objc func actionSheet() {
        let action = UIAlertController(title: "Choose Color", message: nil, preferredStyle: UIAlertController.Style.actionSheet)
        let btnRed = UIAlertAction(title: "RED", style: .default){ (_) in
            self.colorChange.backgroundColor = UIColor.red
        }
        let btnBlue = UIAlertAction(title: "BLUE", style: .default){ (_) in
            self.colorChange.backgroundColor = UIColor.blue
        }
        let btnYellow = UIAlertAction(title: "YELLOW", style: .default){ (_) in
            self.colorChange.backgroundColor = UIColor.yellow
        }
        let btnGreen = UIAlertAction(title: "GREEN", style: .default){ (_) in
            self.colorChange.backgroundColor = UIColor.green
        }
        let btnCancel = UIAlertAction(title: "Cancel✖️", style: .cancel, handler: nil)
        
        action.addAction(btnRed)
        action.addAction(btnBlue)
        action.addAction(btnYellow)
        action.addAction(btnGreen)
        action.addAction(btnCancel)
        
        self.present(action,animated: true)
        
    }


}

