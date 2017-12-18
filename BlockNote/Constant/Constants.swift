//
//  Constants.swift
//  BlockNote
//
//  Created by Kei on 12/18/17.
//  Copyright © 2017 Kei. All rights reserved.
//

import UIKit

let SCREEN_WIDTH = UIScreen.main.bounds.width
let SCREEN_HEIGHT = UIScreen.main.bounds.height


struct GUISize {
    static let bottomScreenButtonWidth = CGFloat(SCREEN_WIDTH * 300 / 360)
    static let bottomScreenButtonHeight = CGFloat(bottomScreenButtonWidth * 48 / 300)
    static let bottomScreenCornerRadiusRatio = bottomScreenButtonHeight / 2
}
