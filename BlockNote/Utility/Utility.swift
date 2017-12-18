//
//  Utility.swift
//  BlockNote
//
//  Created by Kei on 12/18/17.
//  Copyright © 2017 Kei. All rights reserved.
//

import UIKit

class Utility: NSObject {
    class func createViewControllerWith(_ controllerId: String, in storyboardName: String) -> UIViewController {
        let storyboard = UIStoryboard.init(name: storyboardName, bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: controllerId)
    }
    
    class func uiColorWith(_ hex: UInt, _ alpha: CGFloat) -> UIColor {
        let red = CGFloat((hex & 0xFF0000) >> 16)/256.0
        let green = CGFloat((hex & 0xFF00) >> 8)/256.0
        let blue = CGFloat(hex & 0xFF)/256.0
        
        return UIColor(red:red, green:green, blue:blue, alpha:alpha)
    }
}
