//
//  SecondViewController.swift
//  夜间模式Test
//
//  Created by QXH on 2016/11/2.
//  Copyright © 2016年 QXH. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var tipLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 通过通知的方式改变皮肤 或者 viewWillAppear
        NotificationCenter.default.addObserver(self, selector: #selector(SecondViewController.skinChange(noti:)), name: NSNotification.Name(rawValue: kViewSkinChangeKey), object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setSkin()
    }
    
    @objc private func skinChange(noti: Notification) {
        setSkin()
    }
    
    private func setSkin() {
        tipLabel.textColor = UIColor.currentTipColor()
        view.backgroundColor = UIColor.currentBgColor()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
