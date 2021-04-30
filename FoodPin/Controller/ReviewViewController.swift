//
//  ReviewViewController.swift
//  FoodPin
//
//  Created by Chris Gaona on 4/29/21.
//

import UIKit

class ReviewViewController: UIViewController {
    
    @IBOutlet var backgroundImageView: UIImageView!
    @IBOutlet var rateButtons: [UIButton]!
    @IBOutlet var closeButton: UIButton!
    
    var restaurant = Restaurant()

    // This is called when the view is first loaded but not displayed on the screen yet
    override func viewDidLoad() {
        super.viewDidLoad()

        backgroundImageView.image = UIImage(named: restaurant.image)
        
        // Applying a blur effect
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        // Makes the blue effect the entire view bounds
        blurEffectView.frame = view.bounds
        backgroundImageView.addSubview(blurEffectView)
        
        let moveRightTransform = CGAffineTransform.init(translationX: 600, y: 0)
        let scaleUpTransform = CGAffineTransform.init(scaleX: 5.0, y: 5.0)
        // The following combines transforms together
        let moveScaleTransform = scaleUpTransform.concatenating(moveRightTransform)
        
        // Make the buttons invisible
        for rateButton in rateButtons {
            rateButton.alpha = 0
            rateButton.transform = moveScaleTransform
        }
        
        let moveUpTransform = CGAffineTransform.init(translationX: 0, y: -5000)
        closeButton.alpha = 0
        closeButton.transform = moveUpTransform
    }
    
    // This is called after viewDidLoad when the view is about to appear on the screen
    override func viewWillAppear(_ animated: Bool) {
//        // Adds fade in effect to the buttons - all the buttons fade in at the same time
//        UIView.animate(withDuration: 2.0, animations: {
//            self.rateButtons[0].alpha = 1.0
//            self.rateButtons[1].alpha = 1.0
//            self.rateButtons[2].alpha = 1.0
//            self.rateButtons[3].alpha = 1.0
//            self.rateButtons[4].alpha = 1.0
//        })
        
        var delay = 0.1
        for index in 0..<rateButtons.count {
            // Adds fade in effect to buttons - each buttons fades in slightly after the other
            UIView.animate(withDuration: 0.4, delay: delay, usingSpringWithDamping: 0.6, initialSpringVelocity: 0, options: [], animations: {
                self.rateButtons[index].alpha = 1.0
                // Setting the button's transform back to .identity resets it to its original position
                self.rateButtons[index].transform = .identity
            }, completion: nil)
            delay = delay + 0.05
        }
        
        // Adds fade in & slide in from top effect on close button
        UIView.animate(withDuration: 0.4, delay: 0.3, animations: {
            self.closeButton.alpha = 1.0
            self.closeButton.transform = .identity
        })
    }
}
