//
//  rateViewController.swift
//  KAppStoreFeedback
//
//  Created by Prajwal Karanayyana Vasantha on 7/10/18.
//  Copyright © 2018 karanayyana. All rights reserved.
//

import UIKit

class rateViewController: UIViewController , rateViewModelDelegate{

    
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
    
    
    
    private lazy var viewModel : rateViewModel = {
        let viewModel = rateViewModel(delegate: self)
        return viewModel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    //MARK:- Public methods
    
    public func setFeedBackType(_ kASFFeedbackType : KASFFeedbackType) {
        viewModel.setFeedBackType(kASFFeedbackType)
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
        if sender.tag == 1 {
            thumbsUpButton.setImage(#imageLiteral(resourceName: "thumbsDown"), for: .normal)
            thumbsDownButton.setImage(#imageLiteral(resourceName: "thumbsUp-unselected"), for: .normal)
        }else {
            thumbsUpButton.setImage(#imageLiteral(resourceName: "thumbsDown-unselected"), for: .normal)
            thumbsDownButton.setImage(#imageLiteral(resourceName: "thumbsUp"), for: .normal)
        }
        viewModel.userSelectedRating(rating: sender.tag)
    }
    
    @IBAction func emoticonButtonClicked(_ sender : UIButton) {
        angryButton.setImage(#imageLiteral(resourceName: "angry-unselected"), for: .normal)
        sadButton.setImage(#imageLiteral(resourceName: "sad-unselected"), for: .normal)
        happyButton.setImage(#imageLiteral(resourceName: "happy-unselected"), for: .normal)
        excitedButton.setImage(#imageLiteral(resourceName: "excited-unselected"), for: .normal)
        switch sender.tag {
        case 1:
            angryButton.setImage(#imageLiteral(resourceName: "angry"), for: .normal)
            break
        case 2:
            sadButton.setImage(#imageLiteral(resourceName: "Sad"), for: .normal)
            break
        case 3:
            happyButton.setImage(#imageLiteral(resourceName: "happy"), for: .normal)
            break
        case 4:
            excitedButton.setImage(#imageLiteral(resourceName: "excited"), for: .normal)
            break
        default:
            break
        }
        viewModel.userSelectedRating(rating: sender.tag)
    }
    
    
    @IBAction func ratingStarsClicked(_ sender : UIButton) {
        switch sender.tag {
        case 1:
            star1Button.setImage(#imageLiteral(resourceName: "star-selected"), for: .normal)
            star2Button.setImage(#imageLiteral(resourceName: "star-un-selected"), for: .normal)
            star3Button.setImage(#imageLiteral(resourceName: "star-un-selected"), for: .normal)
            star4Button.setImage(#imageLiteral(resourceName: "star-un-selected"), for: .normal)
            star5Button.setImage(#imageLiteral(resourceName: "star-un-selected"), for: .normal)
            break
        case 2:
            star1Button.setImage(#imageLiteral(resourceName: "star-selected"), for: .normal)
            star2Button.setImage(#imageLiteral(resourceName: "star-selected"), for: .normal)
            star3Button.setImage(#imageLiteral(resourceName: "star-un-selected"), for: .normal)
            star4Button.setImage(#imageLiteral(resourceName: "star-un-selected"), for: .normal)
            star5Button.setImage(#imageLiteral(resourceName: "star-un-selected"), for: .normal)
            break
        case 3:
            star1Button.setImage(#imageLiteral(resourceName: "star-selected"), for: .normal)
            star2Button.setImage(#imageLiteral(resourceName: "star-selected"), for: .normal)
            star3Button.setImage(#imageLiteral(resourceName: "star-selected"), for: .normal)
            star4Button.setImage(#imageLiteral(resourceName: "star-un-selected"), for: .normal)
            star5Button.setImage(#imageLiteral(resourceName: "star-un-selected"), for: .normal)
            break
        case 4:
            star1Button.setImage(#imageLiteral(resourceName: "star-selected"), for: .normal)
            star2Button.setImage(#imageLiteral(resourceName: "star-selected"), for: .normal)
            star3Button.setImage(#imageLiteral(resourceName: "star-selected"), for: .normal)
            star4Button.setImage(#imageLiteral(resourceName: "star-selected"), for: .normal)
            star5Button.setImage(#imageLiteral(resourceName: "star-un-selected"), for: .normal)
            break
        case 5:
            star1Button.setImage(#imageLiteral(resourceName: "star-selected"), for: .normal)
            star2Button.setImage(#imageLiteral(resourceName: "star-selected"), for: .normal)
            star3Button.setImage(#imageLiteral(resourceName: "star-selected"), for: .normal)
            star4Button.setImage(#imageLiteral(resourceName: "star-selected"), for: .normal)
            star5Button.setImage(#imageLiteral(resourceName: "star-selected"), for: .normal)
            break
        default:
            break
        }
        viewModel.userSelectedRating(rating: sender.tag)
    }
}
