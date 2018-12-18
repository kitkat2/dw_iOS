//
//  ViewController.swift
//  fifthProject
//
//  Created by student on 2018/11/8.
//  Copyright © 2018年 dw. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = UIColor.yellow
        
        //label设置
        let label = UILabel(frame: CGRect(x: 120, y: 200, width: 150, height: 80))
        label.text = "Hello World!"
        label.backgroundColor = UIColor.orange
        label.textAlignment = .center
        //label.center = view.center
        view.addSubview(label)
        
        //button设置
        let btn = UIButton(frame: CGRect(x: 200, y: 300, width: 150, height: 30))
        btn.setTitle("Clike Me!", for: UIControl.State.normal)
        btn.setTitleColor(UIColor.black, for: UIControl.State.normal)
        btn.center = view.center
        view.addSubview(btn)
        
        //添加动作
        btn.addTarget(self, action: #selector(btnCliked), for: UIControl.Event.touchUpInside)
        
        self.title = "Hello World"
        
        //创建UIImageView对象
        let imageView = UIImageView(frame: CGRect(x: 10, y: 360, width: self.view.frame.width-20, height: (self.view.frame.width-20)*0.68))
        imageView.contentMode = .scaleAspectFit
        //获取图片资源路径
        let imagePath = Bundle.main.path(forResource: "isak1", ofType: "jpg")
        //以该路径创建图片
        let image = UIImage(contentsOfFile: imagePath!)
        //将图片加入到imageView中
        imageView.image = image
        self.view.addSubview(imageView)
        
        
        //添加一个自定义视图
        let rectangle = MyView(frame:CGRect(x: 10, y: 50, width: 230, height: 100))
        rectangle.backgroundColor = UIColor.clear
        view.addSubview(rectangle)
        let rectLabel = UILabel(frame: CGRect(x: 100, y: 100, width: 150, height:30 ))
        rectLabel.text = "MyView's rectangle"
        label.textAlignment = .center
        rectangle.addSubview(rectLabel)
        
    }
    
    //click动作
    @objc func btnCliked(){
        if let label = view.subviews.first as? UILabel {
            label.text = "surprise!"
        }
    }

}

