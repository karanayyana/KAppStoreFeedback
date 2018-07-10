//
//  constants.swift
//  KAppStoreFeedback
//
//  Created by Prajwal Karanayyana Vasantha on 7/10/18.
//  Copyright © 2018 karanayyana. All rights reserved.
//

import UIKit

public enum KASFFeedbackType : Int {
    case thumbsView = 1
    case emoticonsView = 2
    case ratingsView = 3
}

class constants: NSObject {
    static let appName = Bundle.main.infoDictionary!["CFBundleName"] as! String
    static let defaultMessage = "If you enjoy using " + appName + ", would you mind taking a moment to rate it?"
    static let defaultTitle = "Tell us what you think"
    static let defaultRateButtonTitle = "Rate us on App Store?"
    static let defaultHelpButtonTitle = "How can we improve?"
    static let defaultNotNowTitle = "Not Now"
}
