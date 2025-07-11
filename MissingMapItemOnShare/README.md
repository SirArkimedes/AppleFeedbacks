### Description:
When sharing a place from Maps.app to an app, the share extensions for those apps are no longer able to find a com.apple.mapkit.map-item attachment in the extensionContext.

Previously in iOS 18.5, when sharing a place from the share sheet to an application's share extension, you would be able to query for a com.apple.mapkit.map-item and subsequently get NSData from the extensionContext's attachments that could be converted into an MKMapItem. Now, on iOS 26 Beta 3, the com.apple.mapkit.map-item is no longer present in any of the attachments. In iOS 18.5, Maps.app would return a public.plain-text attachment, a public.url attachment, and a com.apple.mapkit.map-item attachment. Now, in iOS 26 Beta 3, we only see the public.plain-text and the public.url.

### Testing versions:
An app built with Xcode 26 Beta 3 placed onto a device with iOS 26 Beta 3 and a device with iOS 18.5.
An app built with Xcode 16.4 placed onto the same devices. No change in results.

### To reproduce the problem:
1. Create an app and create a share extension for that app.
2. Add a NSExtensionActivationRule SUBQUERY for that application that includes UTI-CONFORMS-TO "com.apple.mapkit.map-item"
3. Build and run on an iOS 26 device.
4. Open Maps.app on that device and tap on a place.
5. Share that place to the newly created share extension.
6. Observe that the com.apple.mapkit.map-item is not present on iOS 26.

### Additional testing verification:
Our specific app that we noticed this on, Charge Key, no longer sees the attachment when sharing. Though, in trying to verify our understanding, we realized that this same functionality that our Charge Key app has is also missing for the Tesla.app and the Rivian.app. We are all no longer able to parse places from Maps.app. Both Tesla and Rivian throw errors and are not able to complete their original sharing tasks that were capable in iOS 18.5 and below.
