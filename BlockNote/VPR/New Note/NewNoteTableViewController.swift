//
//  NewNoteTableViewController.swift
//  BlockNote
//
//  Created by Kei on 12/18/17.
//  Copyright © 2017 Kei. All rights reserved.
//

import UIKit

class NewNoteTableViewController: UITableViewController {

    @IBOutlet weak var noteTitleInputField: MPInputField!
    @IBOutlet weak var noteContentTextView: UITextView! {
        didSet {
            noteContentTextView.layer.cornerRadius = 5.0
            noteContentTextView.layer.borderWidth = 1.0
            noteContentTextView.layer.borderColor = UIColor.lightGray.cgColor
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
