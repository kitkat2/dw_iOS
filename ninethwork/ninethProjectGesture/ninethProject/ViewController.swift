//
//  ViewController.swift
//  ninethProject
//
//  Created by student on 2018/12/8.
//  Copyright © 2018年 dw. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "Custom View"
        self.view.backgroundColor = UIColor.white
        
        let btnAdd = UIBarButtonItem(title: "Add", style: UIBarButtonItem.Style.plain, target: self, action: #selector(addView))
        
        let btnMove = UIBarButtonItem(title: "Move", style: UIBarButtonItem.Style.plain, target: self, action: #selector(moveViews))
        self.navigationItem.rightBarButtonItems = [btnAdd, btnMove]
        
        let btnClear = UIBarButtonItem(title: "Clear", style: UIBarButtonItem.Style.plain, target: self, action: #selector(clearViews))
        self.navigationItem.leftBarButtonItems = [btnClear]
        
    }
    
    @objc func addView() {
        let maxWidth: CGFloat = 100
        let x = CGFloat(arc4random() % UInt32(self.view.bounds.width))
        let y = CGFloat(arc4random() % UInt32(self.view.bounds.height-40))+40
        let point = CGPoint(x: x, y: y)
        
        let width = CGFloat(arc4random() % UInt32(maxWidth))
        let height = CGFloat(arc4random() % UInt32(maxWidth))
        let size = CGSize(width: width, height: height)
        let view = MyView(frame: CGRect(origin: point, size: size))
        self.view.addSubview(view)
    }
    @objc func moveViews(){
        self.view.subviews.map() { (view) in
            let x = CGFloat(arc4random() % UInt32(self.view.bounds.width))
            let y = CGFloat(arc4random() % UInt32(self.view.bounds.height-40))+40
            let point = CGPoint(x: x, y: y)
            
            UIView.animate(withDuration: 3, animations: {
                view.center = point
            })
            
        }
    }
    @objc func clearViews(){
        self.view.subviews.map(){
            $0.removeFromSuperview()
        }
    }
    

}

