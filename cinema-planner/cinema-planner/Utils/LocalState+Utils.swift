//
//  LocalState+Utils.swift
//  cinema-planner
//
//  Created by Mpilo Pillz on 2022/11/20.
//

import Foundation

public class LocalState {
    private enum Keys: String {
        case hasMadeTitleBarScrollable
        case scrollIcon
        case hasOnboarded
    }
    
    public static var hasMadeTitleBarScrollable: Bool {
        get {
            return UserDefaults.standard.bool(forKey: Keys.hasMadeTitleBarScrollable.rawValue)
        }
        set(newValue) {
            UserDefaults.standard.set(newValue, forKey: Keys.hasMadeTitleBarScrollable.rawValue)
            UserDefaults.standard.synchronize() // incase pre ios 12 uses this app
        }
    }
    
    public static var scrollIcon: String {
        // TODO: Nolonger using. find out if it sould be local state or a userdefault
        get {
            return UserDefaults.standard.string(forKey: Keys.scrollIcon.rawValue) ?? "scroll"
        }
        set(newValue) {
            UserDefaults.standard.set(newValue, forKey: Keys.scrollIcon.rawValue)
            UserDefaults.standard.synchronize()
        }
    }
    
    public static var hasOnboarded: Bool {
        get {
            return UserDefaults.standard.bool(forKey: Keys.hasOnboarded.rawValue)
        }
        set(newValue) {
            UserDefaults.standard.set(newValue, forKey: Keys.hasOnboarded.rawValue)
        }
    }
}
