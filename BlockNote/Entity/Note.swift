//
//  Note.swift
//  BlockNote
//
//  Created by Kei on 12/18/17.
//  Copyright © 2017 Kei. All rights reserved.
//

import UIKit

class Note: NSObject {
    var title: String!
    var content: String!
    var timestamp: Double!
    
    private override init() {
        super.init()
    }
    
    init(title: String, content: String) {
        super.init()
        self.title = title
        self.content = content
        self.timestamp = Date().timeIntervalSince1970
    }
    
    func hashString() -> String {
        return String(format:"%@_%@_%ld", title, content, timestamp).sha256()
    }
}
