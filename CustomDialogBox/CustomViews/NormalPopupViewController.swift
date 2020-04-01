//
//  NormalPopup.swift
//  CustomDialogBox
//
//  Created by Shubham Singh on 01/04/20.
//  Copyright © 2020 Shubham Singh. All rights reserved.
//

import UIKit

class NormalPopupViewController: UIViewController {
    
    static let identifier = "NormalPopupViewController"
    
    //MARK:- outlets for the viewController
    @IBOutlet weak var dialogBoxView: UIView!
    @IBOutlet weak var okayButton: UIButton!
    
    //MARK:- lifecyle methods for the view controller
    override func viewDidLoad(){
        super.viewDidLoad()
        
        //adding an overlay to the view to give focus to the dialog box
        view.backgroundColor = UIColor.black.withAlphaComponent(0.50)

        //customizing the dialog box view
        dialogBoxView.layer.cornerRadius = 6.0
        dialogBoxView.layer.borderWidth = 1.2
        dialogBoxView.layer.borderColor = UIColor(named: "dialogBoxGray")?.cgColor
        
        //customizing the okay button
        okayButton.backgroundColor = UIColor(named: "primaryBackground")?.withAlphaComponent(0.85)
        okayButton.setTitleColor(UIColor.white, for: .normal)
        okayButton.layer.cornerRadius = 4.0
        okayButton.layer.borderWidth = 1.2
        okayButton.layer.borderColor = UIColor(named: "primaryBackground")?.cgColor
    }
    
    //MARK:- outlet functions for the viewController
    @IBAction func okayButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    //MARK:- functions for the viewController
    static func showPopup(parentVC: UIViewController){
        
        //creating a reference for the dialogView controller
        if let popupViewController = UIStoryboard(name: "CustomView", bundle: nil).instantiateViewController(withIdentifier: "NormalPopupViewController") as? NormalPopupViewController {
            popupViewController.modalPresentationStyle = .custom
            popupViewController.modalTransitionStyle = .crossDissolve
            
            //presenting the pop up viewController from the parent viewController
            parentVC.present(popupViewController, animated: true)
        }
    }
}



