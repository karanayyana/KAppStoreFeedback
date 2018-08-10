//
//  KAppStoreFeedbackUIElementsConfig.swift
//  KAppStoreFeedback
//
//  Created by Prajwal Karanayyana Vasantha on 7/24/18.
//  Copyright © 2018 karanayyana. All rights reserved.
//

import UIKit

public struct KAppStoreFeedbackUIElementsConfig {
    
    public var alertBackgroundColor: UIColor = UIColor.init(red: 247.0, green: 247.0, blue: 247.0, alpha: 1.0)
    public var alertBorderColor: UIColor   = UIColor.init(red: 228.0/255, green: 231.0/255, blue: 235.0/255, alpha: 1.0)
    public var alertTitleBackgroundColor: UIColor  = UIColor.init(red: 247.0, green: 247.0, blue: 247.0, alpha: 1.0)
    public var alertTitleFontColor: UIColor = UIColor.darkText
    public var alertCornerRadius: Float = 10.0
    public var alertMessageFontColor: UIColor = UIColor.darkText
    public var alertNotNowButtonFontColor: UIColor = UIColor.red
    public var alertRateButtonFontColor: UIColor = UIColor(red: 0, green: 0.478431, blue: 1, alpha: 1)
    public var alertHelpButtonFontColor: UIColor = UIColor(red: 0, green: 0.478431, blue: 1, alpha: 1)
    public var alertTitleFont : UIFont  = UIFont.systemFont(ofSize: 18, weight: .semibold)
    public var alertMessageFont : UIFont = UIFont.systemFont(ofSize: 14, weight: .regular)
    public var alertSecondryButtonFont : UIFont = UIFont.systemFont(ofSize: 15, weight: .medium)
    public var alertPrimaryButtonFont : UIFont =  UIFont.systemFont(ofSize: 15, weight: .medium)
    
    public init() { }
    
    public init (alertBackgroundColor: UIColor?,
                 alertBorderColor: UIColor? ,
                 alertTitleBackgroundColor: UIColor?,
                 alertTitleFontColor: UIColor?,
                 alertMessageFontColor:UIColor?,
                 alertNotNowButtonFontColor: UIColor?,
                 alertRateButtonFontColor: UIColor?,
                 alertHelpButtonFontColor: UIColor?,
                 alertCornerRadius : Float?,
                 alertTitleFont: UIFont?,
                 alertMessageFont: UIFont?,
                 alertSecondryButtonFont : UIFont?,
                 alertPrimaryButtonFont: UIFont? ) {
        
        if let alertBackgroundColor = alertBackgroundColor {
            self.alertBackgroundColor = alertBackgroundColor
        }
        if let alertBorderColor = alertBorderColor {
            self.alertBorderColor = alertBorderColor
        }
        if let alertTitleBackgroundColor = alertTitleBackgroundColor {
            self.alertTitleBackgroundColor = alertTitleBackgroundColor
        }
        if let alertTitleFontColor = alertTitleFontColor {
            self.alertTitleFontColor = alertTitleFontColor
        }
        if let alertMessageFontColor = alertMessageFontColor {
            self.alertMessageFontColor = alertMessageFontColor
        }
        if let alertNotNowButtonFontColor = alertNotNowButtonFontColor {
            self.alertNotNowButtonFontColor = alertNotNowButtonFontColor
        }
        if let alertRateButtonFontColor = alertRateButtonFontColor {
            self.alertRateButtonFontColor = alertRateButtonFontColor
        }
        if let alertHelpButtonFontColor = alertHelpButtonFontColor {
            self.alertHelpButtonFontColor = alertHelpButtonFontColor
        }
        if let alertCornerRadius = alertCornerRadius {
            self.alertCornerRadius = alertCornerRadius
        }
        if let alertTitleFont = alertTitleFont {
            self.alertTitleFont = alertTitleFont
        }
        if let alertMessageFont = alertMessageFont {
            self.alertMessageFont = alertMessageFont
        }
        if let alertSecondryButtonFont = alertSecondryButtonFont {
            self.alertSecondryButtonFont = alertSecondryButtonFont
        }
        if let alertPrimaryButtonFont = alertPrimaryButtonFont {
            self.alertPrimaryButtonFont = alertPrimaryButtonFont
        }
    }
}
