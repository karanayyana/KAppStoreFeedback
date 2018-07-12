//
//  ViewController.swift
//  KAppStoreFeedbackExample
//
//  Created by Prajwal Karanayyana Vasantha on 7/10/18.
//  Copyright © 2018 karanayyana. All rights reserved.
//

import UIKit
import KAppStoreFeedback

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
//        let appStoreFeedBackView =  KAppStoreFeedBackView.getRateViewController(type: KAppStoreFeedbackType.emoticonsView)
        let config = Config()
        KAppStoreFeedBackView.displayRateViewControllerTo(hostingViewController: self, config: config)
//        self.present(appStoreFeedBackView, animated: true, completion: nil)
    }
}

