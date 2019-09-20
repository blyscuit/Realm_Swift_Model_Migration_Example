# Realm_Swift_Model_Migration_Example

```
pod install
```

Run the project from XCode then add some note for testing.

Open `MDNote.swift` uncomment/comment line `16`
```
// @objc dynamic var subTitle: String = ""
```
or add new var to edit the object.

Run the project on the same device/simulator...
to see it crashing.

## Let's fix the crash
Open `RealmManager.swift` line `16` then edit `schemaVersion` to higher version.

Run again.

## It works.

Launch Realm Studio to see what's change
