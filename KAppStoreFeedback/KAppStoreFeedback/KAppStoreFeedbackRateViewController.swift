//
//  rateViewController.swift
//  KAppStoreFeedback
//
//  Created by Prajwal Karanayyana Vasantha on 7/10/18.
//  Copyright © 2018 karanayyana. All rights reserved.
//

import UIKit
import MessageUI

class KAppStoreFeedbackRateViewController: UIViewController , KAppStoreFeedbackRateViewModelDelegate{

    @IBOutlet weak var feedbackView: UIView!
    @IBOutlet weak var feedbackBackgroundView: UIView!
    @IBOutlet weak var emoticonView: UIView!
    @IBOutlet weak var ratingView: UIView!
    @IBOutlet weak var thumbsView: UIView!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var buttonView: UIView!
    @IBOutlet weak var buttonTopSeperaterView: UIView!
    @IBOutlet weak var buttonBottomSeperaterView: UIView!
    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var rateButton: UIButton!
    @IBOutlet weak var notNowButton: UIButton!
    @IBOutlet weak var dontAskMeAgain: UIButton!
    @IBOutlet weak var dontAskMeAgainDivider: UIView!
    @IBOutlet weak var alertHeightConstraint: NSLayoutConstraint!
    
    //Ratings
    @IBOutlet weak var star1Button: UIButton!
    @IBOutlet weak var star2Button: UIButton!
    @IBOutlet weak var star3Button: UIButton!
    @IBOutlet weak var star4Button: UIButton!
    @IBOutlet weak var star5Button: UIButton!
    
    //Thumbs
    @IBOutlet weak var thumbsUpButton: UIButton!
    @IBOutlet weak var thumbsDownButton: UIButton!
    
    //Emoticons
    @IBOutlet weak var angryButton: UIButton!
    @IBOutlet weak var sadButton: UIButton!
    @IBOutlet weak var happyButton: UIButton!
    @IBOutlet weak var excitedButton: UIButton!
    
    
    
    private lazy var viewModel : KAppStoreFeedbackRateViewModel = {
        let viewModel = KAppStoreFeedbackRateViewModel(delegate: self)
        return viewModel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        feedbackView.alpha = 0
        setupView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 0.2) { [weak self] in
            self?.view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
            self?.feedbackView.alpha = 1
        }
        
    }
    
    //MARK:- Public methods
    
    func configureWith(
                hostingViewController : UIViewController,
                kAppStoreFeedbackNavigationConfig :KAppStoreFeedbackNavigationConfig,
                kAppStoreFeedbackConfig : KAppStoreFeedbackConfig,
                kAppStoreFeedbackUIElementsConfig : KAppStoreFeedbackUIElementsConfig?,
                displayDontAskMe : Bool) {
        viewModel.configureWith(
            hostingViewController: hostingViewController, kAppStoreFeedbackNavigationConfig: kAppStoreFeedbackNavigationConfig,
                        kAppStoreFeedbackConfig: kAppStoreFeedbackConfig,
                        kAppStoreFeedbackUIElementsConfig: kAppStoreFeedbackUIElementsConfig,
                        displayDontAskMe: displayDontAskMe)
    }
    
    //MARK:- Private Methods
    
    private func setupView() {
        hideAllFeedbackTypes()
        switch viewModel.kAppStoreFeedbackConfig.kASFFeedbackType {
        case .emoticonsView:
            emoticonView.isHidden = false
            break
        case .ratingsView:
            ratingView.isHidden = false
            break
        case .thumbsView:
            thumbsView.isHidden = false
            break
        }
        buttonView.isHidden = true
        message.isHidden = false
        message.text =  viewModel.kAppStoreFeedbackConfig.message
        titleLabel.text = viewModel.kAppStoreFeedbackConfig.title
        notNowButton.setTitle(viewModel.kAppStoreFeedbackConfig.notNowButtonTitle, for: .normal)
        
        
        //kAppStoreFeedbackUIElementsConfig
        feedbackView.backgroundColor = viewModel.kAppStoreFeedbackUIElementsConfig.alertBorderColor
        buttonTopSeperaterView.backgroundColor = viewModel.kAppStoreFeedbackUIElementsConfig.alertBorderColor
        buttonBottomSeperaterView.backgroundColor = viewModel.kAppStoreFeedbackUIElementsConfig.alertBorderColor
        feedbackBackgroundView.backgroundColor = viewModel.kAppStoreFeedbackUIElementsConfig.alertBackgroundColor
        headerView.backgroundColor = viewModel.kAppStoreFeedbackUIElementsConfig.alertTitleBackgroundColor
        titleLabel.textColor = viewModel.kAppStoreFeedbackUIElementsConfig.alertTitleFontColor
        message.textColor = viewModel.kAppStoreFeedbackUIElementsConfig.alertMessageFontColor
        notNowButton.setTitleColor(viewModel.kAppStoreFeedbackUIElementsConfig.alertNotNowButtonFontColor, for: .normal)
        dontAskMeAgain.setTitleColor(viewModel.kAppStoreFeedbackUIElementsConfig.alertNotNowButtonFontColor, for: .normal)

        titleLabel.font = viewModel.kAppStoreFeedbackUIElementsConfig.alertTitleFont
        message.font = viewModel.kAppStoreFeedbackUIElementsConfig.alertMessageFont
        rateButton.titleLabel?.font = viewModel.kAppStoreFeedbackUIElementsConfig.alertPrimaryButtonFont
        notNowButton.titleLabel?.font = viewModel.kAppStoreFeedbackUIElementsConfig.alertSecondryButtonFont
        dontAskMeAgain.titleLabel?.font = viewModel.kAppStoreFeedbackUIElementsConfig.alertSecondryButtonFont
        
        feedbackView.layer.cornerRadius = CGFloat(viewModel.kAppStoreFeedbackUIElementsConfig.alertCornerRadius)
        feedbackBackgroundView.layer.cornerRadius = CGFloat(viewModel.kAppStoreFeedbackUIElementsConfig.alertCornerRadius)
        feedbackView.layer.masksToBounds = true
        feedbackBackgroundView.layer.masksToBounds = true
        

        dontAskMeAgain.isHidden = !viewModel.displayDontAskMe
        dontAskMeAgainDivider.isHidden = !viewModel.displayDontAskMe
        alertHeightConstraint.constant = viewModel.displayDontAskMe ? 230 : 190
        
    }
    
    private func hideAllFeedbackTypes() {
        emoticonView.isHidden = true
        ratingView.isHidden = true
        thumbsView.isHidden = true
    }
    
    //MARK:- KASFRateViewModelDelegate
    
    func updateViewButtons() {
        rateButton.setTitle(viewModel.getRateButtonTitle() , for: .normal)
        rateButton.setTitleColor(viewModel.getRateButtonFontColor(), for: .normal)

        // Delay hide action or else there will be a flash on UI
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.1) { [weak self] in
            if let nonNilSelf = self {
                nonNilSelf.message.isHidden = true
                nonNilSelf.buttonView.isHidden = false
            }
        }
    }
    
    func presentViewController(viewToPresent: UIViewController) {
        present(viewToPresent, animated: true)
    }
    
    func dismissViewController() {
        UIView.animate(withDuration: 0.2, animations: { [weak self] in
            self?.view.backgroundColor = UIColor.clear
            self?.feedbackView.alpha = 0
        }) { [weak self] (_) in
            self?.dismiss(animated: false, completion: nil)
        }
    }
    
    //MARK:- IBAction
    
    @IBAction func thumbsButtonClicked(_ sender : UIButton) {
        let frameworkBundle = Bundle(for: KAppStoreFeedbackRateViewController.self)
        if sender.tag == 1 {
            thumbsUpButton.setImage(UIImage(named: "thumbsUp-unselected", in: frameworkBundle, compatibleWith: nil), for: .normal)
            thumbsDownButton.setImage(UIImage(named: "thumbsDown", in: frameworkBundle, compatibleWith: nil), for: .normal)
        }else {
            thumbsUpButton.setImage(UIImage(named: "thumbsUp", in: frameworkBundle, compatibleWith: nil), for: .normal)
            thumbsDownButton.setImage(UIImage(named: "thumbsDown-unselected", in: frameworkBundle, compatibleWith: nil), for: .normal)
        }
        viewModel.userSelectedRating(rating: sender.tag)
    }
    
    @IBAction func emoticonButtonClicked(_ sender : UIButton) {
        let frameworkBundle = Bundle(for: KAppStoreFeedbackRateViewController.self)
        angryButton.setImage(UIImage(named: "angry-unselected", in: frameworkBundle, compatibleWith: nil), for: .normal)
        sadButton.setImage(UIImage(named: "sad-unselected", in: frameworkBundle, compatibleWith: nil), for: .normal)
        happyButton.setImage(UIImage(named: "happy-unselected", in: frameworkBundle, compatibleWith: nil), for: .normal)
        excitedButton.setImage(UIImage(named: "excited-unselected", in: frameworkBundle, compatibleWith: nil), for: .normal)
        switch sender.tag {
        case 1:
            angryButton.setImage(UIImage(named: "angry", in: frameworkBundle, compatibleWith: nil), for: .normal)
            break
        case 2:
            sadButton.setImage(UIImage(named: "sad", in: frameworkBundle, compatibleWith: nil), for: .normal)
            break
        case 3:
            happyButton.setImage(UIImage(named: "happy", in: frameworkBundle, compatibleWith: nil), for: .normal)
            break
        case 4:
            excitedButton.setImage(UIImage(named: "excited", in: frameworkBundle, compatibleWith: nil), for: .normal)
            break
        default:
            break
        }
        viewModel.userSelectedRating(rating: sender.tag)
    }
    
    
    @IBAction func ratingStarsClicked(_ sender : UIButton) {
        let frameworkBundle = Bundle(for: KAppStoreFeedbackRateViewController.self)
        let star =  UIImage(named: "star-selected", in: frameworkBundle, compatibleWith: nil)
        let unselectedStar = UIImage(named: "star-un-selected", in: frameworkBundle, compatibleWith: nil)
        switch sender.tag {
        case 1:
            star1Button.setImage(star, for: .normal)
            star2Button.setImage(unselectedStar, for: .normal)
            star3Button.setImage(unselectedStar, for: .normal)
            star4Button.setImage(unselectedStar, for: .normal)
            star5Button.setImage(unselectedStar, for: .normal)
            break
        case 2:
            star1Button.setImage(star, for: .normal)
            star2Button.setImage(star, for: .normal)
            star3Button.setImage(unselectedStar, for: .normal)
            star4Button.setImage(unselectedStar, for: .normal)
            star5Button.setImage(unselectedStar, for: .normal)
            break
        case 3:
            star1Button.setImage(star, for: .normal)
            star2Button.setImage(star, for: .normal)
            star3Button.setImage(star, for: .normal)
            star4Button.setImage(unselectedStar, for: .normal)
            star5Button.setImage(unselectedStar, for: .normal)
            break
        case 4:
            star1Button.setImage(star, for: .normal)
            star2Button.setImage(star, for: .normal)
            star3Button.setImage(star, for: .normal)
            star4Button.setImage(star, for: .normal)
            star5Button.setImage(unselectedStar, for: .normal)
            break
        case 5:
            star1Button.setImage(star, for: .normal)
            star2Button.setImage(star, for: .normal)
            star3Button.setImage(star, for: .normal)
            star4Button.setImage(star, for: .normal)
            star5Button.setImage(star, for: .normal)
            break
        default:
            break
        }
        viewModel.userSelectedRating(rating: sender.tag)
    }
    
    
    @IBAction func notNowClicked(_ sender : UIButton) {

        UIView.animate(withDuration: 0.2, animations: { [weak self] in
            self?.view.backgroundColor = UIColor.clear
            self?.feedbackView.alpha = 0
        }) { [weak self] (_) in
            self?.dismiss(animated: true, completion: nil)
        }
        
    }
    
    @IBAction func dontAskMeAgainClicked(_ sender : UIButton) {
        viewModel.dontAskMeAgainClicked()
        UIView.animate(withDuration: 0.2, animations: { [weak self] in
            self?.view.backgroundColor = UIColor.clear
            self?.feedbackView.alpha = 0
        }) { [weak self] (_) in
            self?.dismiss(animated: true, completion: nil)
        }
        
    }
    
    @IBAction func primaryButtonClicked(_ sender : UIButton) {
        if self.viewModel.isRatingPositive ?? false {
            self.viewModel.handlePossitiveFeedBackInteraction()
        }else {
            self.viewModel.handleNegetiveFeedBackInteraction()
        }
    }
    
    //MARK:- User Interactions
    
   
}
