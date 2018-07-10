//
//  KASFRateViewModel.swift
//  KAppStroreFeedback
//
//  Created by Prajwal Karanayyana Vasantha on 7/9/18.
//  Copyright © 2018 karanayyana. All rights reserved.
//

import UIKit

protocol KASFRateViewModelDelegate: class {
    func updateViewButtons()
}

class KASFRateViewModel: NSObject {

    weak var viewModelDelegate : KASFRateViewModelDelegate?
    
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
    init( delegate : KASFRateViewModelDelegate?) {
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
        return message ?? KASFConstants.defaultMessage
    }
    
    func getTitleText() -> String {
        return title ?? KASFConstants.defaultTitle
    }
    
    func getRateButtonTitle() -> String {
        return isRatingPositive ? rateButtonTitle ?? KASFConstants.defaultRateButtonTitle : helpButtonTitle ?? KASFConstants.defaultHelpButtonTitle
    }
    
    func getNotNowButtonTitle() -> String {
        return notNowButtonTitle ?? KASFConstants.defaultNotNowTitle
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
