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
    
    @IBOutlet weak var dialogBoxView: UIView!
    @IBOutlet weak var okayButton: UIButton!
    

    //MARK:- lifecyle methods for the view controller
    override func viewDidLoad(){
        super.viewDidLoad()
        view.backgroundColor = .white
        view.backgroundColor = UIColor.black.withAlphaComponent(0.50)

        dialogBoxView.layer.cornerRadius = 6.0
        dialogBoxView.layer.borderWidth = 1.2
        dialogBoxView.layer.borderColor = UIColor(named: "dialogBoxGray")?.cgColor
        
        okayButton.backgroundColor = UIColor(named: "primaryBackground")?.withAlphaComponent(0.85)
        okayButton.setTitleColor(UIColor.white, for: .normal)
        okayButton.layer.borderWidth = 1.2
        okayButton.layer.cornerRadius = 4.0
        okayButton.layer.borderColor = UIColor(named: "primaryBackground")?.cgColor
        
    }
    
    
    static func showPopup(presentVC: UIViewController){
        if let popupViewController = UIStoryboard(name: "CustomView", bundle: nil).instantiateViewController(withIdentifier: "NormalPopupViewController") as? NormalPopupViewController {
            popupViewController.modalPresentationStyle = .custom
            popupViewController.modalTransitionStyle = .crossDissolve
            presentVC.present(popupViewController, animated: true)
        }
    }

    @IBAction func okayButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}



