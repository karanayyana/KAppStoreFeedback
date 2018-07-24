//
//  rateViewModel.swift
//  KAppStoreFeedback
//
//  Created by Prajwal Karanayyana Vasantha on 7/10/18.
//  Copyright © 2018 karanayyana. All rights reserved.
//

import UIKit
import MessageUI

protocol KAppStoreFeedbackRateViewModelDelegate: class {
    func updateViewButtons()
    func presentViewController(viewToPresent: UIViewController)
    func dismissViewController()
}

class KAppStoreFeedbackRateViewModel: NSObject, MFMailComposeViewControllerDelegate {

    weak var viewModelDelegate : KAppStoreFeedbackRateViewModelDelegate?
    
    //MARK:- Configurable Constants
    var kAppStoreFeedbackConfig : KAppStoreFeedbackConfig = KAppStoreFeedbackConfig()
    var kAppStoreFeedbackUIElementsConfig : KAppStoreFeedbackUIElementsConfig = KAppStoreFeedbackUIElementsConfig()
    var kAppStoreFeedbackNavigationConfig : KAppStoreFeedbackNavigationConfig?
    var hostingViewController : UIViewController?
    
    private var itunesLink : String?
    private var helpCenterLink : String?
    private var helpEmail : String?
    
    private var minimumLoginAttempt : Int = 15

    var isRatingPositive : Bool = true
    
    //MARK:- Initialize
    init( delegate : KAppStoreFeedbackRateViewModelDelegate?) {
        viewModelDelegate = delegate
    }
    
    func configureWith(
                    hostingViewController : UIViewController,
                   kAppStoreFeedbackNavigationConfig :KAppStoreFeedbackNavigationConfig,
                    kAppStoreFeedbackConfig : KAppStoreFeedbackConfig?,
                    kAppStoreFeedbackUIElementsConfig : KAppStoreFeedbackUIElementsConfig? ){
        
        self.hostingViewController =  hostingViewController
        self.kAppStoreFeedbackNavigationConfig = kAppStoreFeedbackNavigationConfig
        if let kAppStoreFeedbackConfig = kAppStoreFeedbackConfig {
            self.kAppStoreFeedbackConfig = kAppStoreFeedbackConfig
        }
        if let kAppStoreFeedbackUIElementsConfig = kAppStoreFeedbackUIElementsConfig {
            self.kAppStoreFeedbackUIElementsConfig = kAppStoreFeedbackUIElementsConfig
        }
    }
    
    //MARK:- Helper methods
 
    func getRateButtonTitle() -> String {
        return isRatingPositive ? kAppStoreFeedbackConfig.rateButtonTitle : kAppStoreFeedbackConfig.helpButtonTitle
    }
    
    func getRateButtonFontColor() -> UIColor {
        return isRatingPositive ? kAppStoreFeedbackUIElementsConfig.alertRateButtonFontColor : kAppStoreFeedbackUIElementsConfig.alertHelpButtonFontColor
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

    func getPossitiveFeedBackURL() -> String {
        return kAppStoreFeedbackNavigationConfig?.iTunesLink ?? ""
    }
    
    func getNegetiveFeedBackURL() -> String? {
        return kAppStoreFeedbackNavigationConfig?.helpLink
    }
    
    func getNegetiveFeedBackEmail() -> String? {
        return kAppStoreFeedbackNavigationConfig?.helpEmail
    }
    
    func handlePossitiveFeedBackInteraction() {
        if let url = URL(string: getPossitiveFeedBackURL()) {
           navigateToURL(url: url)
        }
    }
    
    func handleNegetiveFeedBackInteraction() {
        if let urlString = getNegetiveFeedBackURL(), let url = URL(string:urlString) {
            navigateToURL(url: url)
        }else if let email = getNegetiveFeedBackEmail() {
            sendEmail(email: email)
        }else {
            // No negetive links available so take them to possitive review
            handlePossitiveFeedBackInteraction()
        }
    }
    
    func navigateToURL(url : URL) {
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
        viewModelDelegate?.dismissViewController()
    }
    
    //MARK:- Message UI
    
    func sendEmail(email :String) {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients([email])
            mail.setMessageBody(getMessageInfo(), isHTML: false)
            viewModelDelegate?.presentViewController(viewToPresent: mail)
        } else {
            showNoEmailClientAlert()
        }
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
        viewModelDelegate?.dismissViewController()
    }
    
    func getMessageInfo() -> String {
        let Appversion =  Bundle.main.infoDictionary!["CFBundleVersion"] as? String ?? "Unknown"
        let identifier = (UIDevice.current.identifierForVendor?.description) ?? "Unknown"
        let info = String(format: "\n\n\n\n\n\n-------Donot remove------\nAppVersion : %@\nSystem version : %@\nSystem identifier : %@",Appversion, UIDevice.current.systemVersion, identifier)
        return info
    }
    
    func showNoEmailClientAlert() {
        let alert = UIAlertController(title: "Email Not Setup", message: "Please configure email account in device mail settings" , preferredStyle: .alert)
        
        let yesAction = UIAlertAction(title: "Ok", style: .default, handler: { [weak self] (action) in
            self?.viewModelDelegate?.dismissViewController()
        })
        alert.addAction(yesAction)
        viewModelDelegate?.presentViewController(viewToPresent: alert)
    }

}
