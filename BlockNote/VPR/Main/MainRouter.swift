//
//  MainRouter.swift
//  BlockNote
//
//  Created by Kei on 12/18/17.
//  Copyright © 2017 Kei. All rights reserved.
//

import UIKit

class MainRouter: Router<MainViewController>, SeguePreparation {
    
    func openNewNoteViewController() {
        viewController.performSegue(withIdentifier: "main_newNote", sender: self)
    }

    func prepareForSegue(_ segue: UIStoryboardSegue) {
        if segue.identifier == "main_newNote" {
            let newNoteViewController = segue.destination as! NewNoteTableViewController
            newNoteViewController.delegate = self.viewController
        }
    }
}
