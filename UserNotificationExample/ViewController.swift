//
//  ViewController.swift
//  UserNotificationExample
//
//  Created by Zaur Giyasov on 15/03/2018.
//  Copyright © 2018 Zaur Giyasov. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    fileprivate func notificationAutorization() {
        let natificationOptions = UNAuthorizationOptions([.alert, .badge, .sound])
        
        UNUserNotificationCenter.current().requestAuthorization(options: natificationOptions) { (susses, error) in
            
            if let error = error {
                print("Error: Authorization =", error.localizedDescription)
            } else {
                print("Authorization =", susses.description)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        notificationAutorization()
    }
    
    func timeNotification(inSecond: TimeInterval, completion: @escaping (_ Success: Bool) -> ()) {
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: inSecond, repeats: false)
        
        let content = UNMutableNotificationContent()
        content.title = "News (content.title)"
        content.subtitle = "Nice text (content.subtitle)"
        content.body = "🥃 In this blok you can show ... 🚩 ⏰ Qrtyugu u iuoyh9ou piuy 987y98ujp9oigy90o (content.body)"
        
        let request = UNNotificationRequest(identifier: "customNotification", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request) { (error) in
            if let error = error {
                print("Error: UNNotificationRequest identifier: \"customNotification\" =", error.localizedDescription)
                completion(false)
            } else {
                completion(true)
            }
        }
    }
    
    @IBAction func pressNotificationButton(_ sender: UIButton) {
        timeNotification(inSecond: 2) { (sussed) in
            print("Sussed")
        }
    }

}

