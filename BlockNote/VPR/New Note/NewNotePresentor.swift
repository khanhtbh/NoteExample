//
//  NewNotePresentor.swift
//  BlockNote
//
//  Created by Kei on 12/18/17.
//  Copyright © 2017 Kei. All rights reserved.
//

import UIKit

class NewNotePresentor: Presentor<NewNoteTableViewController> {
    func createNewNote() {
        guard
            let noteTitle = viewController.noteTitleInputField.text,
            noteTitle.count > 0,
            let noteContent = viewController.noteContentTextView.text,
            noteContent.count > 0
            else {
                viewController.router?.displayMessage(title: "Notice!", message: "Please enter title and content")
                return
            }
        let note = Note(title: noteTitle, content: noteContent)
        viewController.delegate?.newNoteViewController(viewController, note: note)
        viewController.dismiss(animated: true, completion: nil)
    }
}
