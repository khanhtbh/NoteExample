//
//  ViewControllerLogic.swift
//  BlockNote
//
//  Created by Kei on 12/18/17.
//  Copyright © 2017 Kei. All rights reserved.
//

import UIKit

protocol ViewControllerLogicObject: NSObjectProtocol {
    associatedtype ViewController: UIViewController
    weak var viewController: ViewController! {get set}
}

class Presentor<ViewController: UIViewController>: NSObject, ViewControllerLogicObject {
    weak var viewController: ViewController!
}

class Router<ViewController: UIViewController>: NSObject, ViewControllerLogicObject {
    weak var viewController: ViewController!
}

protocol SeguePreparation {
    func prepareForSegue(_ segue: UIStoryboardSegue)
}
