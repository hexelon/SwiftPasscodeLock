//
//  UserDefaultsPasscodeRepository.swift
//  PasscodeLock
//
//  Created by Yanko Dimitrov on 8/29/15.
//  Copyright © 2015 Yanko Dimitrov. All rights reserved.
//

import Foundation
import PasscodeLock

class UserDefaultsPasscodeRepository: PasscodeRepositoryType {

    private let passcodeKey = "passcode.lock.passcode"
    private let touchIdKey = "passcode.lock.touchid"

    private lazy var defaults: NSUserDefaults = {

        return NSUserDefaults.standardUserDefaults()
    }()

    var hasPasscode: Bool {
        if passcode != nil {
            return true
        }

        return false
    }

    var passcode: [String]? {

        return defaults.valueForKey(passcodeKey) as? [String] ?? nil
    }

    func savePasscode(passcode: [String]) {

        defaults.setObject(passcode, forKey: passcodeKey)
        defaults.synchronize()
    }

    func deletePasscode() {

        defaults.removeObjectForKey(passcodeKey)
        defaults.synchronize()
    }

    var isTouchIdEnabled: Bool {
        get {
            return defaults.valueForKey(touchIdKey) as? Bool ?? false
        }
        set(enabled) {
            defaults.setObject(enabled, forKey: touchIdKey)
            defaults.synchronize()
        }
    }
}
