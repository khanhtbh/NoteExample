//
//  MainPresentor.swift
//  BlockNote
//
//  Created by Kei on 12/18/17.
//  Copyright © 2017 Kei. All rights reserved.
//

import UIKit

class MainPresentor: Presentor<MainViewController> {
    override init() {
        super.init()
    }
    
    func loadNotes() {
        viewController.notes = NoteInteractor.shared.notes
        viewController.tableView.reloadData()
    }
    
    func addNewNote(_ note: Note) {
        NoteInteractor.shared.addNewNote(title: note.title, content: note.content)
        self.loadNotes()
    }
}
