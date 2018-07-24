//
//  KAppStoreFeedBackView.swift
//  KAppStoreFeedback
//
//  Created by Prajwal Karanayyana Vasantha on 7/10/18.
//  Copyright © 2018 karanayyana. All rights reserved.
//

import UIKit

public class KAppStoreFeedBackView {

    class public func displayRateViewControllerTo(
                                hostingViewController : UIViewController,
                                navigationConfig : KAppStoreFeedbackNavigationConfig,
                                config : KAppStoreFeedbackConfig?,
                                configUIElements : KAppStoreFeedbackUIElementsConfig?) {
        
        let frameworkBundle = Bundle(for: KAppStoreFeedbackRateViewController.self)
        let rateVC = KAppStoreFeedbackRateViewController(nibName: "KAppStoreFeedbackRateViewController", bundle: frameworkBundle )
        
        rateVC.configureWith(hostingViewController: hostingViewController, kAppStoreFeedbackNavigationConfig: navigationConfig, kAppStoreFeedbackConfig: config, kAppStoreFeedbackUIElementsConfig: configUIElements)
        rateVC.modalPresentationStyle = .overCurrentContext
        hostingViewController.present(rateVC, animated: true, completion: nil)
    }
}
