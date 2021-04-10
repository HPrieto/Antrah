//
//  AppContext.swift
//  Antrah
//
//  Created by Heriberto Prieto on 4/10/21.
//

import UIKit

class AppContext {
    
    public static let shared: AppContext = AppContext()
    
    public var appVersion: String {
        Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String ?? ""
    }
}
