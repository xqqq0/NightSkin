//
//  UIImage+Extension.swift
//  夜间模式Test
//
//  Created by QXH on 2016/11/2.
//  Copyright © 2016年 QXH. All rights reserved.
//

import UIKit
extension UIImage {
    
    class func skinImage(imagePath: String) -> UIImage {
        let mode = UserDefaults.standard.object(forKey: kSkinModeKey)!
        let path = Bundle.main.path(forResource: "\(mode)", ofType: "bundle")!
        return UIImage(contentsOfFile: "\(path)/\(imagePath)")!
        
    }
}
