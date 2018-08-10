//
//  ViewController.swift
//  KAppStoreFeedbackExample
//
//  Created by Prajwal Karanayyana Vasantha on 7/10/18.
//  Copyright © 2018 karanayyana. All rights reserved.
//

import UIKit
import KAppStoreFeedback

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var messageTextField: UITextField!
    @IBOutlet weak var notNotTextField: UITextField!
    @IBOutlet weak var helpTextField: UITextField!
    @IBOutlet weak var rateTextField: UITextField!
    @IBOutlet weak var attemptTextField: UITextField!
    @IBOutlet weak var alertType: UISegmentedControl!
    @IBOutlet weak var textOverrideView: UIStackView!
   
    
    @IBOutlet weak var alertBackgroundColorButton: UIButton!
    @IBOutlet weak var alertBorderColorButton: UIButton!
    @IBOutlet weak var alertTitleBackgroundColorButton: UIButton!
    @IBOutlet weak var alertTitleFontColorButton: UIButton!
    @IBOutlet weak var alertMessageFontColorButton: UIButton!
    @IBOutlet weak var alertNotNowButtonFontColorButton: UIButton!
    @IBOutlet weak var alertRateButtonFontColorButton: UIButton!
    @IBOutlet weak var alertHelpButtonFontColorButton: UIButton!
    @IBOutlet weak var alertTitleFontButton: UIButton!
    @IBOutlet weak var alertMessageFontButton: UIButton!
    @IBOutlet weak var alertSecondryButtonFontButton: UIButton!
    @IBOutlet weak var alertPrimaryButtonFontButton: UIButton!
    @IBOutlet weak var alertCornerRadius: UITextField!
    @IBOutlet weak var textUIElementOverrideView: UIStackView!
    
    @IBOutlet weak var appStoreLinkTextField: UITextField!
    @IBOutlet weak var helpCenterLinkTextField: UITextField!
    @IBOutlet weak var helpEmailTextField: UITextField!

    var selectedButton : UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeKappStoreFeedback()
    }
    //MARK:- Private Methods
    private func prepareKAppStoreFeedbackConfig() -> KAppStoreFeedbackConfig {
        let title = titleTextField.text == "" ? nil : titleTextField.text
        let message = messageTextField.text == "" ? nil : messageTextField.text
        let notNow = notNotTextField.text == "" ? nil : notNotTextField.text
        let help = helpTextField.text == "" ? nil : helpTextField.text
        let rate = rateTextField.text == "" ? nil : rateTextField.text
        let attempt = Int(attemptTextField.text ?? "")
        
        var type =  KAppStoreFeedbackType.ratingsView
        switch alertType.selectedSegmentIndex {
        case 0:
            type = KAppStoreFeedbackType.ratingsView
        case 1:
            type = KAppStoreFeedbackType.emoticonsView
        case 2:
            type = KAppStoreFeedbackType.thumbsView
        default:
            type = KAppStoreFeedbackType.ratingsView
        }
        
        let config = KAppStoreFeedbackConfig(kASFFeedbackType: type, title: title, message: message, notNowButtonTitle: notNow, rateButtonTitle: rate, helpButtonTitle: help, minimumLoginAttempt: attempt)
        return config
    }
    
    private func prepareKAppStoreFeedbackUIElementsConfig() -> KAppStoreFeedbackUIElementsConfig {
        let alertBackgroundColor = alertBackgroundColorButton.isSelected ? alertBackgroundColorButton.tintColor : nil
        let alertBorderColor = alertBorderColorButton.isSelected ? alertBorderColorButton.tintColor : nil
        let alertTitleBackgroundColor = alertTitleBackgroundColorButton.isSelected ? alertTitleBackgroundColorButton.tintColor : nil
        let alertTitleFontColor = alertTitleFontColorButton.isSelected ? alertTitleFontColorButton.tintColor : nil
        let alertMessageFontColor = alertMessageFontColorButton.isSelected ? alertMessageFontColorButton.tintColor : nil
        let alertNotNowButtonFontColor = alertNotNowButtonFontColorButton.isSelected ? alertNotNowButtonFontColorButton.tintColor : nil
        let alertRateButtonFontColor = alertRateButtonFontColorButton.isSelected ?alertRateButtonFontColorButton.tintColor : nil
        let alertHelpButtonFontColor = alertHelpButtonFontColorButton.isSelected ? alertHelpButtonFontColorButton.tintColor : nil
        var alertCornerRadius : Float?
        if let alertCornerRadiusString = self.alertCornerRadius.text, let alertCornerRadiusFloat = Float(alertCornerRadiusString)  {
            alertCornerRadius = alertCornerRadiusFloat
        }
    
        let alertTitleFont = alertTitleFontButton.isSelected ?alertTitleFontButton.titleLabel?.font : nil
        let alertMessageFont = alertMessageFontButton.isSelected ? alertMessageFontButton.titleLabel?.font : nil
        let alertSecondryButtonFont = alertSecondryButtonFontButton.isSelected ? alertSecondryButtonFontButton.titleLabel?.font : nil
        let alertPrimaryButtonFont = alertPrimaryButtonFontButton.isSelected ? alertPrimaryButtonFontButton.titleLabel?.font : nil
        return  KAppStoreFeedbackUIElementsConfig(alertBackgroundColor: alertBackgroundColor,
                                          alertBorderColor: alertBorderColor,
                                          alertTitleBackgroundColor: alertTitleBackgroundColor,
                                          alertTitleFontColor: alertTitleFontColor,
                                          alertMessageFontColor: alertMessageFontColor,
                                          alertNotNowButtonFontColor: alertNotNowButtonFontColor,
                                          alertRateButtonFontColor: alertRateButtonFontColor,
                                          alertHelpButtonFontColor: alertHelpButtonFontColor,
                                          alertCornerRadius: alertCornerRadius ,
                                          alertTitleFont: alertTitleFont,
                                          alertMessageFont: alertMessageFont,
                                          alertSecondryButtonFont: alertSecondryButtonFont,
                                          alertPrimaryButtonFont: alertPrimaryButtonFont)
        
        
        
    }

    private func prepareKAppStoreFeedbackNavigationConfig() ->  KAppStoreFeedbackNavigationConfig {
        let appStoreLink = appStoreLinkTextField.text
        let helpCenterLink = helpCenterLinkTextField.text
        let helpEmailLink = helpEmailTextField.text
        return KAppStoreFeedbackNavigationConfig(iTunesLink:  appStoreLink  , helpEmail: helpEmailLink, helpLink: helpCenterLink, callBackdelegate: nil)
    }
    
    private func initializeKappStoreFeedback() {
        KAppStoreFeedBackView.shared.initializeKAppStoreFeedBackView(hostingViewController: self, navigationConfig: prepareKAppStoreFeedbackNavigationConfig(), config: prepareKAppStoreFeedbackConfig(), configUIElements: prepareKAppStoreFeedbackUIElementsConfig())
    }
    
   
    
    //MARK:- IBActionss
    
    @IBAction func showAlertClicked(_ sender : UIButton) {
        initializeKappStoreFeedback()
        KAppStoreFeedBackView.shared.displayRateViewControllerOn(hostingViewController: self)
    }
    
    @IBAction func modifyAlertClicked(_ sender : UIButton) {
        textOverrideView.isHidden = !textOverrideView.isHidden
    }
    
    @IBAction func modifyTextUIElementOverrideClicked(_ sender : UIButton) {
        textUIElementOverrideView.isHidden = !textUIElementOverrideView.isHidden
    }
    
    @IBAction func selectColorClicked(_ sender : UIButton) {
        self.selectedButton = sender
        self.performSegue(withIdentifier: "selectColorSegue", sender: self)
    }
    
    @IBAction func selectFontClicked(_ sender : UIButton) {
        self.selectedButton = sender
        self.performSegue(withIdentifier: "selectFontSegue", sender: self)
    }
    
    //MARK:- TextField Delegate
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "selectColorSegue" {
            if let colorPickerTableVC = segue.destination as? colorPickerTableViewController{
                colorPickerTableVC.selectedButton = self.selectedButton
            }
        }
        if segue.identifier == "selectFontSegue" {
            if let fontPickerTableVC = segue.destination as? fontPickerTableViewController{
                fontPickerTableVC.selectedButton = self.selectedButton
            }
        }
        
     }
    
    
}

