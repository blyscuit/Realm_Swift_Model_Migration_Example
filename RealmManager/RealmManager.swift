//
//  RealmManager.swift
//  RealmManager
//
//  Created by Pisit W on 20/9/2562 BE.
//  Copyright © 2562 23. All rights reserved.
//

import Foundation
import  RealmSwift

class RealmManager {
    let realm = try? Realm(configuration: Realm.Configuration(
            // Set the new schema version. This must be greater than the previously used
            // version (if you've never set a schema version before, the version is 0).
            schemaVersion: 1,
            migrationBlock: { migration, oldSchemaVersion in
                // Set the block which will be called automatically when opening a Realm with
                // a schema version lower than the one set above
                if (oldSchemaVersion < 1) {
                    //write the migration logic here
                    // Realm will automatically detect new properties and removed properties
                    // And will update the schema on disk automatically
                }
                
            print(":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::")
                print(migration)
        })
    )
    
    // delete table
    func deleteDatabase() {
        try! realm?.write({
            realm?.deleteAll()
        })
    }
    
    // delete particular object
    func deleteObject(objs : Object) {
        try? realm!.write ({
            realm?.delete(objs)
        })
    }
    
    //Save array of objects to database
    func saveObjects(objs: Object) {
        try? realm!.write ({
            // If update = false, adds the object
            realm?.add(objs, update: .error)
        })
    }
    
    // editing the object
    func editObjects(objs: Object) {
        try? realm!.write ({
            // If update = true, objects that are already in the Realm will be
            // updated instead of added a new.
            realm?.add(objs, update: .all)
        })
    }
    
    //Returs an array as Results<object>?
    func getObjects(type: Object.Type) -> Results<Object>? {
        return realm!.objects(type)
    }
    
    func incrementID() -> Int {
        return (realm!.objects(MDNote.self).max(ofProperty: "id") as Int? ?? 0) + 1
    }
    
}
