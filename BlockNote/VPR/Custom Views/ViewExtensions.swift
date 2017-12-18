//
//  ViewExtensions.swift
//  BlockNote
//
//  Created by Kei on 12/18/17.
//  Copyright © 2017 Kei. All rights reserved.
//

import UIKit

extension UIView {
    func cornerRadius(_ radius:CGFloat, withShadowEnabled enableShadow:Bool) {
        self.layer.cornerRadius = radius
        if enableShadow {
            self.layer.shadowColor = UIColor.black.cgColor
            self.layer.shadowOpacity = 0.4
            self.layer.shadowOffset = CGSize(width: 0, height: 2)
            self.layer.shadowRadius = 2
        }
    }
}
