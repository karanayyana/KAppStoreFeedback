//
//  KAppStoreFeedBackView.swift
//  KAppStoreFeedback
//
//  Created by Prajwal Karanayyana Vasantha on 7/10/18.
//  Copyright © 2018 karanayyana. All rights reserved.
//

import UIKit

public class KAppStoreFeedBackView {


    
    class public func displayRateViewControllerTo(hostingViewController : UIViewController, config : KAppStoreFeedbackConfig) {
        let frameworkBundle = Bundle(for: KAppStoreFeedbackRateViewController.self)
        let rateVC = KAppStoreFeedbackRateViewController(nibName: "rateViewController", bundle: frameworkBundle )
        rateVC.configureWith(kAppStoreFeedbackConfig: config)
        hostingViewController.present(rateVC, animated: true, completion: nil)
        
    }
}
