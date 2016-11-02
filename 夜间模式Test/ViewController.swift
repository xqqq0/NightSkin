//
//  ViewController.swift
//  夜间模式Test
//
//  Created by QXH on 2016/11/2.
//  Copyright © 2016年 QXH. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLable: UILabel!
    @IBOutlet weak var button: UIButton!
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.skinChage(noti:)), name: NSNotification.Name(rawValue: kViewSkinChangeKey), object: nil)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setSkin()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @IBAction func changeBg(_ sender: UIButton) {
        let path = Bundle.main.path(forResource: "Night", ofType: "bundle")
        let image  = UIImage(contentsOfFile:"\(path!)/test/edit")
        sender.setBackgroundImage(image!, for: .normal)
    }
    
    @IBAction func switchChange(_ sender: UISwitch) {
        tipLable.text = sender.isOn ? "关闭夜间模式" : "打开夜间模式"
        UserDefaults.standard.set(sender.isOn ? "Night" : "Normal", forKey: kSkinModeKey)
        NotificationCenter.default.post(Notification(name: Notification.Name(kViewSkinChangeKey), object: nil, userInfo: nil))
    }
    
    @objc func skinChage(noti: Notification) {
        button.setBackgroundImage(UIImage.skinImage(imagePath: "test/edit"), for: .normal)
        setSkin()
    }
    
    private func setSkin() {
        tipLable.textColor = UIColor.currentTipColor()
        view.backgroundColor = UIColor.currentBgColor()
    }
}

