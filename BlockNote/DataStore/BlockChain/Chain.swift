//
//  Chain.swift
//  BlockNote
//
//  Created by Kei on 12/18/17.
//  Copyright © 2017 Kei. All rights reserved.
//

import UIKit

class Chain: NSObject {
    static let shared = Chain()
    private var _blocks: Array<Block> = []
    var blocks: Array<Block> {
        get {
            return _blocks
        }
    }
    private override init() {
        super.init()
        checkGenesisBlock()
    }
    
    private func checkGenesisBlock() {
        let gBlock = _blocks.first
        if gBlock == nil {
            let note = Note(title: "G Note", content: "This is the note for genesis block")
            let block = Block(index: 0, timestamp: Date().timeIntervalSince1970, previousHash: "", note: note)
            _blocks.append(block)
        }
    }
    
    func newBlockWithNote(_ note: Note) {
        let pBlock = _blocks.last!
        let newBlock = Block.init(index: UInt(_blocks.count), timestamp: Date().timeIntervalSince1970, previousHash: pBlock.hashString, note: note)
        _blocks.append(newBlock)
    }
    
    // TODO: implement save, load functions to support local storage
    func save() {
        
    }
    
    func load() {
        
    }
}
