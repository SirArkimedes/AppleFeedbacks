//
//  ViewController.swift
//  NotificationTester
//
//  Created by Andrew Robinson on 7/25/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            if error != nil {
                print("error")
            }
        }
    }

    @IBAction func buttonPressed(_ sender: Any) {
        let content = UNMutableNotificationContent()
        content.title = "This is an example notification"
        content.body = "Now, background the app and tap me"
        content.sound = UNNotificationSound.defaultCritical

        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 0.1, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

        UNUserNotificationCenter.current().add(request)
    }
    
}

