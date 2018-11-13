//
//  File.swift
//  tableViewPratice
//
//  Created by Sriram Prasad on 13/11/18.
//  Copyright © 2018 FullStackNet. All rights reserved.
//

import UIKit
import UserNotifications
class NotificationVC : UIViewController,UNUserNotificationCenterDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
        scheduleNotification()
    }
    
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert,.badge,.sound])
    }
    private func scheduleNotification(){
        
        let content = UNMutableNotificationContent()
        content.title = "Title"
        content.body = "Body"
        content.subtitle = "Subtitle"
        content.sound = UNNotificationSound.default
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 3.0, repeats: false)
        let request = UNNotificationRequest(identifier: "Identifier", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request) { (error) in
            if error != nil {
                print("Failure")
            }
            else {
                print("Success")
            }
        }
    }
   
}
