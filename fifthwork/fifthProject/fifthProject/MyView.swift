//
//  MyView.swift
//  fifthProject
//
//  Created by student on 2018/11/8.
//  Copyright © 2018年 dw. All rights reserved.
//

import UIKit

class MyView: UIView {
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    //绘制一个矩形
    override func draw(_ rect: CGRect) {
        // Drawing code
        //绘制路径
        let rectPath = UIBezierPath(rect: CGRect(x: 130, y: 50, width: 100, height: 50))
        //填充
        UIColor.orange.setStroke()
        rectPath.stroke()
        UIColor.blue.setFill()
        rectPath.fill()
    }

}
