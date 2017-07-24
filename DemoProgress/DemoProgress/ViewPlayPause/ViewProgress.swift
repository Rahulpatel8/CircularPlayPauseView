//
//  ViewProgress.swift
//  DemoProgress
//
//  Created by SOTSYS024 on 20/07/17.
//  Copyright © 2017 SOTSYS024. All rights reserved.
//

import UIKit

class ViewProgress: UIView {
    //-1.5 starts wiht upper end, try 0 , that will start point from right, and -3.0 will start with left
    private var start: Double = -1.5
    private var end : Double = -1.5
    var btn: UIButton!
    var timeLimit = 5.0
    private var timer : Timer!
    private var path: UIBezierPath!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setButton()
    }
    
    func setButton() {
        btn = UIButton(frame: self.bounds)
        btn.layer.cornerRadius = btn.frame.size.width / 2.0
        let inset = btn.frame.size.width / 5
        btn.imageEdgeInsets = UIEdgeInsetsMake(inset, inset, inset, inset)
        self.addSubview(btn)
        btn.center = CGPoint(x: self.bounds.size.width/2, y: self.bounds.size.height/2)
        self.backgroundColor = UIColor.white
    }
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        let radius: CGFloat = max(bounds.width, bounds.height)
        let arcWidth: CGFloat = 2
        let center = CGPoint(x:bounds.width/2, y: bounds.height/2)
        path = UIBezierPath(arcCenter: center, radius: radius/2 - arcWidth, startAngle: CGFloat(start), endAngle: CGFloat(end), clockwise: true)
        path.lineCapStyle = .round
        self.layer.allowsEdgeAntialiasing = true
        path.lineWidth = arcWidth
        UIColor.white.setFill()
        UIColor.orange.setStroke()
        path.stroke()
    }
    
    open func startProgress() {
        timer = Timer.scheduledTimer(timeInterval: 1/100, target: self, selector: #selector(startAnimation), userInfo: nil, repeats: true)
    }
    
    @objc private func startAnimation() {
        //reson for 4.8 is, it complete its round at 4.8, for testing try this self.end > 4.5 and you will know.
        if self.end > start + 6.3 {
            stopProgress()
            return
        }
        self.btn.isSelected = true
        print(Date())
        //incremetal value
        // 1.5 + 4.5 = 6.0
        //we need it as perspective to 100 so it is 100/6.0
        // 0.5 is 30 seconds
        self.end = self.end + (1/((timeLimit * 100) * 0.6))/(100/6.3)
        self.setNeedsDisplay()
    }
    
    func stopProgress() {
        pauseProgress()
        
        self.end = -1.5
        self.start = -1.5
        self.btn.isSelected = false
    }
    
    func pauseProgress() {
        self.btn.isSelected = false
        timer.invalidate()
        self.setNeedsDisplay()
    }
    
}
