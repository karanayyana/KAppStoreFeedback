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

class KAppStoreFeedbackUtility {
    //MARK:- Private Methods
    
    class func checkIfMinimumAppLaunchCounterReached(
                            hostingViewController : UIViewController,
                            navigationConfig : KAppStoreFeedbackNavigationConfig?,
                            config : KAppStoreFeedbackConfig?,
                            configUIElements : KAppStoreFeedbackUIElementsConfig?) {
        if let minimumAtempt = config?.minimumLoginAttempt   {
            var userDefault = UserDefaults.standard
            var appLaunchCount = userDefault.integer(forKey: "KAppStoreFeedBackView_appLaunchCount")
            if appLaunchCount == minimumAtempt {
                displayAlert(hostingViewController: hostingViewController, navigationConfig: navigationConfig, config: config, configUIElements: configUIElements)
            }
            DispatchQueue.main.async {
                appLaunchCount = appLaunchCount + 1
                userDefault = UserDefaults.standard
                userDefault.set(appLaunchCount , forKey: "KAppStoreFeedBackView_appLaunchCount")
                userDefault.synchronize()
            }
            
        }else {
            print("KAppStoreFeedBackView not initialized, Please call initializeKAppStoreFeedBackView")
        }
    }
    
    class func displayAlert(hostingViewController : UIViewController,
                            navigationConfig : KAppStoreFeedbackNavigationConfig?,
                            config : KAppStoreFeedbackConfig?,
                            configUIElements : KAppStoreFeedbackUIElementsConfig?) {
        let frameworkBundle = Bundle(for: KAppStoreFeedbackRateViewController.self)
        let rateVC = KAppStoreFeedbackRateViewController(nibName: "KAppStoreFeedbackRateViewController", bundle: frameworkBundle )
        if let navigationConfig = navigationConfig, let config = config {
            rateVC.configureWith(hostingViewController: hostingViewController, kAppStoreFeedbackNavigationConfig: navigationConfig, kAppStoreFeedbackConfig: config, kAppStoreFeedbackUIElementsConfig: configUIElements)
            rateVC.modalPresentationStyle = .overCurrentContext
            hostingViewController.present(rateVC, animated: true, completion: nil)
        }else {
            print("KAppStoreFeedBackView not initialized, Please call initializeKAppStoreFeedBackView")
        }
    }
}
