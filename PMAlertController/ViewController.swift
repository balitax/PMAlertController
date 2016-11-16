//
//  ViewController.swift
//  PMAlertController
//
//  Created by Paolo Musolino on 07/05/16.
//  Copyright © 2016 Codeido. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func showAlert(_ sender: AnyObject) {
        
		let alertVC = PMAlertController(title: "ALERT", description: "Token invalid!", image: nil, titleColor: UIColor.blue , descriptionColor: UIColor.red, style: .alert)
		
			//Image by freepik.com, taken on flaticon.com

//        alertVC.addAction(PMAlertAction(title: "Cancel", style: .cancel, action: { () -> Void in
//            print("Cancel")
//        }))
//        
		alertVC.addAction(PMAlertAction(title: "OK", buttonColor: UIColor.blue, style: .default, action: { () in
            print("OK")
        }))
		
		
        
        self.present(alertVC, animated: true, completion: nil)
    }
    
    @IBAction func showWalkthrough(_ sender: AnyObject) {
        
        let alertVC = PMAlertController(title: "Locate your device", description: "Enables access to your location: discover what you can do when you're traveling and what is available near you.", image: UIImage(named: "flag.png"), titleColor: UIColor.blue , descriptionColor: UIColor.red, style: .walkthrough) //Image by freepik.com, taken on flaticon.com
        
        alertVC.addAction(PMAlertAction(title: "Cancel", buttonColor: UIColor.blue, style: .cancel, action: { () -> Void in
            print("Cancel")
        }))
        
        alertVC.addAction(PMAlertAction(title: "Allow", buttonColor: UIColor.blue, style: .default, action: { () in
            print("Allow")
        }))
        
        self.present(alertVC, animated: true, completion: nil)
    }
    
    @IBAction func showAlertWith3Buttons(_ sender: AnyObject) {
        
        let alertVC = PMAlertController(title: "Locate your device", description: "Enables access to your location: discover what you can do when you're traveling and what is available near you.", image: UIImage(named: "flag.png"), titleColor: UIColor.blue, descriptionColor: UIColor.red, style: .alert) //Image by freepik.com, taken on flaticon.com
        
        alertVC.addAction(PMAlertAction(title: "Cancel", buttonColor: UIColor.blue, style: .cancel, action: { () -> Void in
            print("Cancel")
        }))
        
        alertVC.addAction(PMAlertAction(title: "No Thanks", buttonColor: UIColor.blue, style: .cancel, action: { () in
            print("No thanks")
        }))
        
        alertVC.addAction(PMAlertAction(title: "Allow", buttonColor: UIColor.blue, style: .default, action: { () in
            print("Allow")
        }))
        
        self.present(alertVC, animated: true, completion: nil)
    }
    
    @IBAction func showWalkthroughWith3Buttons(_ sender: AnyObject) {
        let alertVC = PMAlertController(title: "Locate your device", description: "Enables access to your location: discover what you can do when you're traveling and what is available near you.", image: UIImage(named: "flag.png"), titleColor: UIColor.blue , descriptionColor: UIColor.red, style: .walkthrough) //Image by freepik.com, taken on flaticon.com
        
        alertVC.addAction(PMAlertAction(title: "Cancel", buttonColor: UIColor.blue, style: .cancel, action: { () -> Void in
            print("Cancel")
        }))
        
        alertVC.addAction(PMAlertAction(title: "No Thanks", buttonColor: UIColor.blue, style: .cancel, action: { () in
            print("No thanks")
        }))
        
        alertVC.addAction(PMAlertAction(title: "Allow", buttonColor: UIColor.blue, style: .default, action: { () in
            print("Allow")
        }))
        
        self.present(alertVC, animated: true, completion: nil)
    }
}
