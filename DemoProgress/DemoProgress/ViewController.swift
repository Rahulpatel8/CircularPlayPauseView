//
//  ViewController.swift
//  DemoProgress
//
//  Created by SOTSYS024 on 20/07/17.
//  Copyright © 2017 SOTSYS024. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var view1 : ViewProgress!
    override func viewDidLoad() {
        super.viewDidLoad()
        addProgress()
    }
    
    func addProgress() {
        view1 = ViewProgress(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        view1.btn.setImage(#imageLiteral(resourceName: "play-button"), for: .normal)
        view1.btn.setImage(#imageLiteral(resourceName: "pause"), for: .selected)
        view1.timeLimit = 0.25
        view1.btn.addTarget(self, action: #selector(btnPlayClicked(_:)), for: .touchUpInside)
        self.view.addSubview(view1)
        view1.center = self.view.center
    }

    @IBAction func btnPlayClicked(_ sender: UIButton) {
        if !sender.isSelected {
            view1.startProgress()
        } else {
            view1.pauseProgress()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}





