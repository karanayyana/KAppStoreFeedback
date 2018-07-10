//
//  rateViewModel.swift
//  KAppStoreFeedback
//
//  Created by Prajwal Karanayyana Vasantha on 7/10/18.
//  Copyright © 2018 karanayyana. All rights reserved.
//

import UIKit

protocol rateViewModelDelegate: class {
    func updateViewButtons()
}

class rateViewModel: NSObject {

    weak var viewModelDelegate : rateViewModelDelegate?
    
    //MARK:- Configurable Constants
    private var kASFFeedbackType : KASFFeedbackType = KASFFeedbackType.emoticonsView
    private var title : String?
    private var message : String?
    private var notNowButtonTitle : String?
    private var rateButtonTitle : String?
    private var helpButtonTitle : String?
    
    private var itunesLink : String?
    private var helpCenterLink : String?
    private var helpEmail : String?
    
    //MARK:- local Variables
    
    private var isRatingPositive : Bool = true
    //MARK:- Initialize
    init( delegate : rateViewModelDelegate?) {
        viewModelDelegate = delegate
    }
    
    public func setFeedBackType(_ kASFFeedbackType : KASFFeedbackType) {
        self.kASFFeedbackType = kASFFeedbackType
    }
    
    //MARK:- ViewController Helper methods
    
    func getKASFFeedbackType() -> KASFFeedbackType{
        return self.kASFFeedbackType
    }
    
    func getMessageText() -> String {
        return message ?? constants.defaultMessage
    }
    
    func getTitleText() -> String {
        return title ?? constants.defaultTitle
    }
    
    func getRateButtonTitle() -> String {
        return isRatingPositive ? rateButtonTitle ?? constants.defaultRateButtonTitle : helpButtonTitle ?? constants.defaultHelpButtonTitle
    }
    
    func getNotNowButtonTitle() -> String {
        return notNowButtonTitle ?? constants.defaultNotNowTitle
    }
    
    func userSelectedRating(rating : Int) {
        switch kASFFeedbackType {
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
