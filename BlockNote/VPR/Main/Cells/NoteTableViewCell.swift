//
//  NoteTableViewCell.swift
//  BlockNote
//
//  Created by Kei on 12/18/17.
//  Copyright © 2017 Kei. All rights reserved.
//

import UIKit

class NoteTableViewCell: UITableViewCell {
    
    static let cellId = "NoteTableViewCell"
    
    var note: Note! {
        didSet {
            titleLabel.text = note.title
            shortContentLabel.text = note.content
        }
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var shortContentLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
