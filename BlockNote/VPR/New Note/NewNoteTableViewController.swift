//
//  NewNoteTableViewController.swift
//  BlockNote
//
//  Created by Kei on 12/18/17.
//  Copyright © 2017 Kei. All rights reserved.
//

import UIKit

@objc protocol NewNoteDelegate {
    @objc func newNoteViewController(_ newNoteViewController: NewNoteTableViewController, note: Note)
}

class NewNoteTableViewController: UITableViewController {

    @IBOutlet weak var noteTitleInputField: MPInputField!
    @IBOutlet weak var noteContentTextView: UITextView! {
        didSet {
            noteContentTextView.layer.cornerRadius = 5.0
            noteContentTextView.layer.borderWidth = 1.0
            noteContentTextView.layer.borderColor = UIColor.lightGray.cgColor
        }
    }
    
    var presentor: NewNotePresentor? {
        didSet {
            presentor?.viewController = self
        }
    }
    
    var router: NewNoteRouter? {
        didSet {
            router?.viewController = self
        }
    }
    
    weak var delegate: NewNoteDelegate?
    
    let bottomMenuHeight: CGFloat = 100
    
    override var canBecomeFirstResponder: Bool {
        return true
    }
    
    private var _inputAccessoryView: UIView!
    
    override var inputAccessoryView: UIView? {
        get {
            if let _ = _inputAccessoryView {
                return _inputAccessoryView
            }
            
            _inputAccessoryView = UIView()
            _inputAccessoryView.frame = CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: bottomMenuHeight)
            let newNoteBtn = UIButton()
            newNoteBtn.backgroundColor = UIColor.orange
            newNoteBtn.frame = CGRect(x: 0, y: 0, width: GUISize.bottomScreenButtonWidth, height: GUISize.bottomScreenButtonHeight)
            newNoteBtn.center = CGPoint(x: SCREEN_WIDTH/2, y: bottomMenuHeight/2)
            newNoteBtn.cornerRadius(GUISize.bottomScreenCornerRadiusRatio, withShadowEnabled: true)
            newNoteBtn.setTitle("Add Note", for: .normal)
            newNoteBtn.titleLabel?.textColor = .white
            newNoteBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
            newNoteBtn.addTarget(self, action: #selector(addNewNoteBtnAction(_:)), for: .touchUpInside)
            _inputAccessoryView.addSubview(newNoteBtn)
            return _inputAccessoryView
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        router = NewNoteRouter()
        presentor = NewNotePresentor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func cancelBtnAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func addNewNoteBtnAction(_ sender: Any) {
        presentor?.createNewNote()
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
