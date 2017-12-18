//
//  ViewController.swift
//  BlockNote
//
//  Created by Kei on 12/18/17.
//  Copyright © 2017 Kei. All rights reserved.
//

import UIKit

class MainViewController: UITableViewController {
    
    var notes: Array<Note> = []
    
    var presentor: MainPresentor? {
        didSet {
            presentor?.viewController = self
        }
    }
    var router: MainRouter? {
        didSet {
            router?.viewController = self
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        title = "Note Chain"
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 60.0
        
        presentor = MainPresentor()
        router = MainRouter()
        
        presentor?.loadNotes()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - TableView DataSource
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NoteTableViewCell.cellId, for: indexPath) as! NoteTableViewCell
        cell.note = notes[indexPath.row]
        return cell
    }
}

