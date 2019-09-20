//
//  MDNote.swift
//  RealmManager
//
//  Created by Pisit W on 20/9/2562 BE.
//  Copyright © 2562 23. All rights reserved.
//

import UIKit
import RealmSwift

class MDNote: Object {
    @objc dynamic var identifier: String = ""
    @objc dynamic var content: String = ""
    @objc dynamic var lastEdited: Date = Date()
//    @objc dynamic var subTitle: String = ""
    
    override class func primaryKey() -> String? {
        return "identifier"
    }
    
    convenience init(
        identifier: String = UUID().uuidString,
        content: String,
        lastEdited: Date = Date()) {
        self.init()

        self.identifier = identifier
        self.content = content
        self.lastEdited = lastEdited
    }
}
