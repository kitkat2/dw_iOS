//
//  ViewController.swift
//  tenthProject
//
//  Created by student on 2018/12/15.
//  Copyright © 2018年 dw. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //声明两个UIView的属性用于视图切换
    var firstView: UIView!
    var secondView: UIView!
    
    var dyAnimator: UIDynamicAnimator!
    //重力行为
    var gravity = UIGravityBehavior()
    //碰撞行为
    var collision = UICollisionBehavior()

    override func viewDidLoad() {
        view.backgroundColor = UIColor.white
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 基于UIView.animation实现动画效果
        animation()
        
        transition()
        
        dynamicAnimtion()
        
    }
    /*(1)    基于UIView.animation实现如下动画效果：
      a)    改变视图的位置
      b)    改变视图的大小
      c)    改变视图的transform
     */
    func animation(){
        let myView = UIView(frame: CGRect(x: 380, y: 100, width: 100, height: 100))
        myView.backgroundColor = UIColor.blue
        self.view.addSubview(myView)
        //设置动画
        UIView.animate(withDuration: 3, delay: 0, options: [.repeat,.autoreverse,.curveEaseInOut], animations: {
            //改变视图的位置&大小
            myView.frame = CGRect(x: 0, y: 10, width: 10, height: 10)
            //改变视图的transform
            myView.transform = myView.transform.rotated(by: CGFloat.pi)
        }, completion: nil)
    }
    
    /*(2)    基于UIView.transition实现如下动画效果：
        a)    改变视图的背景颜色；
        b)    切换两个子视图，观察切换后视图层次的变化情况；
     */
    func transition() {
        //设置切换视图的按钮
        let transBtn = UIButton(frame: CGRect(x: 115, y: 280, width: 180, height: 30))
        transBtn.setTitle("Change View", for: UIControl.State.normal)
        transBtn.setTitleColor(UIColor.black, for: UIControl.State.normal)
        transBtn.addTarget(self, action: #selector(viewChange), for: UIControl.Event.touchUpInside)
        self.view.addSubview(transBtn)
        
        //设置视图
        //第一个
        firstView = UIView(frame: CGRect(x: 100, y: 200, width: 200, height: 60))
        firstView.backgroundColor = UIColor.blue
        let firstLabel = UILabel(frame: CGRect.init(x: 0, y: 0, width: 200, height: 60))
        firstLabel.text = "I'm the first!"
        firstLabel.textAlignment = .center
        firstView.addSubview(firstLabel)
        self.view.addSubview(firstView)
        //第二个
        secondView = UIView(frame: CGRect(x: 100, y: 200, width: 200, height: 60))
        secondView.backgroundColor = UIColor.yellow
        let secondLabel = UILabel(frame: CGRect.init(x: 0, y: 0, width: 200, height: 60))
        secondLabel.text = "I'm the second!"
        secondLabel.textAlignment = .center
        secondView.addSubview(secondLabel)
        self.view.addSubview(secondView)
    }
    
    @objc func  viewChange() {
         UIView.transition(from: secondView, to: firstView, duration: 3, options: [.transitionFlipFromLeft], completion: nil)
    }
    
    /*(3)    基于UIDynamicAnimtor实现简单的力学动画：
        a)    可以掉落方块；
        b)    有碰撞；
        c)    可以反弹；
     */
    func dynamicAnimtion(){
        dyAnimator = UIDynamicAnimator (referenceView: self.view)
        dyAnimator.addBehavior(gravity)
        dyAnimator.addBehavior(collision)
        
        collision.translatesReferenceBoundsIntoBoundary = true
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true){
            (t) in
            let x = CGFloat(arc4random() % (UInt32(self.view.frame.width) - 50))
            let rectView = UIView(frame: CGRect(x: x, y: 20, width: 50, height: 50))
            
            rectView.backgroundColor = UIColor.blue
            rectView.layer.borderWidth = 1
            rectView.layer.cornerRadius = 5
            self.view.addSubview(rectView)
            
            self.gravity.addItem(rectView)
            self.collision.addItem(rectView)
        }
        
    }
}

