//
//  PMAlertController.swift
//  PMAlertController
//
//  Created by Paolo Musolino on 07/05/16.
//  Copyright © 2016 Codeido. All rights reserved.
//

import UIKit

public enum PMAlertControllerStyle : Int {
    
    case alert // with this style, the alert has the width of 270, like the UIAlertController of Apple
    case walkthrough //with walkthrough, the alert has the width of the screen minus 18 from the left and the right bounds. This mode is designed to suggest to the user actions for accept localization, push notifications and more.
}

open class PMAlertController: UIViewController {
    
    
    @IBOutlet weak var alertMaskBackground: UIImageView!
    @IBOutlet weak var alertView: UIView!
    @IBOutlet weak var alertViewWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var alertImage: UIImageView!
    @IBOutlet weak var alertImageHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var alertTitle: UILabel!
    @IBOutlet weak var alertDescription: UILabel!
    @IBOutlet weak var alertActionStackView: UIStackView!
    @IBOutlet weak var alertStackViewHeightConstraint: NSLayoutConstraint!
    var ALERT_STACK_VIEW_HEIGHT : CGFloat = UIScreen.main.bounds.height < 568.0 ? 40 : 62 //if iphone 4 the stack_view_height is 40, else 62
    var animator : UIDynamicAnimator?
    
    open var gravityDismissAnimation = true

    
    //MARK: - Init
	public convenience init(title: String, description: String, image: UIImage?, titleColor: UIColor, descriptionColor: UIColor , style: PMAlertControllerStyle) {
        self.init()
        
        let nib = loadNibAlertController()
        if nib != nil{
            self.view = nib![0] as! UIView
        }
        
        self.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        self.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        
        alertView.layer.cornerRadius = 5
        (image != nil) ? (alertImage.image = image) : (alertImageHeightConstraint.constant = 0)
        alertTitle.text = title
		alertTitle.textColor = titleColor
		
		alertDescription.text = description
		alertDescription.textColor = descriptionColor
		
        //if alert width = 270, else width = screen width - 36
        style == .alert ? (alertViewWidthConstraint.constant = 270) : (alertViewWidthConstraint.constant = UIScreen.main.bounds.width - 36)
        
        
        setShadowAlertView()
    }
    
    //MARK: - Actions
    open func addAction(_ alertAction: PMAlertAction){
        alertActionStackView.addArrangedSubview(alertAction)
        
        if alertActionStackView.arrangedSubviews.count > 2{
            alertStackViewHeightConstraint.constant = ALERT_STACK_VIEW_HEIGHT * CGFloat(alertActionStackView.arrangedSubviews.count)
            alertActionStackView.axis = .vertical
        }
        else{
            alertStackViewHeightConstraint.constant = ALERT_STACK_VIEW_HEIGHT
            alertActionStackView.axis = .horizontal
        }
        
        alertAction.addTarget(self, action: #selector(PMAlertController.dismissAlertController(_:)), for: .touchUpInside)
        
    }
    
    func dismissAlertController(_ sender: PMAlertAction){
        self.animateDismissWithGravity()
        self.dismiss(animated: true, completion: nil)
    }
    
    //MARK: - Customizations
    fileprivate func setShadowAlertView(){
        alertView.layer.masksToBounds = false
        alertView.layer.shadowOffset = CGSize(width: 0, height: 0)
        alertView.layer.shadowRadius = 8
        alertView.layer.shadowOpacity = 0.3
    }
    
    fileprivate func loadNibAlertController() -> [AnyObject]?{
        let podBundle = Bundle(for: self.classForCoder)
        
        if let bundleURL = podBundle.url(forResource: "PMAlertController", withExtension: "bundle") {
            
            if let bundle = Bundle(url: bundleURL) {
                return bundle.loadNibNamed("PMAlertController", owner: self, options: nil) as [AnyObject]?
            }
            else {
                assertionFailure("Could not load the bundle")
            }
            
        }
        else if let nib = Bundle.main.loadNibNamed("PMAlertController", owner: self, options: nil) {
            return nib as [AnyObject]?
        }
        else{
            assertionFailure("Could not create a path to the bundle")
        }
        return nil
    }
    
    //MARK: - Animations
    
    fileprivate func animateDismissWithGravity(){
        if gravityDismissAnimation == true{
            animator = UIDynamicAnimator(referenceView: self.view)
            
            let gravityBehavior = UIGravityBehavior(items: [alertView])
            gravityBehavior.gravityDirection = CGVector(dx: 0, dy: 10)
            
            animator?.addBehavior(gravityBehavior)
            
            let itemBehavior = UIDynamicItemBehavior(items: [alertView])
            itemBehavior.addAngularVelocity(-3.14*2, for: alertView)
            animator?.addBehavior(itemBehavior)
        }
    }
}
