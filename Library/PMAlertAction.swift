//
//  PMAlertAction.swift
//  PMAlertController
//
//  Created by Paolo Musolino on 07/05/16.
//  Copyright © 2016 Codeido. All rights reserved.
//

import UIKit

public enum PMAlertActionStyle : Int {
    
    case `default`
    case cancel
}

open class PMAlertAction: UIButton {
    
    fileprivate var action: (() -> Void)?
    
    var separator = UIImageView()
    
	public convenience init(title: String?, buttonColor: UIColor, style: PMAlertActionStyle, action: (() -> Void)? = nil){
        self.init()
        
        self.action = action
        self.addTarget(self, action: #selector(PMAlertAction.tapped(_:)), for: .touchUpInside)
        
        self.setTitle(title, for: UIControlState())
        self.titleLabel?.font = UIFont(name: "Avenir-Heavy", size: 17)
		self.setTitleColor(buttonColor, for: .normal)
        
//        style == .default ? (self.setTitleColor(UIColor(red: 191.0/255.0, green: 51.0/255.0, blue: 98.0/255.0, alpha: 1.0), for: UIControlState())) : (self.setTitleColor(UIColor.gray, for: UIControlState()))

		style == .default ? (self.setTitleColor(buttonColor, for: UIControlState())) : (self.setTitleColor(UIColor.gray, for: UIControlState()))

		
        self.addSeparator()
    }
    
    func tapped(_ sender: PMAlertAction) {
        self.action?()
    }
    
    fileprivate func addSeparator(){
        separator.backgroundColor = UIColor.lightGray.withAlphaComponent(0.2)
        self.addSubview(separator)
        
        // Autolayout separator
        separator.translatesAutoresizingMaskIntoConstraints = false
        separator.topAnchor.constraint(
            equalTo: self.topAnchor).isActive = true
        separator.leadingAnchor.constraint(
            equalTo: self.layoutMarginsGuide.leadingAnchor, constant: 8).isActive = true
        separator.trailingAnchor.constraint(
            equalTo: self.layoutMarginsGuide.trailingAnchor, constant: -8).isActive = true
        separator.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
}
