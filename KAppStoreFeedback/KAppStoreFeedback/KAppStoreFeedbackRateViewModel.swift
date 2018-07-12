//
//  rateViewModel.swift
//  KAppStoreFeedback
//
//  Created by Prajwal Karanayyana Vasantha on 7/10/18.
//  Copyright © 2018 karanayyana. All rights reserved.
//

import UIKit

protocol KAppStoreFeedbackRateViewModelDelegate: class {
    func updateViewButtons()
}

class KAppStoreFeedbackRateViewModel: NSObject {

    weak var viewModelDelegate : KAppStoreFeedbackRateViewModelDelegate?
    
    //MARK:- Configurable Constants
    private var kAppStoreFeedbackConfig : KAppStoreFeedbackConfig = KAppStoreFeedbackConfig()
    
    private var itunesLink : String?
    private var helpCenterLink : String?
    private var helpEmail : String?
    
    private var minimumLoginAttempt : Int = 15
    
    //MARK:- local Variables
    
    private var isRatingPositive : Bool = true
    
    //MARK:- Initialize
    init( delegate : KAppStoreFeedbackRateViewModelDelegate?) {
        viewModelDelegate = delegate
    }
    
    func configureWith(_ kAppStoreFeedbackConfig : KAppStoreFeedbackConfig ) {
        self.kAppStoreFeedbackConfig = kAppStoreFeedbackConfig
    }
    
    //MARK:- ViewController Helper methods
    
    func getKASFFeedbackType() -> KAppStoreFeedbackType{
        return kAppStoreFeedbackConfig.kASFFeedbackType
    }
    
    func getMessageText() -> String {
        return kAppStoreFeedbackConfig.message
    }
    
    func getTitleText() -> String {
        return kAppStoreFeedbackConfig.title
    }
    
    func getRateButtonTitle() -> String {
        return isRatingPositive ? kAppStoreFeedbackConfig.rateButtonTitle : kAppStoreFeedbackConfig.helpButtonTitle
    }
    
    func getNotNowButtonTitle() -> String {
        return kAppStoreFeedbackConfig.notNowButtonTitle
    }
    
    func userSelectedRating(rating : Int) {
        switch kAppStoreFeedbackConfig.kASFFeedbackType {
        case .emoticonsView:
            isRatingPositive = rating >= 3 ? true : false
            break
        case .ratingsView:
            isRatingPositive = rating >= 4 ? true : false
            break
        case .thumbsView:
            isRatingPositive = rating == 2 ? true : false
            break
        }
        viewModelDelegate?.updateViewButtons()
    }
}
