//
//  ViewController.swift
//  MissingMapItemOnShare
//
//  Created by Andrew Robinson on 7/11/25.
//

import UIKit

final class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let inputItems = extensionContext?.inputItems as? [NSExtensionItem] else {
            extensionContext?.completeRequest(returningItems: [])
            return
        }

        print("ALL FOUND ATTACHMENTS ARE OF TYPE:")
        for item in inputItems {
            guard let attachments = item.attachments else {
                extensionContext?.completeRequest(returningItems: [])
                return
            }

            for itemProvider in attachments {
                for typeIdentifier in itemProvider.registeredTypeIdentifiers {
                    print(typeIdentifier)
                }
            }
        }

        extensionContext?.completeRequest(returningItems: [])
    }
}
