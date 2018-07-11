//
//  KAppStoreFeedBackView.swift
//  KAppStoreFeedback
//
//  Created by Prajwal Karanayyana Vasantha on 7/10/18.
//  Copyright © 2018 karanayyana. All rights reserved.
//

import UIKit

public class KAppStoreFeedBackView: NSObject {

    private lazy var rateVC : rateViewController = {
        let viewModel = rateViewController(nibName: "rateViewController", bundle: .main)
        return viewModel
    }()
    
    private override init() {
        
    }
    
    public func getRateViewController(type : KAppStoreFeedbackType) -> UIViewController {
        rateVC.setFeedBackType(type)
        return rateVC
        
    }
}
