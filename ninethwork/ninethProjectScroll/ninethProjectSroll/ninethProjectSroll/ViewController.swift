//
//  ViewController.swift
//  ninethProjectSroll
//
//  Created by student on 2018/12/13.
//  Copyright © 2018年 dw. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UIScrollViewDelegate {
    
    //轮播
    var scroll: UIScrollView!
    var page: UIPageControl!
    //缩放
    
    var scale: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let width = self.view.bounds.width - 20
        let height = width * 0.56
        
        //配置scrollview
        scroll = UIScrollView(frame: CGRect(x: 10, y: 100, width: width, height: height))
        
        //按一页一页的方式滚动
            scroll.isPagingEnabled = true
        //隐藏水平滚动条
        scroll.showsHorizontalScrollIndicator = false
        //设置内容大小
        scroll.contentSize = CGSize(width: width * 3, height: height)
        //设置代理
        scroll.delegate = self
        self.view.addSubview(scroll)
        
        //初始化pagecontroll
        page = UIPageControl(frame: CGRect(x: 10, y: 100+height, width: width, height: 30))
        //设置页数
        page.numberOfPages = 3
        //设置当前页
        page.currentPage = 0
        //指示器选中时颜色
        page.currentPageIndicatorTintColor = UIColor.orange
        //添加事件
        page.addTarget(self, action: #selector(pageChanged(page:)), for: UIControl.Event.touchUpInside)
        self.view.addSubview(page)
        
        for i in 1...3 {
            let blur = UIImage(named: "blur\(i)")
            let imageView = UIImageView(frame: CGRect(x: width*CGFloat(i-1), y: 0, width: width, height: height))
            imageView.image = blur
            imageView.contentMode = .scaleAspectFill
            scroll.addSubview(imageView)
        }
        
        //配置用于缩放的scrollview -- scale
        scale = UIScrollView(frame: CGRect(x: 10, y: 200+height, width: width, height: height))
        scale.backgroundColor = UIColor.lightGray
        scale.contentSize = CGSize(width: width, height: height)
        
        //设置最大缩放比例
        scale.maximumZoomScale = 10
        //设置最小缩放比例
        scale.minimumZoomScale = 0.5
        //设置代理
        scale.delegate = self
        self.view.addSubview(scale)
        
        let finn = UIImage(named: "finn")
        let finnView = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        finnView.image = finn
        finnView.contentMode = .scaleAspectFit
        scale.addSubview(finnView)
    }
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return scale.subviews.first
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let currentPage = Int(scrollView.contentOffset.x / (self.view.bounds.width - 20))
        page.currentPage = currentPage
    }
    
    @objc func pageChanged(page: UIPageControl) {
        let rect = CGRect(x: scroll.bounds.width * CGFloat(page.currentPage), y: 0, width: scroll.bounds.width, height: scroll.bounds.height)
        scroll.scrollRectToVisible(rect, animated: true)
    }
}

