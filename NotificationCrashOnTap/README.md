### Description:
When conforming an application to the UNUserNotificationCenterDelegate, the SDK user is allowed to set an object that the delegate conforms to. When that object is a static instance variable and then tapping on a notification while the app is backgrounded, the application that opens will crash with an "Terminating app due to uncaught exception 'NSInternalInconsistencyException', reason: 'Call must be made on main thread'" error.

### What's expected:
The application to not crash and for the application to be able to run code after the user taps on the notification.

### Actual results:
The application will crash with a "Terminating app due to uncaught exception 'NSInternalInconsistencyException', reason: 'Call must be made on main thread'". The crash occurs before any code in the application is called.

### Xcode version:
Version 15.4 (15F31d)


Attached is a sample project that reproduces the error. Browse the AppDelegate.swift file for an explanation of the issue.