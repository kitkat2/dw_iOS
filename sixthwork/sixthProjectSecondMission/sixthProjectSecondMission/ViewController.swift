//
//  ViewController.swift
//  sixthProjectSecondMission
//
//  Created by student on 2018/12/8.
//  Copyright © 2018年 dw. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //创建3个UIView并设置颜色
        let orange = UIView()
        orange.backgroundColor = UIColor.orange
        
        let green = UIView()
        green.backgroundColor = UIColor.green
        
        let brown = UIView()
        brown.backgroundColor = UIColor.brown
        
        //创建一个StackView
        let stackView = UIStackView(arrangedSubviews: [orange,green,brown])
        //设置约束
        stackView.axis = NSLayoutConstraint.Axis.vertical
        stackView.alignment = UIStackView.Alignment.fill
        stackView.distribution = UIStackView.Distribution.fillEqually
        stackView.spacing = 10
        
        view.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
        
    }


}

