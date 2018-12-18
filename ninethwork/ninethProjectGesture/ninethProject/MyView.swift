//
//  MyView.swift
//  ninethProject
//
//  Created by student on 2018/12/8.
//  Copyright © 2018年 dw. All rights reserved.
//

import UIKit

class MyView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    */
    override func draw(_ rect: CGRect) {
        // Drawing code
        let viewRect = UIBezierPath(rect: rect)
        
        UIColor.orange.setStroke()
        UIColor.orange.setFill()
        viewRect.fill()
        viewRect.stroke()
        
    }
    //初始化函数
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        //fatalError("init(coder:) has not been implemented")
        super.init(coder: aDecoder)
        setup()
    }
    func setup(){
        //设置矩形圆角
        self.layer.cornerRadius = 20
        //设置阴影
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOffset = CGSize(width: 3, height: 3)
        self.layer.shadowOpacity = 0.9
        //设置视图内容模式为重绘
        self.contentMode = .redraw
        
        //pan -- 移动
        let panGesturer = UIPanGestureRecognizer(target: self, action: #selector(pan(gesture:)))
        self.addGestureRecognizer(panGesturer)
        
        //tab -- 删除
        let tabGesturer = UITapGestureRecognizer(target: self, action: #selector(tap(gesture:)))
        self.addGestureRecognizer(tabGesturer)
        
        //pinch -- 缩放
        let pinchGesturer = UIPinchGestureRecognizer(target: self, action: #selector(pinch(gesture:)))
        self.addGestureRecognizer(pinchGesturer)
        
        //rotation -- 旋转
        let rotationGesturer = UIRotationGestureRecognizer(target: self, action: #selector(rotation(gesture:)))
        self.addGestureRecognizer(rotationGesturer)
        
        
    }
    //pan
    @objc func pan(gesture: UIPanGestureRecognizer){
        self.center = gesture.location(in: superview)
    }
    
    //tab
    @objc func tap(gesture: UITapGestureRecognizer){
        self.removeFromSuperview()
        
    }
    
    //pinch
    @objc func pinch(gesture: UIPinchGestureRecognizer){
        let scale = gesture.scale
        self.transform = self.transform.scaledBy(x: scale, y: scale)
        gesture.scale = 1
    }
    
    //rotation
    @objc func rotation(gesture: UIRotationGestureRecognizer){
        let rotation = gesture.rotation
        self.transform = self.transform.rotated(by: rotation)
        gesture.rotation = 0
        
    }
}
