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

protocol MessageDialog {
    
}

extension Router: MessageDialog {
    func displayMessage(title: String, message: String) {
        let errorMessage = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        errorMessage.addAction(okAction)
        viewController.present(errorMessage, animated: true, completion: nil)
    }
}
