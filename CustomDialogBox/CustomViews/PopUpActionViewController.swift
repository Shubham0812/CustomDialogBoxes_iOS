//
//  PopupActionViewController.swift
//  CustomDialogBox
//
//  Created by Shubham Singh on 01/04/20.
//  Copyright © 2020 Shubham Singh. All rights reserved.
//

import UIKit

//Protocol to inform the Parent viewController to take some action based on the dialog box
protocol PopUpProtocol {
    func handleAction(action: Bool)
}

class PopUpActionViewController: UIViewController {
    
    static let identifier = "PopUpActionViewController"
    
    var delegate: PopUpProtocol?
    
    //MARK:- outlets for the view controller
    @IBOutlet weak var dialogBoxView: UIView!
    @IBOutlet weak var gotoStoreButton: UIButton!
    @IBOutlet weak var laterButton: UIButton!
    
    //MARK:- lifecyle methods for the view controller
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //adding an overlay to the view to give focus to the dialog box
        view.backgroundColor = UIColor.black.withAlphaComponent(0.50)
        
        //customizing the dialog box view
        dialogBoxView.layer.cornerRadius = 6.0
        dialogBoxView.layer.borderWidth = 1.2
        dialogBoxView.layer.borderColor = UIColor(named: "dialogBoxGray")?.cgColor
        
        //customizing the go to app store button
        gotoStoreButton.backgroundColor = UIColor(named: "primaryBackground")?.withAlphaComponent(0.85)
        gotoStoreButton.setTitleColor(UIColor.white, for: .normal)
        gotoStoreButton.layer.borderWidth = 1.2
        gotoStoreButton.layer.cornerRadius = 4.0
        gotoStoreButton.layer.borderColor = UIColor(named: "primaryBackground")?.cgColor
    }
    
    //MARK:- outlet functions for the viewController
    @IBAction func goToStorePressed(_ sender: Any) {
        self.delegate?.handleAction(action: true)
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func laterButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    //MARK:- functions for the viewController
    static func showPopup(parentVC: UIViewController){
        //creating a reference for the dialogView controller
        if let popupViewController = UIStoryboard(name: "CustomView", bundle: nil).instantiateViewController(withIdentifier: "PopUpActionViewController") as? PopUpActionViewController {
            popupViewController.modalPresentationStyle = .custom
            popupViewController.modalTransitionStyle = .crossDissolve
            
            //setting the delegate of the dialog box to the parent viewController
            popupViewController.delegate = parentVC as? PopUpProtocol

            //presenting the pop up viewController from the parent viewController
            parentVC.present(popupViewController, animated: true)
        }
    }
    
}
