//
//  KAppStoreFeedbackNavigationConfig.swift
//  KAppStoreFeedback
//
//  Created by Prajwal Karanayyana Vasantha on 7/24/18.
//  Copyright © 2018 karanayyana. All rights reserved.
//

import UIKit

public struct KAppStoreFeedbackNavigationConfig {
    
    public var callBackdelegate: KAppStoreFeedbackProtocol? // Note if delegate is passed then handle button click actions from delegate
    public var helpLink: String? // pass URL to helpCenter or use helpEmail to send email
    public var helpEmail : String? // if helplink doesnot exist then helpEmail is used.
    public var iTunesLink: String
    
    public init (iTunesLink : String, helpEmail : String?,helpLink : String?, callBackdelegate : KAppStoreFeedbackProtocol? ) {
        self.iTunesLink = iTunesLink
        self.callBackdelegate = callBackdelegate
        self.helpLink = helpLink
        self.helpEmail = helpEmail
        
    }
}
