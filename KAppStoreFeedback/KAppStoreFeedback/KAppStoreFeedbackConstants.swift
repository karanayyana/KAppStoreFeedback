//
//  constants.swift
//  KAppStoreFeedback
//
//  Created by Prajwal Karanayyana Vasantha on 7/10/18.
//  Copyright © 2018 karanayyana. All rights reserved.
//

import UIKit

public enum KAppStoreFeedbackType : Int {
    case thumbsView = 1
    case emoticonsView = 2
    case ratingsView = 3
}

public struct KAppStoreFeedbackConfig {
    
    public var kASFFeedbackType: KAppStoreFeedbackType
    public var title: String
    public var message: String
    public var notNowButtonTitle: String
    public var rateButtonTitle: String
    public var helpButtonTitle: String
    public var minimumLoginAttempt : Int

    public init(kASFFeedbackType: KAppStoreFeedbackType = KAppStoreFeedbackType.thumbsView,
                title: String = "Tell us what you think",
                message: String = ("If you enjoy using " + (Bundle.main.infoDictionary!["CFBundleName"] as! String) + ", would you mind taking a moment to rate it?"),
                notNowButtonTitle: String = "Not Now",
                rateButtonTitle:String = "Rate us on App Store?",
                helpButtonTitle: String = "How can we improve?",
                minimumLoginAttempt : Int = 5) {
        
        self.kASFFeedbackType = kASFFeedbackType
        self.title = title
        self.message = message
        self.notNowButtonTitle = notNowButtonTitle
        self.rateButtonTitle = rateButtonTitle
        self.helpButtonTitle = helpButtonTitle
        self.minimumLoginAttempt = minimumLoginAttempt
    }
}


class KAppStoreFeedbackConstants: NSObject {
   
}
