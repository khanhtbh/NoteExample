//
//  NoteInteractor.swift
//  BlockNote
//
//  Created by Kei on 12/18/17.
//  Copyright © 2017 Kei. All rights reserved.
//

import UIKit

class NoteInteractor: NSObject {
    static let shared = NoteInteractor()
    var notes: Array<Note> {
        get {
            return Chain.shared.blocks.map { $0.note }
        }
    }
    private override init() {
        super.init()
    }
    
    func addNewNote(title: String, content: String) {
        let note = Note(title: title, content: content)
        Chain.shared.newBlockWithNote(note)
    }
}
