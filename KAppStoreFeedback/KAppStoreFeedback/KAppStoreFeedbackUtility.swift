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
            appLaunchCount = appLaunchCount + 1
            let isDontAskMeAgainTrue = userDefault.bool(forKey: "KAppStoreFeedBackView_DontAskMeAgain")
            if (appLaunchCount % minimumAtempt == 0 && !isDontAskMeAgainTrue) {
                displayAlert(hostingViewController: hostingViewController, navigationConfig: navigationConfig, config: config, configUIElements: configUIElements, displayDontAskMe: true)
            }
            if !isDontAskMeAgainTrue {
                DispatchQueue.main.async {
                    userDefault = UserDefaults.standard
                    userDefault.set(appLaunchCount , forKey: "KAppStoreFeedBackView_appLaunchCount")
                    userDefault.synchronize()
                }
            }
        }else {
            print("KAppStoreFeedBackView not initialized, Please call initializeKAppStoreFeedBackView")
        }
    }
    
    class func displayAlert(hostingViewController : UIViewController,
                            navigationConfig : KAppStoreFeedbackNavigationConfig?,
                            config : KAppStoreFeedbackConfig?,
                            configUIElements : KAppStoreFeedbackUIElementsConfig?,
                            displayDontAskMe : Bool) {
        let frameworkBundle = Bundle(for: KAppStoreFeedbackRateViewController.self)
        let rateVC = KAppStoreFeedbackRateViewController(nibName: "KAppStoreFeedbackRateViewController", bundle: frameworkBundle )
        if let navigationConfig = navigationConfig, let config = config {
            rateVC.configureWith(hostingViewController: hostingViewController, kAppStoreFeedbackNavigationConfig: navigationConfig, kAppStoreFeedbackConfig: config, kAppStoreFeedbackUIElementsConfig: configUIElements, displayDontAskMe: displayDontAskMe)
            rateVC.modalPresentationStyle = .overCurrentContext
            hostingViewController.present(rateVC, animated: true, completion: nil)
        }else {
            print("KAppStoreFeedBackView not initialized, Please call initializeKAppStoreFeedBackView")
        }
    }
    
    class func forceRateViewController(hostingViewController : UIViewController,
                            navigationConfig : KAppStoreFeedbackNavigationConfig?,
                            config : KAppStoreFeedbackConfig?,
                            configUIElements : KAppStoreFeedbackUIElementsConfig?,
                            displayDontAskMe : Bool) {
        let frameworkBundle = Bundle(for: KAppStoreFeedbackRateViewController.self)
        let rateVC = KAppStoreFeedbackRateViewController(nibName: "KAppStoreFeedbackRateViewController", bundle: frameworkBundle )
        if let navigationConfig = navigationConfig, let config = config {
            let userDefault = UserDefaults.standard
            let isDontAskMeAgainTrue = userDefault.bool(forKey: "KAppStoreFeedBackView_DontAskMeAgain")
            if !isDontAskMeAgainTrue {
                rateVC.configureWith(hostingViewController: hostingViewController, kAppStoreFeedbackNavigationConfig: navigationConfig, kAppStoreFeedbackConfig: config, kAppStoreFeedbackUIElementsConfig: configUIElements, displayDontAskMe: displayDontAskMe)
                rateVC.modalPresentationStyle = .overCurrentContext
                hostingViewController.present(rateVC, animated: true, completion: nil)
            }
        }else {
            print("KAppStoreFeedBackView not initialized, Please call initializeKAppStoreFeedBackView")
        }
    }
    
    class func dontAskMeAgain() {
        var userDefault = UserDefaults.standard
        userDefault = UserDefaults.standard
        userDefault.set(true , forKey: "KAppStoreFeedBackView_DontAskMeAgain")
        userDefault.synchronize()
    }
    
    class func resetkAppStoreFeedback() {
        var userDefault = UserDefaults.standard
        userDefault = UserDefaults.standard
        userDefault.set(false , forKey: "KAppStoreFeedBackView_DontAskMeAgain")
        userDefault.removeObject(forKey:"KAppStoreFeedBackView_appLaunchCount")
        userDefault.synchronize()
    }
}
