//
//  StringExtension.swift
//  BlockNote
//
//  Created by Kei on 12/18/17.
//  Copyright © 2017 Kei. All rights reserved.
//

import UIKit

extension String {
    func sha256() -> String {
        let data = self.data(using: .utf8)! as NSData
        var hash = [UInt8](repeating: 0, count: Int(CC_SHA256_DIGEST_LENGTH))
        CC_SHA256(data.bytes, CC_LONG(data.length), &hash)
        let output = NSMutableString(capacity: Int(CC_SHA1_DIGEST_LENGTH))
        for byte in hash {
            output.appendFormat("%02x", byte)
        }
        return output as String
    }
}
