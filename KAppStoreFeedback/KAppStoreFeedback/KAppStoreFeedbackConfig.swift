//
//  KAppStoreFeedbackConfig.swift
//  KAppStoreFeedback
//
//  Created by Prajwal Karanayyana Vasantha on 7/24/18.
//  Copyright © 2018 karanayyana. All rights reserved.
//

import UIKit

public struct KAppStoreFeedbackConfig {
    
    public var kASFFeedbackType: KAppStoreFeedbackType
    public var title: String
    public var message: String
    public var notNowButtonTitle: String
    public var rateButtonTitle: String
    public var helpButtonTitle: String
    public var minimumLoginAttempt : Int
    
    public init(kASFFeedbackType: KAppStoreFeedbackType = KAppStoreFeedbackType.emoticonsView,
                title: String? ,
                message: String?,
                notNowButtonTitle: String?,
                rateButtonTitle:String?,
                helpButtonTitle: String?,
                minimumLoginAttempt : Int?) {
        
        self.kASFFeedbackType = kASFFeedbackType
        self.title = title ?? "Tell us what you think"
        self.message = message ?? ("If you enjoy using " + (Bundle.main.infoDictionary!["CFBundleName"] as! String) + ", would you mind taking a moment to rate it?")
        self.notNowButtonTitle = notNowButtonTitle ?? "Not Now"
        self.rateButtonTitle = rateButtonTitle ?? "Rate us on App Store?"
        self.helpButtonTitle = helpButtonTitle ?? "How can we improve?"
        self.minimumLoginAttempt = minimumLoginAttempt ?? 5
    }
    
    public init (kASFFeedbackType: KAppStoreFeedbackType = KAppStoreFeedbackType.emoticonsView,
                 minimumLoginAttempt : Int = 5) {
        self.kASFFeedbackType = kASFFeedbackType
        self.title = "Tell us what you think"
        self.message = ("If you enjoy using " + (Bundle.main.infoDictionary!["CFBundleName"] as! String) + ", would you mind taking a moment to rate it?")
        self.notNowButtonTitle = "Not Now"
        self.rateButtonTitle = "Rate us on App Store?"
        self.helpButtonTitle = "How can we improve?"
        self.minimumLoginAttempt = minimumLoginAttempt
    }
}
