//
//  Block.swift
//  BlockNote
//
//  Created by Kei on 12/18/17.
//  Copyright © 2017 Kei. All rights reserved.
//

import UIKit

class Block: NSObject {
    var index: UInt!
    var timestamp: Double!
    var note: Note!
    var previousHash: String!
    private var _hash: String!
    var hashString: String! {
        get {
            return _hash
        }
    }
    
    private override init() {
        super.init()
    }
    
    init(index: UInt, timestamp: Double, previousHash: String, note: Note) {
        super.init()
        self.index = index
        self.timestamp = timestamp
        self.previousHash = previousHash
        self.note = note
        computeHash()
    }
    
    private func computeHash() {
        _hash = String(format:"%ld_%ld_%@_%@", index, timestamp, previousHash, note.hashString())
    }
}
