//
//  Banner.swift
//  ExpertApp
//
//  Created by Mahmoud Alkady on 25/08/2022.
//

import Foundation
import NotificationBannerSwift

struct Banner  {
    
    static func showSuccess(_ message: String) {
        DispatchQueue.main.async {
            self.show("success", message, .success, 1)
        
        }
    }
    
    static func showError(_ message: String) {
        DispatchQueue.main.async {
            self.show("error", message, .danger, 1)
        }
    }
    static func show(_ title: String, _ message: String, _ style: BannerStyle, _ duration: Int) {
        let banner = GrowingNotificationBanner(title: title, subtitle: message, style: style)
        banner.duration = 2.5
        banner.show()
        banner.backgroundColor = .darkPurple
    
}
}
