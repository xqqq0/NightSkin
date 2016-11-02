//
//  UIColor+Extension.swift
//  夜间模式Test
//
//  Created by QXH on 2016/11/2.
//  Copyright © 2016年 QXH. All rights reserved.
//

import UIKit
extension UIColor {
   private static var colorDict: NSDictionary {
        get {
            let mode = UserDefaults.standard.object(forKey: kSkinModeKey)!
            let path = Bundle.main.path(forResource: "\(mode)", ofType: "bundle")!
            let dict = NSDictionary(contentsOfFile: "\(path)/Root.plist")!
            return dict
        }
    }
    
    private static func colorForKey(colorKey: NSString) -> UIColor {
        let hexString =  UIColor.colorDict[colorKey] as! NSString
        return UIColor.colorWithHexString(colorHex: hexString)
    }
    
    // 背景颜色
    static func currentBgColor() -> UIColor {
        return colorForKey(colorKey: "currentBgColor")
    }
    // 文字颜色
    static func currentTipColor() -> UIColor {
        return colorForKey(colorKey: "currentTipColor")
    }
    
    
    class func colorWithHexString(colorHex: NSString) -> UIColor {
        
        let rString = colorHex.substring(with: NSMakeRange(0, 2))
        let gString = colorHex.substring(with: NSMakeRange(2, 2))
        let bString = colorHex.substring(with: NSMakeRange(4, 2))
        
        var r: UInt32 = 0 , g: UInt32 = 0, b: UInt32 = 0
        
        Scanner(string: rString).scanHexInt32(&r)
        Scanner(string: gString).scanHexInt32(&g)
        Scanner(string: bString).scanHexInt32(&b)
        
        return UIColor(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: 1.0)
    }

}
