//
//  KAppStoreFeedBackView.swift
//  KAppStoreFeedback
//
//  Created by Prajwal Karanayyana Vasantha on 7/10/18.
//  Copyright © 2018 karanayyana. All rights reserved.
//

import UIKit

public class KAppStoreFeedBackView {

    public static let shared = KAppStoreFeedBackView()
    
    private var navigationConfig : KAppStoreFeedbackNavigationConfig?
    private var config : KAppStoreFeedbackConfig?
    private var configUIElements : KAppStoreFeedbackUIElementsConfig?
    
    
    /*
     KAppStoreFeedBackView works only when initialized
     upon initialize KAppStoreFeedBackView check if the app launch counter matches the conditions to populate feedback alert
     
     KAppStoreFeedBackView offers a wide range of customizable parameters
     reffer to individual config struct for more details
     */
    public func initializeKAppStoreFeedBackView(hostingViewController : UIViewController,
                                                navigationConfig : KAppStoreFeedbackNavigationConfig,
                                                config : KAppStoreFeedbackConfig,
                                                configUIElements : KAppStoreFeedbackUIElementsConfig?) {
        self.navigationConfig = navigationConfig
        self.config = config
        self.configUIElements = configUIElements
        KAppStoreFeedbackUtility.checkIfMinimumAppLaunchCounterReached(hostingViewController: hostingViewController, navigationConfig: navigationConfig, config: config, configUIElements: configUIElements)
    }
    
    
    /*
    call this method to invoke rate alert upon request
    ensure that KAppStoreFeedBackView is initialized before making this call
    */
    
    public func displayRateViewControllerOn(hostingViewController : UIViewController) {
        KAppStoreFeedbackUtility.displayAlert(hostingViewController: hostingViewController, navigationConfig: navigationConfig, config: config, configUIElements: configUIElements)
    }
    
    /*
     call this method to reset the counter of app launches
     default is 5
     */
    
    public func resetKAppStoreFeedBackView() {
        let userDefaults = UserDefaults.standard
        userDefaults.removeObject(forKey:"KAppStoreFeedBackView_appLaunchCount")
        userDefaults.synchronize()
    }
    
    
}
