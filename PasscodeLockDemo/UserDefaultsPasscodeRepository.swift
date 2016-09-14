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

    fileprivate let passcodeKey = "passcode.lock.passcode"
    fileprivate let touchIdKey = "passcode.lock.touchid"

    fileprivate lazy var defaults: UserDefaults = {

        return UserDefaults.standard
    }()

    var hasPasscode: Bool {
        if passcode != nil {
            return true
        }

        return false
    }

    var passcode: [String]? {

        return defaults.value(forKey: passcodeKey) as? [String] ?? nil
    }

    func savePasscode(_ passcode: [String]) {

        defaults.set(passcode, forKey: passcodeKey)
        defaults.synchronize()
    }

    func deletePasscode() {

        defaults.removeObject(forKey: passcodeKey)
        defaults.synchronize()
    }

    var isTouchIdEnabled: Bool {
        get {
            return defaults.value(forKey: touchIdKey) as? Bool ?? false
        }
    }

    func setTouchIdEnabled(_ isEnabled: Bool) {
        defaults.set(isEnabled, forKey: touchIdKey)
        defaults.synchronize()
    }
}
