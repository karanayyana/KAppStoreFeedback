//
//  rateViewController.swift
//  KAppStoreFeedback
//
//  Created by Prajwal Karanayyana Vasantha on 7/10/18.
//  Copyright © 2018 karanayyana. All rights reserved.
//

import UIKit

class KAppStoreFeedbackRateViewController: UIViewController , KAppStoreFeedbackRateViewModelDelegate{

    
    @IBOutlet weak var emoticonView: UIView!
    @IBOutlet weak var ratingView: UIView!
    @IBOutlet weak var thumbsView: UIView!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var buttonView: UIView!
    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var rateButton: UIButton!
    @IBOutlet weak var notNowButton: UIButton!
    
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
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    //MARK:- Public methods
    
    func configureWith(kAppStoreFeedbackConfig : KAppStoreFeedbackConfig ) {
        viewModel.configureWith(kAppStoreFeedbackConfig)
    }
    
    //MARK:- Private Methods
    
    private func setupView() {
        hideAllFeedbackTypes()
        switch viewModel.getKASFFeedbackType() {
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
        message.text =  viewModel.getMessageText()
        titleLabel.text = viewModel.getTitleText()
    }
    
    private func hideAllFeedbackTypes() {
        emoticonView.isHidden = true
        ratingView.isHidden = true
        thumbsView.isHidden = true
    }
    
    //MARK:- KASFRateViewModelDelegate
    
    func updateViewButtons() {
        rateButton.setTitle(viewModel.getRateButtonTitle() , for: .normal)
        notNowButton.setTitle(viewModel.getNotNowButtonTitle(), for: .normal)
        message.isHidden = true
        buttonView.isHidden = false
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
}
