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

public protocol KAppStoreFeedbackProtocol  : class {
    func navigateToPossitiveFeedBackHandler()
    func navigateToNegativeFeedBackHandler()
}

